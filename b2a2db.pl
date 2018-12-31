#!/usr/bin/perl

while(<>){
  chomp;
  @_ = split;
  for ($it=0; $it <= $#_;){
    print "$_[$it] $_[$it+1] $_[$it+2]";
    if ($it+3+$_[$it+2]-2 >= $it+3){
      print join(' ', @_[$it+3..$it+3+$_[$it+2]-2]);
    }
    print " $_[$it+3+$_[$it+2]-1]\n";
    $it += $_[$it+2] + 3;
  }
}
