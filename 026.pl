#!C:/Perl/bin/perl.exe

# use warnings;
use strict;
# use bigint;
use POSIX;


# 1/d �̏z�� (A) (����a)�A�����_�ȉ��z�ߑO�̕��� S (����s) �Ƃ���B
# ���Ȃ킿�A1/d = 0. S (A)
#
#         10^a 10^s (1/d) = S A . A A A �E�E�E
# -)           10^s (1/d) =   S . A A A �E�E�E
# ---------------------------------------------
#   10^s (10^a - 1) (1/d) = [S A] - A (����)
#
# �䂦�ɁA10^s (10^a - 1) �� d �Ŋ���؂��悤�ȁAa �� s ��T���B

my $A_MAX = 10000;
my $REPEAT_COUNT = 5;

my $countmax_d = 9999;
my $countmax_count = -1;

for my $d (2 .. 2) {
	print "��1/$d�� ";
	my $count_min = $A_MAX;
	# for my $s (0 .. 5) {
	# 	for my $a (1 .. $a_min - 1) {
	# 		if ((10**$s * (10**$a - 1)) % $d == 0) {
	# 			$a_min = $a;
	# 			if ($a_min < $amax_a) {
	# 				goto NEXT_NUM;
	# 			} else {
	# 				# print "[$a:$s]\n ";
	# 				last; # $a�̃��[�v�𔲂���
	# 			}
	# 		} else {
	# 			# my $v = (10**$s * (10**$a - 1)) % $d;
	# 			# print "$a:$s:$v ";
	# 		}
	# 	}
	# }
	# print " $a_min ��\n";
	
	my @buf = ();
	my $val = 1 / $d;
	while (1) {
		
		my $v1 = $val * 10;
		push @buf, floor($v1);
		$val = $v1 - floor($v1);

		my $count = 1;
		while ($count <= floor($#buf / $REPEAT_COUNT)) {

			# $count���� $REPEAT_COUNT�� �J��Ԃ���邩
			my $flag = 1;
			for my $p (0 .. $#buf - ($count * $REPEAT_COUNT)) {
				for my $i (1 .. $REPEAT_COUNT - 1) {
					for my $k(0 .. $count - 1) {
						if ($buf[$p + $k] != $buf[$p + $k + ($count * $i)]) {
							$flag = 0;
							goto LABEL1;
						} 
					}
				}
			}
LABEL1:
			if ($flag == 1) {
				$count_min = $count;
				goto LABEL2;
			}
			$count++;
		}

	}

LABEL2:
	if ($countmax_count < $count_min) {
		$countmax_count = $count_min;
		$countmax_d = $d;
	}
NEXT_NUM:
}

print "1/$countmax_d : �z�� $countmax_count ��\n";
