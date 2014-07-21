use strict;
use warnings;
use Carp;

package Prime;

#
# 素数リストを作成
#
sub getPrimeList {

    # エラトステネスの篩
    
    my $lastnum = $_[0];
    my @new = (2);
Loop: 
    for ( my $i = 3 ; $i <= $lastnum ; $i+=2 ) {
        my $check = sqrt($i);
        foreach ( 0 .. $#new ) {
            unless ( $i % $new[$_] ) { next Loop; }
            if ( $check < $new[$_] ) {
                push( @new, $i );
                next Loop;
            }
        }
    }
    return @new;
}

1;
