#!C:/Perl/bin/perl.exe

use strict;
use 5.010;

# ある数の桁を左から右へと順に見たとき, 任意の桁の数が自身の左にある桁の数以上であるとき, その数を増加数 (increasing number) と呼ぶ; 例えば134468は増加数である.

# 同様に, 任意の桁の数が自身の右にある桁の数以上であるとき, その数を減少数 (decreasing number) と呼ぶ; 例えば66420がそうである.

# 増加数でも減少数でもない数を "はずみ"数 ("bouncy" number) と呼ぶ; 155349がそうである.

# nが大きくなるにつれ, n以下のはずみ数の割合は大きくなる. 例えば, 100万未満では, はずみ数でない数は12951個しかない. 同様に, 1010未満では277032個しかない.

# googol数 (10100) 未満ではずみ数でないものの数を答えよ.


# Increasing number: どの桁もその左の桁を下回らない数 i.e. 134468
# Decreasing number: どの桁もその右の桁を下回らない数 i.e. 66420
# Bouncy number: どちらでもない数

my @a = f("788");
print "@a";
die;


# my $bouncy_num_count = 0;

# my $n = 1;

# my @digit;

# my $D = 3;
# my $d = 0;
# @digit = (0, 0, 1);
# for my $i (0 .. $D - 1) {
# 	push @digit, $i;
# }
# for my $d1 ($d .. 9) {
# 	$s .= $d1;
# } 

# say "$s ";

sub f{
	# "12" -> ("122", "123", ..., "129")
	# "477" -> ("4777", "4778", "4779")
	my ($s) = @_;
	my @result = ();
	my $lastno = substr($s, length($s) - 1, 1);
	for my $i($lastno .. 9) {
		push @result, ($s . $i);
	}
	return @result;
}