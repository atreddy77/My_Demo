#!/usr/bin/perl
print "Content-type:text/html\r\n\r\n";

local ($buffer, @pairs, $pair, $name, $value, %FORM);
    $ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
    if ($ENV{'REQUEST_METHOD'} eq "GET")
    {
        $buffer = $ENV{'QUERY_STRING'};
    }
    @pairs = split(/&/, $buffer);
    foreach $pair (@pairs)
    {
        ($name, $value) = split(/=/, $pair);
        $value =~ tr/+/ /;
        $value =~ s/%(..)/pack("C", hex($1))/eg;

        $FORM{$name} = $value;
    }
print "123";
