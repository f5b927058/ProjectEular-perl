#!C:/Perl/bin/perl.exe

use strict;
use bigint;

my $product = 1;

for my $n (2..100) {
	$product *= $n;
}

my $digit_sum = 0;
my $product_1 = $product;
while ($product_1 >= 1) {
	$digit_sum += ($product_1 % 10);
	$product_1 = int($product_1 / 10);
}
print "$digit_sum\n";