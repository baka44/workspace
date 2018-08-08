use strict;
use warnings;
use utf8;
use feature ':5.10';
use Encode 'decode';
use Getopt::Easy;
use DDP;

#Get options
get_options "v-verbose  f-fname=  e-enc=",
            "usage: prog [-v] [-f fname] [-e encoding]";

print "reading $O{fname}\n" if $O{verbose};

if ($O{fname}){
 my $hash;
 open (my $fh, '<', $O{fname}) or die "Cant open file '$O{fname}'\n", $!;
 my @content;
 while (my $line = <$fh>){
  $line = decode($O{enc}||'utf8', $line);
  $line =~ s/[\r\n]+//g;
  push @content, $line;
 }
 close($fh);
 my $separator = $1 if $content[0] =~ m/(,|;)/;
 my @keys = split ($separator, shift(@content));
 foreach my $item (@content){
  my @values = split($separator, $item);
  my @tmp = map { $keys[$_] => $values[$_] } 0..$#keys;
  push @$hash, { @tmp };
 }
 p $hash;
}else{
 say "usage: prog [-v] [-f fname] [-e encoding]";
}
