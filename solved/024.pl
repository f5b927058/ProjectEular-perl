#!C:/Perl/bin/perl.exe

# use warnings;
use strict;
# use bigint;
use POSIX;

sub getNextNum {

	# getNextNum("0135", 0) = 2
	# getNextNum("0135", 1) = 4
	# getNextNum("0135", 2) = 6
	# getNextNum("0135", 3) = 7

    my ($s, $n) = @_;

    my $c = -1;
    for my $i (0 .. $n) {
    	$c++;
    	while (index($s, $c) >= 0) {
    		$c++;
    	}
    }
    return $c;
}

sub factorial {

	my $n = 1;
	for my $i (1 .. $_[0]) {
		$n *= $i;
	}
	return $n;
}

# print getNextNum("0135", 0) . "\n";
# print getNextNum("0135", 1) . "\n";
# print getNextNum("0135", 2) . "\n";
# print getNextNum("0135", 3) . "\n";
# print getNextNum("123", 0) . "\n";
# print getNextNum("123", 1) . "\n";
# print getNextNum("123", 2) . "\n";

print "\$n\t\$c\t\$N\t\$s\t[\$f]\n";

my $s = "";
my $N = 1000000 -1;
for (my $n = 9 ; $n >= 0 ; $n--) {
	# Žc‚ènŒ…
	my $f = factorial($n);
	my $c = int($N / $f);
	$N -= $f * $c;
	$s .= getNextNum($s, $c);
	print "$n\t$c\t$N\t$s\t[$f]\n";
}

print "answer = $s";


