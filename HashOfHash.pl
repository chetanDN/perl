=pod
Using Hash of hash to save multiple list
=cut

use strict;
use warnings;
use Data::Dumper;


#=========================================================================
#Using Hashmap of HashRef
#=========================================================================
my %WorkDone = (				#this with () is Hash 
mon => {sonu => 3, monu => 4,},
tue => {sonu => 1, monu => 2,},
wed => {sonu => 7, monu => 8,},
);	

print Dumper \%WorkDone;

for my $key1 (keys %WorkDone){
	print "key1 :  $key1\n";
	print "value :  $WorkDone{$key1}\n";	

	for my $key2 (keys $WorkDone{$key1}){
		print "\t   key2 :  $key2\n";
		print "\t   value2 : $WorkDone{$key1}{$key2}\n"; #Equivalent -> print "\t value2 : $WorkDone{$key1}->{$key2}\n";
	}
}
#=========================================================================
#Using HashRef of HashRef
#=========================================================================
my $WorkDone_HoHRef = {				#this with {} is HashRef 
mon => {humpty => 3, dumpty => 4,},
tue => {humpty => 1, dumpty => 2,},
wed => {humpty => 7, dumpty => 8,},
};		

print Dumper \%$WorkDone_HoHRef;

for my $key1 (keys %$WorkDone_HoHRef){
	print "key1 :  $key1\n";
	print "value :  $WorkDone_HoHRef->{$key1}\n";	

	for my $key2 (keys $WorkDone_HoHRef->{$key1}){
		print "\t key2 :  $key2\n";
		print "\t value2 : $WorkDone_HoHRef->{$key1}->{$key2}\n";
	}	

}
#=========================================================================	
