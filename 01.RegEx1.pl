$bar = "this is myfoodworld and again foo";
if ($bar =~ /foo/) {
	print "$`"." "."$&"." "."$'";
} else {
	print "not matching";
}

=begin result
this is my foo dworld and again foo
=end result
=cut
