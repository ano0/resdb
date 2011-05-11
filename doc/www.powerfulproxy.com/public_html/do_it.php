<?php
// Copyright Atiti, 2011
// Version 0.1-2
// Heavily modified by Ivo <Ivo@UCIS.nl>

if (!isset($_SERVER['PATH_INFO'])) die('PATH_INFO is not set');
$pall = explode("/", $_SERVER['PATH_INFO']);
if (count($pall) <= 1) die('Unexpected path format');
array_shift($pall);
$proto = array_shift($pall);
$host = array_shift($pall);
$hostparts = explode('.', $host);
if (ip2long(long2ip($host))===$host) {
 if ($hostparts[0]!='1') die('Bad IP');
} elseif (!preg_match("/ano|ntwrk$/",array_pop($hostparts))) die('Bad host');
$path = implode('/', $pall);
array_pop($pall);
$rp = implode('/', $pall);

/* CONFIGURATION */
$SERVICEURL = "http://powerfulproxy.com/do_it.php/";

$REWRITE_CONTENT_TYPES = array('text/html', 'text/xml', 'text/plain');
$REWRITE_PATTERNS = array(
/* Rewrite complete http/https URLs, enable one of the tree, and no more! */
//	'@(https?)://(([-\w\.]+)+(:\d+)?(/([\w/_\.]*(\?\S+)?)?)?)@i' => $SERVICEURL.'$1/$2',
//	'@(src|href|action)\s*=\s*(\'|")(https?)://([^\'"]*)\2@i' => '$1=$2'.$SERVICEURL.'$3/$4$2',
	'@(<[^>]*)(src|href|action)\s*=\s*(\'|")(https?)://([^\'"]*)\3@i' => '$1$2=$3'.$SERVICEURL.'$4/$5$3',
/* Rewrite URLs relative to site root, enable one of the tree, and no more! */
//	'@(src|href|action)\s*=\s*(\'|")/([^\'"]*)\2@i' => '$1=$2'.$SERVICEURL.$proto.'/'.$host.'/$3$2',
	'@(<[^>]*)(src|href|action)\s*=\s*(\'|")/([^\'"]*)\3@i' => '$1$2=$3'.$SERVICEURL.$proto.'/'.$host.'/$4$3',
);
$CURL_OPTIONS = array(
	CURLOPT_USERAGENT	=> "AnoNet proxy",
	CURLOPT_AUTOREFERER	=> TRUE,
	CURLOPT_CONNECTTIMEOUT	=> 15,
	CURLOPT_TIMEOUT		=> 28,
	CURLOPT_MAXREDIRS	=> 10,
	CURLOPT_FAILONERROR	=> FALSE,
	CURLOPT_HEADER		=> 1,
	CURLOPT_FOLLOWLOCATION	=> FALSE,
//	CURLOPT_INTERFACE	=> '0.0.0.0',
//	CURLOPT_PROXY		=> "http://b.polipo.srn.ano:8000/",
//	CURLOPT_PROXYUSERPWD	=> 'username:password',
);
/* END OF CONFIGURATION */

$url = $proto."://".$host."/".$path;
if (isset($_SERVER['QUERY_STRING']) && strlen($_SERVER['QUERY_STRING'])) $url .= "?".$_SERVER['QUERY_STRING'];
$ch = curl_init($url);
curl_setopt_array($ch, $CURL_OPTIONS);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
//curl_setopt($ch, CURLOPT_HEADER, FALSE);
if (count($_POST)) {
	curl_setopt($ch, CURLOPT_POST, TRUE);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $_POST);
}
$response = curl_exec($ch);
list($header, $data) = explode("\r\n\r\n", $response, 2); 
if ($error = curl_error($ch)) die('CURL ERROR: '.$error);
$info = curl_getinfo($ch);

header('Status: '.$info['http_code']);
header('Content-Type: '.$info['content_type']);

$redirurl = "";
if ($info['http_code'] === 301) {
	$headers = explode("\r\n", $header);
	foreach($headers as $h) {
		$cur_header = explode(": ", $h);
		if ($cur_header[0] == "Location") {
			$redirurl = preg_replace('@(https?://([-\w\.]+)+(:\d+)?(/([\w/_\.]*(\?\S+)?)?)?)@', $SERVICEURL.str_replace("http://", "http/", "$1"), $cur_header[1]);
			$redirurl = str_replace(".php/http://", ".php/http/", $redirurl);
			header('Location: '.$redirurl);
		}
	}
} else {
	if (in_array(strtok($info['content_type'], ';'), $REWRITE_CONTENT_TYPES)) $data = preg_replace(array_keys($REWRITE_PATTERNS), array_values($REWRITE_PATTERNS), $data, -1, $count);
}

header('Content-Length: '.strlen($data));
echo $data;
?>
