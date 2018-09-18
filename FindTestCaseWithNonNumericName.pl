use strict;
use warnings;
use XML::LibXML;

print "hello\n";
my $TestReportFile = qw(C:\Users\NaikChet\Desktop\Fr_Cfg1_tr.xml);

if(-e $TestReportFile){
	print "file exists\n";
	
	my $Parser_Report = XML::LibXML->new();
	my $Doc_Report = $Parser_Report->parse_file($TestReportFile);
	
	foreach my $TestSetNode ($Doc_Report->findnodes("//TestCaseResults/TestSets/TestSet"))
	{
		foreach my $TestCaseNode ($TestSetNode->findnodes("TestCaseResultArray/TestCaseResult"))
		{	
			my $TestCase = $TestCaseNode->findvalue('@Name');
			$TestCase = uc $TestCase;
			my ($TestCase_Name) = ($TestCase =~ /\s*([A-Z]+_TC_[0-9]{3,3})/); #Testcases which have numbers, avoid test cases like Name="Fr_Tc_Start" -> TestCase : ADC_TC_431_[ASXXX_TC27X][ASXXX_TC29X]TC275ANDHIGHER TestCase_Name : ADC_TC_431
			$TestCase_Name =~ s/(?:^\s+)|(?:\s+$)//g;
			
			print "TestCase : $TestCase TestCase_Name : $TestCase_Name \n";
		}

	}
}else{
	print "file not exists\n";
}
