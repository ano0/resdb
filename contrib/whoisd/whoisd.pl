#!/usr/bin/env perl
# ncat -klp 43 -e ./whoisd.pl
# use inetd or tcpserver or ncat

use strict;

#maybe chroot this whoisd?
my $RESDB = "/services/resdb/resdb";

my $HACK=0;
my $QUERY=<stdin>;
$QUERY =~ s/\r\n//g;
$QUERY =~ s/\///g;
if($QUERY eq '') {
 printf "%% error. no query. wtf?";
 exit 0;
}
my $out;
my $title;
my $value;
my @value;
my @parts;
my $i;
my $d;

my $user;

if($QUERY eq "!!\n") {
 $QUERY=<stdin>;
 $QUERY =~ s/^!r(.+?)[\/,].*$/\1/;
 printf "A500\n"; #fake this I guess. Does it even use that number for anything?
 printf "%% Looks like you're trying -A on a BSDian traceroute with this server.\n";
 $HACK=1;
}

sub get_user_from_ASN {
 my $AS=$_[0];
 my $user;
 chdir("$RESDB/db/as") || die "%% error";
 if(chdir($AS) || die "%% ASN not found.") {
  open(FILE,"owner") || die "%% ASN's owner not found.";
  $user=<FILE>;
  close(FILE);
 } else {
  printf "%% AS not found.";
 }
 return $user;
}

sub get_user_from_IPv4 {
 my @parts;
 my $user;
 chdir("$RESDB/db/ip") || die "%% error";
 @parts=split(/\./,$_[0]);
 for($i=0;$i<scalar(@parts)-1;$i++) {
  if(!chdir(sprintf("%02X",$parts[$i]))) {
   printf "%-20s %s\n", "error" . ":", "IP not found." unless $HACK;
   exit;
  }
 }
 open(FILE,"owner") || die "%% IP not found."; 
 $user=<FILE>;
 close(FILE);
 return $user;
}

sub get_user_from_domain {
 my @parts;
 my $user;
 my $i;
 @parts=split(/\./,$_[0]);
 chdir("$RESDB/db/dom") || die "%% error";
 for($i=scalar(@parts)-1;$i>scalar(@parts)-3;$i--) {
  if(!$parts[$i]) {
   printf "%% error";
   exit
  }
  if(!chdir($parts[$i])) {
   printf "%-20s %s", "warning" . ":", "domain not found.";
   exit;
  }
 }
 open(FILE,"owner") || die "%% IP's owner not found."; 
 $user=<FILE>;
 close(FILE);
 return $user;
}

sub get_user_from_IPv6 {
 chdir("$RESDB/db/ip6") || die "%% error. no resdb/db/ip6\n";
 $d=$_[0];
 #print "$d";
 $d =~ s/[^0-9a-f]//gi;
 $d =~ tr/a-z/A-Z/;
 foreach(split(//,$d)) {
  $d=$_;
  chdir($d);
 }
 open(FILE,"owner") || die "%% IP6's owner not found."; 
 $user=<FILE>;
 close(FILE);
 return $user;
}

sub ASN_lookup {
 if($QUERY =~ m/^AS(.+?)$/) {
  printf "%% AS section for %s\n", $QUERY;
  my $AS=$1;
  chdir("$RESDB/db/as") || die "%% error";
  if(chdir($AS) || die "%% error") {
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
}


# IPv4 addresses #this checks all dirs in the ip dir. so, 1., 2., and 21. (15)
sub IPv4_lookup {
 if($QUERY =~ m/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/) {
  printf "%% IP section for %s\n", $QUERY unless $HACK;
  chdir("$RESDB/db/ip") || die "%% error";
  @parts=split(/\./,$QUERY);
  for($i=0;$i<scalar(@parts)-1;$i++) {
   if(!chdir(sprintf("%02X",$parts[$i]))) {
    printf "%-20s %s\n", "error" . ":", "IP not found." unless $HACK;
    exit;
   }
  }
  foreach(split(/\n/,`grep '' -r .`)) {
   $out = $_;
   $out =~ s/^\.\///g;
   ($title, @value) = split(/:/,$out);
   $value=join(":",@value);
   printf "%-20s %s\n", $title . ":", $value unless $HACK;
   if($title eq "owner") {
    $QUERY = $value ;
   }
  }
 }
}


# if we get here and there's still a . in the query it is probably a domain.
sub domain_lookup {
 if($QUERY =~ m/\./) {
  printf "%% domain section for %s\n", $QUERY;
  @parts=split(/\./,$QUERY);
  chdir("$RESDB/db/dom") || die "%% error";
  for($i=scalar(@parts)-1;$i>scalar(@parts)-3;$i--) {
   if(!$parts[$i]) {
    printf "%% error";
    exit
   }
   if(!chdir($parts[$i])) {
    printf "%-20s %s", "warning" . ":", "domain not found.";
    exit;
   }
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
}


#IPv6 addresses
sub IPv6_lookup {
 if($QUERY =~ m/:/) {#close enough?
  $QUERY =~ s/://g;
  $QUERY =~ s/[^a-fA-F0-9]//g;
  $QUERY = uc($QUERY);
  chdir("$RESDB/db/ip6");
  foreach(split(//,$QUERY)) {
   chdir($_);;
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
}

sub user_based_lookups {
 printf "%% user section for '%s'\n", $QUERY unless $HACK;

 chdir("$RESDB/db/usr") || die "%% error";
 if(chdir($QUERY)) {
  foreach(split(/\n/,`grep '' -r .`)) {
   $out = $_;
   $out =~ s/^\.\///g;
   $out =~ m/^(.+?):(.+?)$/;
   ($title, $value) = ($1, $2);
   printf "%-20s %s\n", $title . ":", $value unless $HACK;
  }
 } else {
  printf "%-20s missing db/usr file.\n", "warning" . ":" unless $HACK;
 }
 chdir("$RESDB/db/as") || die "%% error";
 my @asn;
 foreach(split(/\n/,`grep '^$QUERY\$' */owner | cut -d/ -f1`)) {
  $out = $_;
  $out =~ s/\n//g;
  printf "%-20s AS%s\n", "origin" . ":", $out if $HACK;
  printf "%-20s AS%s\n", "origin" . ":", $out unless $HACK;
  @asn[scalar(@asn)]=$out;
 }
 chdir("$RESDB/db/ip") || die "%% error";
 my $merp;
 foreach(split(/\n/,`grep '^$QUERY\$' */*/*/owner | cut -d/ -f1-3 | xargs printf '%s/cidr\n' | xargs cat | uniq`)) {
  chomp $_;
  printf "%-20s %s\n", "cidr" . ":", $_;
 }
 
 chdir("$RESDB/db/ip6") || die "%% error";
 foreach(split(/\n/,`grep '^$QUERY\$' -r * | cut -d/ -f1-16 | xargs printf '%s/cidr\n' | xargs cat | uniq`)) {
  chomp $_;
  printf "%-20s %s\n", "cidr" . ":", $_;
 }
 
 foreach(split(/\n/,`grep -i -e "^$QUERY\$" "$RESDB/db/dom"/*/*/owner`)) {
  $out = $_;
  $out =~ s/.*\/db\/dom\/(.+?)\/(.+?)\/owner.*/\2\.\1/;
  if ($out ne "") { #fix this comparison.
   printf "%-20s %s\n", "domain" . ":", $out;
  }
 }

 foreach(@asn) {
  $QUERY="AS$_"; #meh. fix to pass it instead of global.
  ASN_lookup();
 }
 #printf "%-20s %s\n", "notice:","$QUERY did not claim any domains yet";
}

if($QUERY =~ m/^AS(.+?)$/) {
 $user=get_user_from_ASN($1);
}
elsif($QUERY =~ m/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/) {
 $user=get_user_from_IPv4($QUERY);
}
elsif($QUERY =~ m/\./) {
 $user=get_user_from_domain($QUERY);
}
elsif($QUERY =~ m/:/) {
 $user=get_user_from_IPv6($QUERY);
}
else {
 $user=$QUERY;
}
$user =~ s/[\r\n]//g;
printf "%%%% %s", `git log -1 | head -n1`;
printf "%%%% found user: %s for the query.\n", $user;

#k. we got user... now to find stuff belonging to that user.

ASN_lookup($user);
IPv4_lookup($user);
domain_lookup($user);
IPv6_lookup($user);
$QUERY=$user;
user_based_lookups($user);
