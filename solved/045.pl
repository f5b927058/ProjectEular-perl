#!C:/Perl/bin/perl.exe

use strict;

my @T; # T_n 配列
my @P; # P_n 配列

my $N_end   = 2000000000; #100000000 -> 360s;

my $i;
my $n;

$i = 1;
do {
	$n = $i * ($i + 1) / 2;
	push @T, $n;
	$i++;
} while ($n <= $N_end);

$i = 1;
do {
	$n = $i * (3 * $i - 1) / 2;
	push @P, $n;
	$i++;
} while ($n <= $N_end);

my $count = 0;

my $i_P = 0;
my $i_T = 0;
my $proc_count = 0;

my $i_H = 1;
do {
	$n = $i_H * (2 * $i_H - 1);

	my $result_P = CheckProc(\@P, $n, \$i_P);
	if ($result_P > 0) {

		my $result_T = CheckProc(\@T, $n, \$i_T);
		if ($result_T > 0) {

			print "$n = T_$i_T = P_$i_P = H_$i_H\n";
			$count++;
			if ($count >= 3) {
				last;
			}
		}

	}
	$i_H++;

} while ($n < $N_end);

print "Proc count = $proc_count";



sub CheckProc {

	my ($a, $n, $i) = @_;

	while ($$i <= $#$a) {
		$proc_count++;
		if ($n == $$a[$$i]) {
			return 1;
		} elsif ($n < $$a[$$i]) {
			return 0;
		}
		$$i++;
	};
}


