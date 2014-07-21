#!C:/Perl/bin/perl.exe

use strict;

my $sum = 0;

for my $n (2 .. 9**5 * 5) { # 999999 ‚Ü‚Å’²‚×‚é•K—v‚Í‚È‚¢
	my $f = $n % 10;
	my $e = ($n / 10) % 10;
	my $d = ($n / 100) % 10;
	my $c = ($n / 1000) % 10;
	my $b = ($n / 10000) % 10;
	my $a = ($n / 100000) % 10;

	#print "$n, [$a $b $c $d $e $f] $p\n";
	if ($a**5 + $b**5 + $c**5 + $d**5 + $e**5 + $f**5  == $n) {
		print "$n = $a^5 + $b^5 + $c^5 + $d^5 + $e^5 + $f^5\n";
		$sum += $n;
	}
}

print "sum = $sum";
