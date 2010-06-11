#!/usr/bin/php
<?php
$mynode = array_key_exists('LOCALNODE',$_SERVER)?$_SERVER['LOCALNODE']:0;

$fds = NULL;
$proc = proc_open('birdc', array(0 => array('pipe','r'), 1 => array('pipe','w'), 2 => STDERR), $fds);
fwrite($fds[0], "show route all\n");
fclose($fds[0]);
$paths = array();

while (!feof($fds[1])) {
	$line = stream_get_line($fds[1], 1024, "\n");
	if ($line === NULL || $line === FALSE) break;
	if (!strlen($line) || $line[0] != "\t") continue;
	if (substr($line, 0, 14) != "\tBGP.as_path: ") continue;
	$path = substr($line, 14);
	if (in_array($path, $paths)) continue;
	$paths[] = $path;
	print($mynode.' '.$path."\n");
}
