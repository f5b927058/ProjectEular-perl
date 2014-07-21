#!C:/Perl/bin/perl.exe

use strict;
use bigint;

my $count = 0;

for my $k (1 .. 9999) {
	
	my $n = $k;
	my $n_rev = getReverse($n);

	my $i = 1;
	while(1) {

		my $add = $n + $n_rev;
		my $add_rev = getReverse($add);
		if ($add == $add_rev) {
			# 回文数
			goto LABEL1;
		}
		$n = $add;
		$n_rev = $add_rev;
		
		$i++;
		if ($i == 50) {
			print "Lychrel: $k\n";
			$count++;
			goto LABEL1;
		}
	};

LABEL1:

}

print "Lychrel count = $count\n";

sub getReverse {

	my ($n) = @_;
	return int(reverse($n));

}
