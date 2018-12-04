use strict;
use warnings;
use Cwd;
use XML::LibXML;
use Data::Dumper;
use Win32::OLE;
use Win32::OLE::Enum;
use Win32::OLE::Variant;
use Win32::OLE::Const;
use Spreadsheet::ParseExcel;


my $WordFile = qw("C:\Temp\My_Doc.doc");

unless(-f $WordFile){
	print "File Exists\n";
	
	my ($DocIssueDate,$Doc_State,$DocSubType,$DocTopRight1,$DocTypeRight2,$DocType)= GetPropertiesOfDoc($WordFile);
	
	print ("DocIssueDate,Doc_State,DocSubType,DocTopRight1,DocTypeRight2,DocType\n");
	print ($DocIssueDate."|",$Doc_State."|",$DocSubType."|",$DocTopRight1."|",$DocTypeRight2."|",$DocType."|");
	
}else{
	print "File Not Exists\n";
}

sub GetPropertiesOfDoc
{
	my $Word_Document = $_[0];

	my $DocIssueDate;
	my $Doc_State;
	my $DocSubType;
	my $DocTopRight1;
	my $DocTypeRight2;
	my $DocType;

	# No OLE warnings please
	local $Win32::OLE::Warn = 0;
	
	# We want to handle collections
	Win32::OLE->Option(_NewEnum => 1);
	
	my $MSWord = Win32::OLE->new('Word.Application','Quit') or die "Could not load MS Word";
	
	# Open document
	my $doc = $MSWord->Documents->Open($Word_Document);

	# Exit nicely if we couldn't open doc
	return unless $doc;
	
	# List document properties
	foreach my $prop (@{$doc->CustomDocumentProperties->{_NewEnum}})
	{
		if (defined $prop->{Name})
		{
			#print "$prop->{Name} : $prop->{Value} \n";

			if ($prop->{Name}=~/Doc_IssueDate/)
			{
				if (defined $prop->{Value})
				{
					#print $prop->{Value};
					$DocIssueDate = $prop->{Value};
				}
			}
			
			if ($prop->{Name}=~/Doc_State/)
			{
				if (defined $prop->{Value})
				{
					#print $prop->{Value};
					$Doc_State = $prop->{Value};
				}
			}
			
			if ($prop->{Name}=~/Doc_Subtype/)
			{
				if (defined $prop->{Value})
				{
					#print $prop->{Value};
					$DocSubType = $prop->{Value};
				}
			}
			
			if ($prop->{Name}=~/Doc_TopRight1/)
			{
				if (defined $prop->{Value})
				{
					#print $prop->{Value};
					$DocTopRight1 = $prop->{Value};
				}
			}
			
			if ($prop->{Name}=~/Doc_TopRight2/)
			{
				if (defined $prop->{Value})
				{
					#print $prop->{Value};
					$DocTypeRight2 = $prop->{Value};
				}
			}
			
			if ($prop->{Name}=~/Doc_Type/)
			{
				if (defined $prop->{Value})
				{
					#print $prop->{Value};
					$DocType = $prop->{Value};
				}
			}
		}
	}

	$MSWord->Quit();
	return ($DocIssueDate,$Doc_State,$DocSubType,$DocTopRight1,$DocTypeRight2,$DocType);
}
