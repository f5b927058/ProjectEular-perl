#!C:/Perl/bin/perl.exe

use strict;
use bigint;
use Benchmark qw(timethese cmpthese);

# 2乗して 1_2_3_4_5_6_7_8_9_0
# 末尾は0
# 2乗して 1_2_3_4_5_6_7_8_9 になる数 + "0"

my $n = 10000000000000;
print $n^2;
while (1) {
	
	my $sq = $n ** 2;
	if ($sq =~ /^1.2.3.4.5.6.7.8.9.0$/) {
		print "$n^2 = $sq\n";
		last;
	}
	$n += 10;
		print "$n\n";
}

