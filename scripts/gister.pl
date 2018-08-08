use Mojo::Base -base;
# Declensions of russian numerals
# usage expample:
# perl gister.pl 3 яблоко яблокa яблок
# ...
# perl gister.pl 12 яблоко яблокa яблок
# ...
my ($num,@words) = @ARGV;
my @cases = (2, 0, 1, 1, 1, 2);
say $words[ ($num%100>4 && $num%100<20)? 2 : $cases[($num%10<5)?$num%10:5] ];
