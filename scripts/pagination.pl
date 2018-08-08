use Mojo::Base -base;
use Getopt::Easy;
use DDP;

#Page selection
get_options "p-page=",
	    "usage perl pagination.pl -p [n]";
my $page = ($O{page}) ? $O{page}: 1;
#Posts per page
my $ppp = 5;
#Create array with 250 "news" items
my @data = map {header => "Header $_", body => "body $_ "}, (1..250);
#Is this page exists?
$page = ($page > int($#data/$ppp)+1) ? int($#data/$ppp)+1 : $page;
#array slice with needed content
my @slice = @data[$ppp*($page-1)..$ppp*$page-1];
say "Page number is $page";
p @slice;
