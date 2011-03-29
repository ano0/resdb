<?php
// Copyright Atiti, 2011
// Version 0.1-2

// Where are we at?
$SERVICEURL = "http://powerfulproxy.com/do_it.php/";
// Do da request
function get_url($url, $data) {
	if (!$url) {
		echo "Invalid use!";
		die;
	}
   	 $options = array(
        	CURLOPT_RETURNTRANSFER => true,     // return web page
        	CURLOPT_HEADER         => false,    // don't return headers
        	CURLOPT_FOLLOWLOCATION => true,     // follow redirects
       		CURLOPT_ENCODING       => "",       // handle all encodings
        	CURLOPT_USERAGENT      => "AnoNet proxy", // who am i
        	CURLOPT_AUTOREFERER    => true,     // set referer on redirect
        	CURLOPT_CONNECTTIMEOUT => 15,      // timeout on connect
        	CURLOPT_TIMEOUT        => 28,      // timeout on response
        	CURLOPT_MAXREDIRS      => 10,       // stop after 10 redirects
		CURLOPT_FAILONERROR    => true,
//		CURLOPT_PROXY	       => "http://b.polipo.srn.ano:8000/",
   	 );
	$ch = curl_init ($url);
	curl_setopt_array( $ch, $options );
	$fields_string = "";
	if (count($data)) {
		foreach($data as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
		rtrim($fields_string,'&');
		curl_setopt($ch, CURLOPT_POST, count($data));
		curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
	}
	$ret  = curl_exec ($ch);
	if ($error = curl_error($ch)) 
		echo 'ERROR: ',$error;
	$info = curl_getinfo($ch);
	return array("data"=>$ret,"info"=>$info);
}
// Rewrite relative paths
function rewriteRelative($html, $base) {
	$server = preg_replace('@^([^\:]*)://([^/*]*)(/|$).*@', '\1://\2/', $base);
	$html = preg_replace('@\<([^>]*) (href|src)="/([^"]*)"@i', '<\1 \2="' . $server . '\3"', $html);
	$html = preg_replace('@\<([^>]*) (href|src)="(([^\:"])*|([^"]*:[^/"].*))"@i', '<\1 \2="' . $base . '\3"', $html);
	return $html;
}
if (isset($_SERVER["PATH_INFO"]))
	$p = $_SERVER["PATH_INFO"];
if (isset($_SERVER["QUERY_STRING"]))
	$q = $_SERVER["QUERY_STRING"];
$postdata = $_POST;
$pall = explode("/", $p);
if (count($pall) <= 1) {
	echo "Wrong host format? or smtg.";
	die;
}
$proto = $pall[1];
$host = $pall[2];
unset($pall[0]);
unset($pall[1]);
unset($pall[2]);
$path = implode("/", $pall);
// Figure out relative paths
$pi = pathinfo($path);
if ($pi) {
	$rp = @$pi["dirname"];
} else
	$rp = "";
if (!$rp)
	$rp = $path;
// Construct request url
$geturl = $proto."://".$host."/".$path;
if ($q)
	$geturl .= "?".$q; // Append query string

$d = get_url($geturl, $postdata);
$data = $d["data"];
$ct = $d["info"]["content_type"];
$ct_s = explode(";", $ct);
$found = false;
$match_ct = array("text/html", "text/xml", "text/plain");
foreach($match_ct as $m) {
	if ($ct_s[0] == $m)
		$found = true;
}
if ($found) { // Only rewrite for proper content
	$ret = rewriteRelative($data, $proto."://".$host."/".$rp."/");
	$ret = preg_replace('@(https?://([-\w\.]+)+(:\d+)?(/([\w/_\.]*(\?\S+)?)?)?)@', $SERVICEURL.str_replace("http://", "http/", "$1"), $ret);
	$ret = str_replace(".php/http://", ".php/http/", $ret);
	$ret = str_replace(".php/https://", ".php/https/", $ret);

	$ret = str_replace("../", "", $ret);
	$items = Array("/src='\/(.*)'/", "/src=\"\/(.*)\"/", "/href='\/(.*)'/", "/href=\"\/(.*)\"/");
	$ret = preg_replace($items, "src='".$SERVICEURL.$proto."/".$host."/$1'", $ret);
	$ret = preg_replace("/action=\"\/\"/i", "action=\"".$SERVICEURL.$proto."/".$host."/\"", $ret);

} else
	$ret = "";
// Output da shit
header("Content-Type: ".$ct);
if (strlen($ret) == 0)
	echo $data;
else
	echo $ret;

?>
