#!C:/Perl/bin/perl.exe

use strict;
use 5.10.0;


my $count = 0;

# value: 
#   0 -> まだわからない
#   1 ->  1でcycle
#   2 -> 89でcycle
my %result = (
	1 => 1,
	89 => 2, 
	145 => 2, 
	42 => 2, 
	20 => 2, 
	4 => 2, 
	16 => 2, 
	37 => 2, 
	58 => 2, 
	89 => 2
	);

for my $n (1 .. 10000000) {#10000000
	
	my $m = $n;
	my @a = ();

	while (1) {
		if(!exists($result{$m})) {
			push @a, $m;
			$m = getDigitSquare($m);
		} elsif ($result{$m} == 1) {
			foreach my $n_a (@a) {
				$result{$n_a} = 1;
			}
			goto LABEL1;
		} elsif ($result{$m} == 2) {
			foreach my $n_a (@a) {
				$result{$n_a} = 2;
			}
			$count++;
			goto LABEL1;
		}
	}

LABEL1:
}

# for my $i (1 .. 1000) {
# 	print "$i : $result{$i}\n";
# }
print "89 cycle count = $count\n";


sub getDigitSquare {

	my ($n) = @_;
	my $sum = 0;
	for my $i (0 .. length($n) - 1) {
		$sum += (substr($n, $i, 1) ** 2);
	}
	return $sum;

}
