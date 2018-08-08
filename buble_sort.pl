use strict;
my @arr;
foreach my $i (1..20){
 push @arr, int(rand($i)) + int(rand($i))*3;
}
local $" = ', ';
print "Input:  @arr\n";
foreach my $n (0..scalar(@arr)-1){
	foreach my $n (0..scalar(@arr)-1){
		if ($arr[$n] > $arr[$n+1] && $arr[$n+1] ){
			($arr[$n], $arr[$n+1]) = ($arr[$n+1], $arr[$n]);
		}
	}
}
print "Output: @arr\n";
