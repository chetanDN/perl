@list = qw/food festival with foodsball foodtnote terfoodst/;

foreach (@list){
	$first = $1 if m/(foo.*?)/; # .*? nongreedy repetition

	$last = $1 if m/(foo.*)/;   # .* greedy repetition

}

print "first = $first, last= $last \n";

$string = "three cats in three days catch three rats threefourthree eerht hret";
#$string =~ s/three/four/;	#output > four cats in three days catch three rats
#$string =~ s/three/fourk/g;  #output > four cats in four days catch four rats
#$string =~ tr/three/four/; #output > fourr cafs in fourr days cafco fourr uafs fourrfouufourr rruof ourf ?->tr/SearchListchar/Corr.Replacement letters
#$string =~ tr/a-z/A-Z/;  #output > THREE CATS IN THREE DAYS CATCH THREE RATS THREEFOURTHREE EERHT HRET
#$string =~ tr/a-z/t/d; #output >  t   t t  t ?-> delete all leters except those in Replacement list
$string =~ tr/a-z/a-z/s ; #output > squash(remove ) duplicates letters  > thre cats in thre days catch thre rats threfourthre erht hret
print "$string\n"; 


#The translation replaces all occurrences of the characters in SEARCHLIST with the corresponding characters in REPLACEMENTLIST
#mapping
#t f
#h o
#r u
#e r
