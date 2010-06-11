#!/usr/bin/php
<?php
$mynode = array_key_exists('LOCALNODE',$ENV)?$ENV['LOCALNODE']:0;

$file = STDIN;
$paths = array();

while (!feof($file)) {
	if (seekto($file, '<as-path>') === FALSE) break;
	seekto($file, '<segment');
	seekto($file, '>');
	$endofsection = FALSE;
	$path = $mynode;
	while (!feof($file)) {
		if (seekto($file, '<') === FALSE) break;
		switch (fread($file, 4)) {
			case 'asn>': break;
			case '/seg': $endofsection = TRUE; break;
			default: die('unknown tag at '.(ftell($file)-4));
		}
		if ($endofsection) break;
		$asn = seekto($file, '</asn>');
		$path .= ' '.$asn;
	}
	if (in_array($path, $paths)) continue;
	$paths[] = $path;
	print($path."\n");
}

function seekto($f, $str) {
	$part = '';
	$i = 0;
	$len = strlen($str);
	while ($i < $len && !feof($f)) {
		$c = fgetc($f);
		if ($c === FALSE) return FALSE;
		if ($c == $str[$i]) {
			$i++;
		} else {
			if ($i) {
				$i = 0;
				$part = '';
			}
			$part .= $c;
		}
	}
	return $part;
} 
