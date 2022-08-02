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


$dc = $FORM{dc};
$virtname = $FORM{vname};
$vmcpu = $FORM{mem};

print "<html><body>\n";
print "<h1>System Events Logs</h1>\n";
print "<br>";
print "Datacenter: $dc <br>";
print "Virtual Machine: $virtname<br>";
print "Virtal Mahcine Cores: $vmcpu<br>";
print "<br>";
system("sudo sh add_cpu.sh $dc $virtname $vmcpu");
print "</body></html>\n";
