#!C:/Perl/bin/perl.exe

use strict;
use Prime;


my $N_MAX = 50000000;

my @prime = Prime::getPrimeList(sqrt($N_MAX));
my %result;

for my $a (0 .. $#prime) {
	my $sum1 = $prime[$a]**2;
	if ($sum1 >= $N_MAX) {
		last;
	}
	for my $b (0 .. $#prime) {
		my $sum2 = $sum1 + $prime[$b] ** 3;
		if ($sum2 >= $N_MAX) {
			last;
		}
		for my $c (0 .. $#prime) {
			my $sum3 = $sum2 + $prime[$c] ** 4;
			if ($sum3 >= $N_MAX) {
				last;
			}
			$result{$sum3} = 1;
			#print "$sum3 = $prime[$a]^2 + $prime[$b]^3 + $prime[$c]^4\n";
		}
	}
LABEL1:
}

my $count = keys(%result);
print "$count\n";
