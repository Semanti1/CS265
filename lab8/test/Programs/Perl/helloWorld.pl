#!/usr/bin/perl -w
#
# helloWorld.pl - a sample Perl script
# 
# Servesh Tiwari
# 01/26/05
#
#	gcc 3.3.2 on Mandrake Linux 9.2
#
#	editor:	80 columns, tabstop=2
#
#	NOTE:  See instructions below main to run
#
#	NOTE:  the `-w' flag, above, just turns on warnings (good sanity checks)
#
#	Revision History:
#		1/30/05	- modified format, fixed age logic	KS
#
###########################################################

# this is a line comment
# perl does not have multiple line (block) commenting, so need a "#" for
# each line
# the first line is the location where the perl binary is in your system
# if you are using the department machine, you will need /usr/local/bin/perl

print "\nEnter Your Name: ";
$name=<STDIN>;
chomp $name;	# get rid of trailing newline, which was stored, above
print "Enter Your Age: ";
$age=<STDIN>;
chop $age;

printf "\nHello World! Let me introduce %s\n", $name;
printf "Want to join us? We are off to ";

if( $age < 21 )
{
    printf "the coffee house!\n";
}
else
{
    printf "get some drinks!\n";
}

printf "\n";


# INSTRUCTIONS IN RUNNING THE PERL SCRIPT

# 1. copy the above content to a file (say, helloWorld.pl)
# 2. Change the permissions of this file so that you can execute it.
#    You can use "chmod" command. e.g. "chmod 744 helloWorld.pl"
# 3. Type ./helloWorld.pl <RETURN>
# 4. If you get some error, it could be that your perl binary is not in the 
#    path specified in the first line. You will need to change that.
# 5. In case you were able to run it, this is what you are likely to see.
#    [blah@localhost]$ ./helloWorld.pl
#    Enter Your Name:blah
#    Enter Your Age:20
#    Hello World! Let me introduce blah
#    Want to join us? We are off to get some drinks!
#    [blah@localhost]$

