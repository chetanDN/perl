#!/usr/bin/perl

use strict;
use warnings;
use Cwd;
use XML::LibXML;
use Data::Dumper;
use Spreadsheet::ParseExcel;

my $GTM_ExcelFile = qw(C:\Users\NaikChet\Documents\ITRAutomation_TempFiles\ITR_Automation_GTM\Aurix_MC-ISAR_STS_CFG_GTM.xls);
my $parser = Spreadsheet::ParseExcel->new();
my $Doc_XLS = $parser->parse($GTM_ExcelFile);

my $GTM_STSFile = qw(C:\Users\NaikChet\Documents\ITRAutomation_TempFiles\ITR_Automation_GTM\STS_1.xml);
my $xmlParser = XML::LibXML->new();
my $Doc_STS = $parser->parse($GTM_STSFile);

unless((-f $GTM_STSFile) and (-f $GTM_ExcelFile )){
	print "Both File Not Exists  \n";
}else{
	print "Both File Exists  \n";
	my $WorkbookName = 'ConfigurationParameters';
	
	for my $worksheet ( $Doc_XLS->worksheet($WorkbookName) )
	{
		my ( $row_min, $row_max ) = $worksheet->row_range();
		my ( $col_min, $col_max ) = $worksheet->col_range();

		for my $Row (($row_min) .. $row_max)
		{
			for my $col (($col_min) .. $col_max )
			{
				my $cell = $worksheet->get_cell( $Row, $col); #hash of that cell
				next unless $cell;
				
				my $CellValue = $cell->value();	#Cell value eg  -   [ASXXX][*][LEAD][625X] 
				
				print "CellValue : row:$Row column:$col $CellValue \n";
			}
		}
	}
}
