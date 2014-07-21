#!C:/Perl/bin/perl.exe

use strict;
use Prime;

my @prime = Prime::getPrimeList(2000000);
my $sum = 0;

foreach my $p (@prime) {
	$sum += $p;
}

print "sum = $sum\n";