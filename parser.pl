use strict;
use warnings;
use feature qw (say);
use XML::LibXML qw(:libxml);	

my $xmlfile = $ARGV[0];
my $parser = XML::LibXML->new();
my $tree = $parser->parse_file($xmlfile);		#holds complete xml from<?xml version "1.0"
my $root = $tree->getDocumentElement;				#holds from element <book edition="2">



#print "$root->nodeValue\n";
foreach my $child ( grep { $_->nodeType == XML_ELEMENT_NODE } $root->childNodes()) {  #remode linefeed child nodes
	say '$child node is :' , $child;
	say 'node name is :', $child->nodeName;
	say 'node value is :', $child->to_literal; #can use  $child->nodevalue, $child->data, $child->toString; best $child->to_literal 
	
#advanced use findnodes() for specific nodes or any XPathExpressions
}

my ($attr) = $root->getChildrenByTagName('dimensions');
say 'width :', $attr->getAttribute("width");

say 'all attr :', $attr->getAttribute('');

my ($dim) = $root->findnodes('//dimensions');
say 'attr :', $dim->findvalue('./@width');
