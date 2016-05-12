#!/usr/bin/perl

use autodie;

print "Get svn version as release edition number\n";

my $pfRevision;

my $pfpath = $ENV{'PWD'};

print $pfpath;
print "\n";


system("svn info $pfpath >>tempGetVersion");
open (FILE1,"tempGetVersion")||die "Couldn't open tempGetVersion";
$num1=<FILE1>;#print $num4;
$num2=<FILE1>;#print $num4;
$num3=<FILE1>;#print $num4;
$num4=<FILE1>;#print $num4;
$num5=<FILE1>;#print $num4;
$num6=<FILE1>;#print $num4;
$num7=<FILE1>;#print $num4;
$num8=<FILE1>;#print $num7;
$num9=<FILE1>;#print $num4;
$num10=<FILE1>;#print $num4;
$num11=<FILE1>;#print $num4;
$num12=<FILE1>;#print $num12;

$num7 =~ s/Revision: /Release_/g;
$num7 =~ s/[\r\n]//g;
$num11 =~ s/Last Changed Rev: /_/g;
$num11 =~ s/[\r\n]//g;
$num4 =~ s/Relative URL: \^\// /g;
$num4 =~ s/[\r\n]//g;
$num12 =~ s/Last Changed Date: / /g;
$num12 =~ s/\+0800.*$//g; 
$num12 =~ s/[\r\n]//g;
 
my $pre = "const char g_Reversion[]={\"";
my $suffix = "\"}\;";

$pfRevisionTemp="$num7$num11$num4$num12$suffix";
$pfRevisionTemp =~ tr/ /_/;
$pfRevisionTemp =~ s/://g;
$pfRevisionTemp =~ s/\//_/g;

$pfRevision="$pre$pfRevisionTemp";


open DATA,">getVerion.c";


print DATA "  //get platform path reversion information\n";

print DATA $pfRevision;
close FILE1;
close DATA;

unlink("tempGetVersion");



