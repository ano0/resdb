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

function static_nodename ($node) { switch ($node) {
// case '64731': return 'SRN (AS64731)';
// case '64766': return 'UFO (AS64766)';
}; return NULL; };

function nodenickname ($node) { switch ($node) {
 case '64731': return 'SRN';
 case '64766': return 'UFO';
 case '64768': return 'yang';
 case '64738': return 'welterde';
 case '64827': return 'deelkar';
}; return NULL; };

function nodename ($node) {
 $node=preg_replace('/[^0-9]+/','',$node);
 if (($name=static_nodename($node))!==NULL) return $name;
 $nameparts=array();
 if (($nick=nodenickname($node))!==NULL) $nameparts[]=$nick;
 $name=rtrim(`echo $node | ./asn2adminc | ./hdl2person`);
 if (empty($name)) $name='AS'.$node; else $name="AS$node ($name)";
 $nameparts[]=$name;
return join(' - ',$nameparts); };

$nodelist=array();
foreach ($nodes as $node => $links) {
 if (!array_key_exists($node,$nodelist)) $nodelist[$node]=nodename($node);
 foreach ($links as $link => $dummy)
  if (!array_key_exists($link,$nodelist)) $nodelist[$link]=nodename($link);
};

print("graph BGP_nodes {\n");
print("\toverlap=\"prism\";\n");
foreach ($nodelist as $node => $name)
 print "\t".$node.' [label="'.$name.'",URL="http://ix.ucis.dn42/dn42/db/asdetails.php?h='.$node.'"];'."\n";

foreach ($nodes as $node => $links) {
	foreach ($links as $link => $dummy) {
		print("\t".$node.' -- '.$link.";\n");
	}
}
print('}');
