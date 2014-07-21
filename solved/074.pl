#!C:/Perl/bin/perl.exe

use strict;

# 階乗の配列
my @factorial;
push @factorial, 1;
for my $i (1..9) {
	push @factorial, ($factorial[$i - 1] * $i);
}

# 循環する数の配列
my %cyclic = (
	169		=> 3,
	363601	=> 3,
	1454	=> 3,
	871		=> 2,
	45361	=> 2,
	872		=> 2,
	45362	=> 2
	);

my $count_60 = 0;
keys(%cyclic) = 1000000;

for my $n (1 .. 1000000-1) {
	
	my $m = $n;
	
	# $n の項の配列
	my @values = ();

	while(1) {

		#print "$m";
		push @values, $m;

		# 循環する数
		if (exists($cyclic{$m})) {
			goto LABEL1;
		}
		
		#print " -> ";
		# 次の数
		my $m_next = addDigitFactorial($m);

		if ($m == $m_next) {
			# print "$m_next (same)";
			$cyclic{$m} = 1;
			goto LABEL1;
		}
		$m = $m_next;

	}

LABEL1:
	# ココに来る時点で、@valueの最後の項は、%cyclicに含まれているはず
	my $i1 = $#values;
	for (my $i = $i1 - 1 ; $i >= 0 ; $i--) {
		$cyclic{$values[$i]} = $cyclic{$values[$i1]} + ($i1 - $i);
	}
	if ($cyclic{$values[0]} == 60) {
		$count_60++;
	}
	#print " (count = $cyclic{$values[0]})\n";

}

print "Count 60 = $count_60\n";



# 各桁の階乗の和
sub addDigitFactorial {
	# 145 -> 1! + 4+ + 5+ = 145
	# 69  -> 6! + 9! = 363601
	# 871 -> 8! + 7! + 1! = 45361

	my ($n) = @_;
	my $sum = 0;

	while ($n > 0) {
		$sum += $factorial[$n % 10];
		$n = int($n / 10);
	}

	return $sum;
}