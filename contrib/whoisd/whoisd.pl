#!/usr/bin/perl
# coded by epoch.
# use inetd or tcpserver or something else.
# waste of time to do manual sockets for something like this.
# this isn't my baby. you can murder it if you want.

use strict;

my $RESDB = "/services/resdb/resdb";

my $QUERY=<stdin>;
$QUERY =~ s/\r\n//g;
my $out;
my $title;
my $value;
my @parts;
my $i;

# ASNs
if($QUERY =~ m/^AS(.+?)$/) {
 printf "%% AS section for %s\n", $QUERY;
 my $AS=$1;
 chdir("$RESDB/db/as");
 if(chdir($AS)) {
  foreach(split(/\n/,`grep '' -r .`)) {
   $out = $_;
   $out =~ s/^\.\///g;
   $out =~ m/^(.+?):(.+?)$/;
   ($title, $value) = ($1, $2);
   printf "%-20s %s\n", $title . ":", $value;
   if($title eq "owner") {
    $QUERY = $value;
   }
  }
 } else {
  printf "AS not found.";
 }
}

# IPv4 addresses
if($QUERY =~ m/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/) {
 printf "%% IP section for %s\n", $QUERY;
 chdir("$RESDB/db/ip");
 @parts=split(/\./,$QUERY);
 for($i=0;$i<scalar(@parts)-1;$i++) {
  if(!chdir(sprintf("%02x",$parts[$i]))) {
   printf "%-20s %s\n", "error" . ":", "IP not found.";
   exit;
  }
 }
 foreach(split(/\n/,`grep '' -r .`)) {
  $out = $_;
  $out =~ s/^\.\///g;
  ($title, $value) = split(/:/,$out);
  printf "%-20s %s\n", $title . ":", $value;
  if($title eq "owner") {
   $QUERY = $value;
  }
 }
}


# if we get here and there's still a . in the query it is probably a domain.
if($QUERY =~ m/\./) {
 printf "%% domain section for %s\n", $QUERY;
 @parts=split(/\./,$QUERY);
 chdir("$RESDB/db/dom");
 for($i=scalar(@parts)-1;$i>=0;$i--) {
  chdir($parts[$i]);
 }
 foreach(split(/\n/,`grep '' -r .`)) {
  $out = $_;
  $out =~ s/^\.\///g;
  $out =~ m/^(.+?):(.+?)$/;
  ($title, $value) = ($1, $2);
  printf "%-20s %s\n", $title . ":", $value;
  if($title eq "owner") {
   $QUERY = $value;
  }
 }
}

# default to assuming it is a name.
printf "%% user section for %s\n", $QUERY;

chdir("$RESDB/db/usr");
if(chdir($QUERY)) {
 foreach(split(/\n/,`grep '' -r .`)) {
  $out = $_;
  $out =~ s/^\.\///g;
  $out =~ m/^(.+?):(.+?)$/;
  ($title, $value) = ($1, $2);
  printf "%-20s %s\n", $title . ":", $value;
 }
} else {
 printf "%-20s missing db/usr file.\n", "warning" . ":";
}
chdir("$RESDB/db/as");
foreach(split(/\n/,`grep '^$QUERY\$' */owner | cut -d/ -f1`)) {
 $out = $_;
 $out =~ s/\n//g;
 printf "%-20s %s\n", "ASN" . ":", $out;
}

foreach(split(/\n/,`grep -i -e "^$QUERY\$" "$RESDB/db/dom"/*/*/owner`)) {
 $out = $_;
 $out =~ s/.*\/db\/dom\/(.+?)\/(.+?)\/owner.*/\2\.\1/;
 if ($out ne "") { #fix this comparison.
  printf "%-20s %s\n", "domain" . ":", $out;
 }
}
#printf "%-20s %s\n", "notice:","$QUERY did not claim any domains yet";
