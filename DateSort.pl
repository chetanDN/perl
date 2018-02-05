=Problem
normal sort of perl with do according to lexicographical(alpha nemerical) sort
so for YYYY-MM-DD will have no issues sorting but date formal like MM-DD-YYYY(Indian) will have date wrongly sorted.
To over come that new Sort is used here
=cut
use strict;
use warnings;

my @first  = ('17-01-2018 23:36:14', '16-01-2018 11:44:31','15-01-2018 11:42:49');
my @second = ('15-01-2018 23:55:01','15-01-2018 23:48:40','15-01-2018 23:50:45');

print "first  before DD-MM-YYYY sort: @first\n";
@first = sort { join('', (split '[-,\s]', $a)[2,1,0,3]) cmp join('', (split '[-,\s]', $b)[2,1,0,3]) } @first;
print "first  after  DD-MM-YYYY sort: @first\n";

sub myDDMMYYYYsort {
    join('', (split '[-,\s]', $a)[2,1,0,3]) cmp join('', (split '[-,\s]', $b)[2,1,0,3]);
}

print "second before DD-MM-YYYY sort: @second\n";
@second = sort myDDMMYYYYsort @second;
print "second after  DD-MM-YYYY sort: @second\n";


=Output
first  before DDMMYYYY sort: 17-01-2018 23:36:14 16-01-2018 11:44:31 15-01-2018 11:42:49
first  after  DDMMYYYY sort: 15-01-2018 11:42:49 16-01-2018 11:44:31 17-01-2018 23:36:14
second before DDMMYYYY sort: 15-01-2018 23:55:01 15-01-2018 23:48:40 15-01-2018 23:50:45
second after  DDMMYYYY sort: 15-01-2018 23:48:40 15-01-2018 23:50:45 15-01-2018 23:55:01
=cut
