#!/usr/bin/php
<?php
$nodes = array();

$file = STDIN;

while (!feof($file)) {
	$line = stream_get_line($file, 1024, "\n");
	if ($line === NULL) break;
	if (!strlen($line)) continue;
	$pathnodes = explode(' ', $line);
	$prevnode = NULL;
	foreach ($pathnodes as $node) {
		if ($prevnode && $node) $nodes[$prevnode][$node] = 1;
		$prevnode = $node;
	}
}

foreach ($nodes as $node => $links) {
	foreach ($links as $link => $dummy) {
		if ($node != $link && isset($nodes[$node][$link]) && isset($nodes[$link][$node])) unset($nodes[$link][$node]);
	}
}

function nodename ($node) { switch ($node) {
 case '64731': return 'SRN (AS64731)';
}; return 'AS'.$node; };

$nodelist=array();
foreach ($nodes as $node => $links) {
 if (!array_key_exists($node,$nodelist)) $nodelist[$node]=nodename($node);
 foreach ($links as $link => $dummy)
  if (!array_key_exists($link,$nodelist)) $nodelist[$link]=nodename($link);
};

print("graph BGP_nodes {\n");
foreach ($nodelist as $node => $name)
 print "\t".$node.' [label="'.$name.'"];'."\n";

foreach ($nodes as $node => $links) {
	foreach ($links as $link => $dummy) {
		print("\t".$node.' -- '.$link.";\n");
	}
}
print('}');
