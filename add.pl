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

#use strict;
#use warnings;
my $unum,$vm,$disk_size,$disk;

$vm=$FORM{vname};
$d_size=$FORM{dsize};
$fsize=$FORM{fssize};
$fname=$FORM{fsname};

print "<html><body>\n";
print "<h1>Create VM DISK and PV ,VG and Filesystem</h1>\n";
print "<br>";
print "Virtual Machine Name: $vname <br>";
print "Disk Size: $d_size<br>";
print "Filiesystem Name: $fsname<br>";
print "Filesystem Size: $fsize<br>";


system("sudo ansible-playbook -i server scsidisk_list.yml|grep \"0:0:[0-9]*:0\"|awk -F : \'{print \$3}\'|tail -1 > unit_number.txt");
my $filename = 'unit_number.txt';
open(FH, '<', $filename) or die $!;
while(<FH>)
{
  	$unum=$_;
}
$unum=$unum+1;

if($unum == 7)
{
	$unum=$unum+1;
}

print $unum;
close(FH);
system("sudo ansible-playbook create_disk.yml --extra-vars=\"vmname=$vm unitnumber=$unum disk_size=$d_size\"");
system("sudo ansible-playbook -i server scsidisk_list.yml|grep \"0:0:$unum:0\"|awk \'{print \$7}\'|tail -1 > disk_name.txt");

my $filename = 'disk_name.txt';
open(FH, '<', $filename) or die $!;
while(<FH>)
{
  $disk=$_;
}
print $disk;

close(FH);
print "</body></html>";
