#!C:/Perl/bin/perl.exe

# use warnings;
use strict;

my $PRIME_COUNT = 10001;
my @primes = (2);

my $n = 3;

while ($#primes < $PRIME_COUNT) {
	my $prime_flag = 1;
	my $d = sqrt($n);
	foreach (@primes) {
		if ($d < $_) {
			last;
		} elsif (($n % $_) == 0) {
			$prime_flag = 0;
			last;
		}
	}
	if ($prime_flag) {
		push @primes, $n;
	}
	$n += 2;
}

print "$PRIME_COUNT th prime number is $primes[$PRIME_COUNT - 1].";
