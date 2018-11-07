use strict;
use warnings;
use Data::Dumper;
use XML::LibXML;
use Getopt::Std;

# my %args;
# getopts('r:f:', \%args);


	# my $ReleaseLabel = $args{r};
	
	# print " Rel label  : $ReleaseLabel"; #perl main10.pl -r 10 -f 20
my ($x,$y) = @ARGV;
print "x = $x y = $y\n"; #perl main10.pl 10 20

largest($x,$y);

sub largest{
my ($a,$b)=@_;

print "a = $a, b=$b";

}
