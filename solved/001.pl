#!C:/Perl/bin/perl.exe

# use warnings;
use strict;

my $sum3 = 3 * (1 / 2) * 333 * 334; # 3*1 ～ 3*333
my $sum5 = 5 * (1 / 2) * 199 * 200; # 5*1 ～ 5*199
my $sum15 = 15 * (1 / 2) * 66 * 67; # 15*1 ～ 15*66
my $sum = $sum3 + $sum5 - $sum15;

print "Sum3 = $sum3\n";
print "Sum5 = $sum5\n";
print "Sum15 = $sum15\n";
print "Sum = Sum3 + Sum5 - Sum15 = $sum";
