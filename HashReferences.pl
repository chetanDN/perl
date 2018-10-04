use strict;
use warnings;
use Data::Dumper;

print "hello \n";

my $NewHash ;
my $NewHash2 ;

$NewHash->{'GTM_TC_REV_010'}->{'Traceability'} = [qw(TC_SDS_MCAL_GTM_0120_R010 TC_SRD_NAS_GTM_PR102_R010)];
$NewHash->{'GTM_TC_REV_010'}->{'Type'} = "REVIEW";
$NewHash->{'GTM_TC_REV_010'}->{'Functionality'} = "NA";

$NewHash->{'GTM_TC_CONF_283_06'}->{'Traceability'} = [qw(TC_SAS_NAS_GTM_PR63_168_C283_06)];
$NewHash->{'GTM_TC_CONF_283_06'}->{'Type'} = "CONFIGURATION";
$NewHash->{'GTM_TC_CONF_283_06'}->{'Functionality'} = "NA";


# $NewHash->{'GTM_TC_REV_010'}->{'Type'} = "REVIEW";
# my @FilteredTagsList = qw(TC_SDS_MCAL_GTM_0120_R01010 TC_SRD_NAS_GTM_PR102_R01010);
# foreach my $tt (@FilteredTagsList){
	# next if(grep($tt eq $_,@{$NewHash->{'GTM_TC_REV_010'}->{'Traceability'}}));										
	# push @{$NewHash->{'GTM_TC_REV_010'}->{'Traceability'}},$tt;	
# }

# $NewHash->{'GTM_TC_REV_010'}->{'Traceability'} = [qw(TC_SDS_MCAL_GTM_0120_R01010 TC_SRD_NAS_GTM_PR102_R01010)];

# $NewHash->{'GTM_TC_REV_111'}->{'Functionality'} = "NA10";

$NewHash2->{'GTM_TC_REV_111'}->{'Traceability'} = [qw(TC_SDS_MCAL_GTM_0120_R1111 TC_SRD_NAS_GTM_PR102_R111)];
$NewHash2->{'GTM_TC_REV_111'}->{'Type'} = "REVIEW";
$NewHash2->{'GTM_TC_REV_111'}->{'Functionality'} = "NA";

$NewHash2->{'GTM_TC_CONF_222_06'}->{'Traceability'} = [qw(TC_SAS_NAS_GTM_PR63_168_C283_06)];
$NewHash2->{'GTM_TC_CONF_222_06'}->{'Type'} = "CONFIGURATION";
$NewHash2->{'GTM_TC_CONF_222_06'}->{'Functionality'} = "NA";

$NewHash2->{'GTM_TC_REV_010'}->{'Traceability'} = [qw()];
$NewHash2->{'GTM_TC_REV_010'}->{'Type'} = "CONFIGURATION";
$NewHash2->{'GTM_TC_REV_010'}->{'Functionality'} = "NA";

						
my %hash1 = %$NewHash;
my %hash2 = %$NewHash2;

print "hash1 : \n";
print Dumper \%hash1;

print "hash2 : \n";
print Dumper \%hash2;


print "\n\n from for loop\n";
foreach my $tc (keys %hash2){
	if(grep($tc eq $_,(keys %hash1))){
		# print "$tc exists\n";		
		my $TraceabilityRef = $hash2{$tc}{'Traceability'};
		my @Traceability_List = @$TraceabilityRef;
		print "Tracabiluty list : @Traceability_List\n";
		foreach my $tt (@{$hash2{$tc}{'Traceability'}}){
			next if(grep($tt eq $_,@{$hash1{$tc}{'Traceability'}}));
			push @{$hash1{$tc}{'Traceability'}},$tt;			
		}
	}else{
		# print "$tc doesnt exist\n";
		# print "hash from loop \n";
		# # print Dumper \$hash2{$tc};
		$hash1{$tc}=($hash2{$tc});
	}
}



print "hash1 Later : \n";
print Dumper \%hash1;



=pod
foreach my $tc (keys %hash2){
		if(grep($tc eq $_,(keys %hash1))){ #if exists check for values
			# print "$tc key exists\n";
			foreach my $tt (@{$hash2{$tc}}){
				next if(grep($tt eq $_,@{$hash1{$tc}}));			
				# print "tt : $tt\n";
				push @{$hash1{$tc}},$tt;	
			}
		}else{#if doesnt exists add it directly
			# print "$tc key doesnt exist\n";
			$hash1{$tc}=($hash2{$tc});
		}
	}


	$TestCaseDataHash->{$TestCase}->{'Functionality'} = $Functionality;
					$TestCaseDataHash->{$TestCase}->{'Type'} = $TestCaseType;
					
					#update if new testcase , different tracability occurs
					foreach my $tt (@FilteredTagsList){
						next if(grep($tt eq $_,@{$TestCaseDataHash->{$TestCase}->{'Traceability'}}));										
						push @{$TestCaseDataHash->{$TestCase}->{'Traceability'}},$tt;	
=cut
# my %NewHash3 = (%NewNewHash,%NewNewHash2);



#print Dumper \%NewHash3;



=pod
= {
		'GTM_TC_REV_010' => {
                                'Traceability' => [
                                                    'TC_SDS_MCAL_GTM_0120_R010',
                                                    'TC_SRD_NAS_GTM_PR102_R010'
                                                  ],
                                'Type' => 'REVIEW',
                                'Functionality' => 'NA'
                              },
        'GTM_TC_CONF_283_06' => {
                                    'Functionality' => 'NA',
                                    'Type' => 'CONFIGURATION',
                                    'Traceability' => [
                                                        'TC_SAS_NAS_GTM_PR63_168_C283_06'
                                                      ]
                                  },
        'GTM_TC_CONF_306' => {
                                 'Traceability' => [
                                                     'TC_SRD_NAS_EP_GTM_PR3054_3_C306'
                                                   ],
                                 'Functionality' => 'Test for Gtm_Deinit API Enable/Disable in User Mode',
                                 'Type' => 'CONFIGURATION'
                               },
							   'GTM_TC_CONF_022' => {
                                 'Traceability' => [
                                                     'TC_SAS_NAS_GTM_PR63_44_C022'
                                                   ],
                                 'Functionality' => 'NA',
                                 'Type' => 'CONFIGURATION'
                               },
			};
=cut
