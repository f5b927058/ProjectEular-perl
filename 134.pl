#!C:/Perl/bin/perl.exe

use strict;
use Prime;
use 5.010;
use Benchmark qw(timethese cmpthese);


my $results = timethese(
    10,
    {
        pnum  => sub {


my $N_MAX = 100;#1000000;
my @prime = Prime::getPrimeList($N_MAX);
my $sum = 0;

my $c = 0;
my $v_p2 = 0;

for my $i (2..$#prime - 1) {

	my $p1 = $prime[$i];
	my $p2 = $prime[$i+1];

	my $n = $p1;
	my $d = 10 ** (int(log($p1)/log(10)) + 1);
	say "[$i] $p1, $p2";
	my $v_p2 = $p2;
	my $d_p2 = $d % $p2;
	do {
		if ($n < $v_p2) {
			$n += $d;
		} else{
			$v_p2 += $d_p2;
		}
		say "  $n - $v_p2 ($d_p2)";
		# $c++;
		# say "  $n % $p2 = " . ($n % $p2);
	} until ($n == $v_p2); ##until ($n % $p2 == 0);
	$sum += $n;
}

say "sum = $sum";
#say "$#prime / $c";





        	},
    }
);


