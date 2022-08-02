#!/usr/bin/perl
print "Content-type:text/html\r\n\r\n";

print "<html<body>";
system("sudo sh add.sh");
print "</body></html>";
