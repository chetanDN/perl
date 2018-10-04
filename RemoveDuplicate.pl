use strict;
use warnings;
 use 5.010;

print "hello\n";
my @Testcases=qw(TS001 TS002 TS003 TS004 TS005);
my @myNewtestcases = qw(TS004 TS009 TS010);

print "Testcases : @Testcases\n";
print "myNewtestcases : @myNewtestcases\n";

=pod
foreach my $newEle (@myNewtestcases){
	 if ($newEle ~~ @Testcases){
		print "Element found : $newEle\n";
	 }else{
		print "Element not found : $newEle\n";
	 }
)
=cut
my @temp;
foreach my $newEle (@myNewtestcases){
	next if (grep {$_ eq $newEle} @Testcases) ;
	push(@Testcases,$newEle);
}

print "temp : @temp\n";

# @Testcases = grep("if not $_",@myNewtestcases);

print "Testcases : @Testcases\n";
