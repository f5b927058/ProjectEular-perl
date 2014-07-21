#!C:/Perl/bin/perl.exe

use strict;

my $n = 10;
my @a = ();

while ($#a < (12 - 1)) {

	$n++;

	my $digit_sum = 0;
	for my $i (0 .. length($n) - 1) {
		$digit_sum += int(substr($n, $i, 1));
	}
	# print "n = $n, digit_sum = $digit_sum\n";

	if ($digit_sum == 1) {
		next;
	}

	my $p = 1;
	my $v = $digit_sum;
	while($v <= $n) {
		if ($v == $n) {
			push @a, $n;
			print "[" . ($#a + 1) . "] $n = $digit_sum ^ $p\n";
			last;
		} 
		$p++;
		$v *= $digit_sum;
	}


}


