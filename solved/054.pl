#!C:/Perl/bin/perl.exe

use strict;

# getScore(sortHand(split(/,/, "2H,3C,5D,4H,6D")));
# die;

open(my $fh, "<", "054_poker.txt");

my $player1_win = 0;

while(my $line = readline $fh){ 

    chomp $line;
    
	my @hand = split(/ /, $line);
	my @hand1 = sortHand(splice(@hand, 0, 5));
	my @hand2 = sortHand(@hand);

	my $score1 = getScore(@hand1);
	my $score2 = getScore(@hand2);
	#print "\[$card[0]-$card[1]-$card[2]-$card[3]-$card[4]\] $score1 :  \[$card[5]-$card[6]-$card[7]-$card[8]-$card[9]\] $score2\n";

	if ($score1 > $score2) {
		$player1_win++;
	} elsif ($score1 == $score2) {
		# あってはならない
		print "スコアが同じ";
		die;
	}

}

close $fh;

print "Player1 win = $player1_win";

#
# 点数評価関数
#
sub getScore {

	my (@hand) = @_;
	my $score = 0;

	my @same_num_counts;
	for my $i (0..4) {
		my $num = getNum($hand[$i]);
		my $same_num_count = 1;
		for my $j (0..4) {
			if ($i != $j) {
				if ($num == getNum($hand[$j])) {
					$same_num_count++;
				}
			}
		}
		push @same_num_counts, $same_num_count;
	}

	my $is_flash = isFlash(@hand);
	my $is_straight = isStraight(@hand);

	if ($is_straight) {
		if ($is_flash) {
			if (getNum($hand[0]) == 10) {
				# ■ロイヤルフラッシュ (90000)
				$score = 90000;
				goto FINISH;
			} else {
				# ■ストレートフラッシュ (80000)
				$score = 80000 + getNum($hand[0]);
				goto FINISH;
			}
		}
	}


	# ■フォーカード (70000)
	for my $i (0..4) {
		if ($same_num_counts[$i] == 4) {
			$score = 70000 + getNum($hand[$i]) * 100;
			goto FINISH;
		}
	}

	my $index_3 = -1;
	for my $i (0..4) {
		if ($same_num_counts[$i] == 3) {
			$index_3 = $i;
		}
	}
	my $index_2 = -1;
	for my $i (0..4) {
		if ($same_num_counts[$i] == 2) {
			$index_2 = $i;
		}
	}

	# ■フルハウス (60000)
	if (($index_3 >= 0) && ($index_2 >= 0)) {
		$score = 60000 + getNum($hand[4]) * 100 + getNum($hand[0]);
		goto FINISH;
	}

	# ■フラッシュ (50000)
	if ($is_flash) {
		$score = 50000 + getNum($hand[4]) * 100;
		goto FINISH;
	}

	# ■ストレート (40000)
	if ($is_straight) {
		$score = 40000 + getNum($hand[4]) * 100;
		goto FINISH;
	}

	# ■スリーカード (30000)
	if (($index_3 >= 0)) {
		$score = 30000 + getNum($hand[$index_3]);
		goto FINISH;
	}

	if ($index_2 > 0) {
		my $count_2 = 0;
		for my $i (0..4) {
			if ($same_num_counts[$i] == 2) {
				$count_2++;
			}
		}
		if ($count_2 == 4) {
			# ■ツーペア (20000)
			$score = 20000 + getNum($hand[$index_2]);
			goto FINISH;
		} else {
			# ■ワンペア (10000)
			if ($index_2 == 4) {
				$score = 10000 + getNum($hand[$index_2]) * 100 + getNum($hand[2]);
			} else {
				$score = 10000 + getNum($hand[$index_2]) * 100 + getNum($hand[4]);
			}				
			goto FINISH;
		}
	}

	# ■役なし (0)
	$score = getNum($hand[4]);
	goto FINISH;





FINISH:
	#print "\[$hand[0], $hand[1], $hand[2], $hand[3], $hand[4]\] -> $score\t($same_num_counts[0], $same_num_counts[1], $same_num_counts[2], $same_num_counts[3], $same_num_counts[4])\n";
	return $score;
}

# 
# Suit抽出
# 
sub getSuit {
	# "5C" -> "C"
	# "TS" -> "T"
	# "AH" -> "K"

	my $suitlist = "DHCS";
	my $c = substr(shift, 1, 1);
	return index($suitlist, $c);

}

# 
# Num抽出
# 
sub getNum {
	# "5C" -> 5
	# "TS" -> 10
	# "AH" -> 14

	my $numlist = "23456789TJQKA";
	my $c = substr(shift, 0, 1);
	return  2 + index($numlist, $c);

}

# 
# ソート
# 
sub sortHand {

	my (@hand) = @_;
	
	# バブルソート
	my $swaped;
	do {
		$swaped = 0;
		for my $i (0 .. 3) {
			if (getNum($hand[$i]) > getNum($hand[$i + 1])) {
				($hand[$i], $hand[$i + 1]) = ($hand[$i + 1], $hand[$i]);
				$swaped = 1;
			}
		}
	} while ($swaped);
	return @hand;
}

# 
# フラッシュ判定
# 
sub isFlash {

	my (@hand) = @_;

	my $suit = getSuit($hand[0]);
	for my $i (1 .. 4) {
		if (getSuit($hand[$i]) != $suit) {
			return 0;
		}
	}
	return 1;

}


# 
# ストレート判定
# 
sub isStraight {

	my (@hand) = @_;

	my $n = getNum($hand[0]);
	for my $i (1 .. 4) {
		if (getNum($hand[$i]) != $n + $i) {
			return 0;
		}
	}
	return 1;

}










