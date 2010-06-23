#!/usr/bin/php
<?php
$client = $_SERVER['REMOTE_HOST'];
stream_set_timeout(STDIN, 10000);
stream_set_timeout(STDOUT, 10000);
println('220 Mailgate.VANet.org ready');

expect(STDIN, 'HELO ');
println('250 Hello');

expectMAILFROM:
$line = expect(STDIN, 'MAIL FROM:');
if ($line === FALSE) return;
else if ($line === TRUE) goto expectMAILFROM;
else if (preg_match('/<([a-zA-Z0-9.-_]+)@([a-zA-Z0-9-.-]+)>/', $line, $frommatches) != 1) {
	println('501 Syntax error');
	goto expectMAILFROM;
}
print("250 Sender accepted\r\n");

expectRCPTTO:
$line = expect(STDIN, 'RCPT TO:');
if ($line === FALSE) return;
else if ($line === TRUE) goto expectMAILFROM;
else if (preg_match('/<([a-zA-Z0-9.-_]+)@([a-zA-Z0-9-.-]+)>/', $line, $tomatches) != 1) {
	println('501 Syntax error');
	goto expectRCPTTO;
}
if (substr($tomatches[2], -19) == '.mailgate.vanet.org') {
	$tomatches[2] = substr($tomatches[2], 0, -19);
}
if (substr($tomatches[2], -4) != '.ano' && substr($client, 0, 2) != '1.') {
	println('550 Relay access denied');
	goto expectRCPTTO;
}

$rcptto = $tomatches[1].'@'.$tomatches[2];
if (substr($tomatches[2], -4) != '.ano') {
	$mailfrom = $frommatches[1].'@'.$frommatches[2].'.mailgate.vanet.org';
} else {
	$mailfrom = $frommatches[1].'@'.$frommatches[2];
}

if (getmxrr($tomatches[2], $mxes)) {
	$mx = $mxes[0];
} else {
	$mx = $tomatches[2];
}

$server = @fsockopen($mx, 25, $dummy, $dummy, 5000);
if ($server === FALSE) {
	println('450 Could not connect to destination server: '.$tomatches[2]);
	goto expectRCPTTO;
}
stream_set_timeout($server, 10000);

if (expectremote($server, '220') === FALSE) {
	fclose($server);
	goto expectRCPTTO;
}

println($server, 'HELO mailgate.vanet.org');
if (expectremote($server, '250') === FALSE) {
	fclose($server);
	goto expectRCPTTO;
}

println($server, 'MAIL FROM:<'.$mailfrom.'>');
if (expectremote($server, '250') === FALSE) {
	fclose($server);
	goto expectRCPTTO;
}

println($server, 'RCPT TO:<'.$rcptto.'>');
if (expectremote($server, '250') === FALSE) {
	fclose($server);
	goto expectRCPTTO;
}

print('250 Reciplient accepted: '.$rcptto);

$write = NULL;
$except = NULL;
while (TRUE) {
	$read = array(STDIN, $server);
	stream_select($read, $write, $except, NULL);
	if (in_array(STDIN, $read)) {
		$line = fread(STDIN, 1024);
		if ($line === NULL || !strlen($line)) break;
		fwrite($server, $line);
	}
	if (in_array($server, $read)) {
		$line = fread($server, 1024);
		if ($line === NULL || !strlen($line)) break;
		fwrite(STDOUT, $line);
	}
}
fclose($server);

function println($stream, $str = NULL) {
	if ($str === NULL) { $str = $stream; $stream = STDOUT; }
	fwrite($stream, $str."\r\n");
}
function expect($stream, $expect) {
	while (TRUE) {
		if (feof($stream)) return FALSE;
		$line = @stream_get_line($stream, 1024, "\r\n");
		if ($line === FALSE) return FALSE;
		if (substr($line, 0, strlen($expect)) == $expect) return $line;
		switch (substr($line, 0, 4)) {
			case 'HELO': case 'DATA': case 'MAIL': case 'RCPT':
				println('503 Bad sequence of commands');
				return TRUE;
		}
		println('500 Command not recognized');
	}
}
function expectremote($stream, $expect) {
	while (TRUE) {
		if (feof($stream)) {
			println('450 End of file from remote host');
			return FALSE;
		}
		$line = @stream_get_line($stream, 1024, "\r\n");
		if ($line === FALSE) {
			println('450 Error while reading from remote host');
			return FALSE;
		}
		if (substr($line, 0, 3) != $expect) {
			println('450'.$line[3].'Remote error: '.$line);
			if ($line[3] != '-') return FALSE;
		} else {
			if ($line[3] != '-') return $line;
		}
	}
}
