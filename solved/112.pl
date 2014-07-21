#!C:/Perl/bin/perl.exe

use strict;

# 左から右までどの桁もその左の桁を下回らない数を増加数と呼ぶ. 例えば, 134468.
# 同様に, どの桁もその右の桁を下回らない数を減少数と呼ぶ. 例えば, 66420.
# 増加数でも減少数でもない正の整数をはずみ数と呼ぶことにする. 例えば, 155349.
# 100以下にはずみ数が無いのは明らかだが, 1000未満では半数を少し上回る525個がはずみ数である.
# 実際, はずみ数の割合が50%に達する最少の数は538である.
# 驚くべきことに, はずみ数はますます一般的になり, 21780でははずみ数の割合は90%に達する.
# はずみ数の割合がちょうど99%になる最小の数を求めよ.


# Increasing number: どの桁もその左の桁を下回らない数 i.e. 134468
# Decreasing number: どの桁もその右の桁を下回らない数 i.e. 66420
# Bouncy number: どちらでもない数

my $bouncy_num_count = 0;

my $n = 1;

while (1) {
	
	my $inc_flag = 1;
	my $dec_flag = 1;

	my $m1;
	my $m2 = int(substr($n, 0, 1));
	for my $i (0 .. (length($n) - 2)) {

		$m1 = $m2;
		$m2 = int(substr($n, $i + 1, 1));
		if ($m1 > $m2) {
			$inc_flag = 0;
		} elsif ($m1 < $m2) {
			$dec_flag = 0;
		}

	}

	if ((!$inc_flag) && (!$dec_flag)) {
		$bouncy_num_count++;
	}

	my $bouncy_rate = $bouncy_num_count / $n;
	if ($bouncy_rate == 0.99) {
		print "count = $n\n";
		last;
	}

	$n++;
#	print "$n\t: [$inc_flag, $dec_flag] $bouncy_rate\n";
}

