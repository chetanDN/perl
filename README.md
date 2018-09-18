# perl - Some shortcuts

################################
For secutrity reasons, CWD(.) was removed from 5.26 onwards and also CPAN.pm will remove it. So to set it use 
In strawberry perl use current running directory
use lib qw(.); or 
BEGIN {push @INC, '.'};
#BEGIN {push @INC, '..\Common'};
or set via environment variable
set PERL5LIB=.
################################
