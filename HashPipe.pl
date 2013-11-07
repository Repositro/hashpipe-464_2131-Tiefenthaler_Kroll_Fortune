#!/usr/bin/perl
use strict;
use warnings;


#open files here
#create new directory to put current working files into


#asks user for input to what new folder is going to be called
print "Please enter the name of this project: ";
my $folder = <STDIN>;
chomp $folder;

#gets current working directory, and makes new folder for the project
my $directory = `pwd`;
chomp $directory;
my $newDir = "mkdir $directory/$folder";
system($newDir);

#absolute path to the folder that was just created
my $workingDir = "$directory/$folder";


#function to capture images of hdd's
#use dd for this, make sure to exclude the removable media

sub imgDrive() {
	
#	my $command = 
}

#function to copy memory
#use dd for this



#function to copy logs over
#probably use something like cp or tail all of the logs over to removable media?

#cp -r /var/log $workingDir



#function to collect current system data
#includes ifconfig, netstat, top, ps
#either single bash script or run system or `` commands

sub current() {
	my $psFile = "psOutput.txt";
	my $psCommand = "ps -ef > '$workingDir/$psFile'";
	system($psCommand);
	
	my $ifFile = "ifconfigOutput.txt";
	my $ifCommand = "ifconfig > '$workingDir/$ifFile'";
	system($ifCommand);
	
	my $temp = "netstatOutput.txt";
	my $netFile = "$workingDir/$temp";
	my $netCommand = "netstat -an > $netFile";
	system($netCommand);
}
	
	

#GUI Section, mostly number based

#standard GUI loop
while () {

	#GUI options
	print "Welcome to HashPipe\n\n";
	print "LEGAL DISCLAIMER HERE!\n\n";
	print "Please select from the following options below:\n";
	print "1) Image and Hash Local Drives\n";
	print "2) Image and Hash Memory\n";
	print "3) Copy Log Files\n";
	print "4) Capture Current System Statistics\n";
	print "5) Do All Of The Above\n";
	print "6) Quit\n\n";
	print "Please input a menu selection (Number Only): ";
	
	#takes input from keyboard
	my $input = <STDIN>;
	chomp $input;

	#Checks if valid input, otherwise asks user for a valid input
	if($input > 0 && $input < 7) {
		if ($input == 1) {
			#Runs the image/hash on local drives function
			imgDrive();
		}

		if ($input == 2) {
			#Runs the image/hash on memory function
		}

		if ($input == 3) {
			#Copies the log files to the directory
		}

		if ($input == 4) {
			#Captures current system info function
			current();
		}

		if ($input == 5) {
			#DO ALL THE THINGS
		}

		if ($input == 6) {
			last;
		}
	}

	else {
		print "\nInvalid menu selection. Please select a valid menu option.\n\n";
	}
}