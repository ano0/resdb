#!/usr/bin/php
<?php
$sock = fsockopen('localhost', 2605);
fread($sock, 1024);
fwrite($sock, "insecure\n");
fwrite($sock, "show ip bgp paths\n");
fwrite($sock, "quit\n");
while (!feof($sock)) {
	$line = stream_get_line($sock, 1024, "\r\n");
	if ($line === NULL || $line === FALSE) break;
	if (!strlen($line) || $line[0] != '[') continue;
	$pos = strpos($line, ') ');
	if ($pos === FALSE) continue;
	if ($pos == strlen($line) - 2) continue;
	print(substr($line, $pos+2)."\n");
}
