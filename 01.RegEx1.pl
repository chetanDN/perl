$bar = "this is myfoodworld and again foo";

$status = ($bar =~ /foo/);
print "Status = $status\n"; #match success = 1, failure = 0;

if ($status) {
	print "$`"." "."$&"." "."$'";
} else {
	print "not matching";
}



=begin result
this is my foo dworld and again foo
=end result
=cut
