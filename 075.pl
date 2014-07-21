#!C:/Perl/bin/perl.exe

use strict;

my $count = 0;
my $v1 = 1 - (sqrt(2) / 2);

my $N_MAX = 5000;

my @square = ();
for my $i (0 .. 1500000) {
	push @square, $i * $i;
}

my $c1 = 0;
for my $L (1..$N_MAX) {

	my $right_triangle_count = 0;
	for my $a (1 .. int($v1 * $L)) {
		my $b = int($L * ($L - 2 * $a) / (2 * ($L - $a)));
			my $c = $L - ($a + $b);
			$c1++;
			#print "($L) $a, $b, $c\n";
			if ($square[$a] + $square[$b] == $square[$c]) {
				$right_triangle_count++;
				# print "$L:\t($a, $b, $c)\n";
				if ($right_triangle_count > 1) {
					goto LABEL1;
				}
		}
	}

LABEL1:
	if ($right_triangle_count == 1) {
		$count++;
	}

}

print "count = $count\n";
print "c1 = $c1\n";