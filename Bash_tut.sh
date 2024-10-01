
echo $SHELL # Determine what shell youre using


which bash # Find bash


whoami # Show username

# This will pass in current process ID (i.e. your shell) and return the name.
ps -p $$

# information on kernel used.
uname -a  
uname -r
cat /proc/version
cat /etc/os-release


head -n1 /etc/issue # Show distribution 

 
man command # Show manual for command


mount # show mounted filesystems

which # find file or others

echo $PATH # determine system path

# To add directory to $PATH
export PATH=/usr/local/bin:$PATH # call PATH Variable and assign new directory PLUS the PATH that already existed. 

pwd # print working directory
mkdir dir # make directory dir
cd dir # change directory to dir
cd .. # go up a directory
ls # list contents
    -a # Show all (including hidden)
    -R # recursive list
    -r # reverse order
    -t # sort by last modified
    -S # sort by file Size
    -l # long listing format
    -Q # quated output
    -m # comma seperated output
    -1 # one file per line
nano # create & open file
touch # create file
rm # remove file
file file1 # get file type of file1
cp file1 file2 # Copy file1 to file2
mv file1 file2 # Move file1 to file2
head file1 # show first 10 lines of file1
tail file1 # show last 10 lines of file1

chmod # alter permissions
chown user:gorup file # Change file owner to user and group to group

cat # read out contents of file
cat file1 file2 # Concatenate files and output
./[Script.sh] # execute contents of ccript 

# subshell: To save comand outputs as a variable (Create variables in lowercase)
files=$(ls)
now=$(date)

# Full hardware specs
inxi -Fxz
inxi -b
inxi -B # battery 
inxi -C # CPU
inxi -c 42 # 0-42 for color
inxi -S
inxi -Sv
inxi -w # Weather
inxi -W rome,italy # specify location
 
$USER # Standard variable
env # to view standard/environmental variables

# to perform math
expr 10 + 30

expr 100 \* 4 # * is special ccharacter so it needs to be commended out.

# IF -statements
mynum=300

if [ $mynum -eq 200 ]
then 
    echo "the conditions is true"
else 
    echo "the condition is NOT true"
fi


-eq # equal to 
-ne # not equal to
-gt # Greater than
-ge # Greater than or equal to
-le # less than or equal to
-lt # less than 

-ef


-f # Checks for file
-v # 
-y # assume yes

# manual/help page for tests
man test

# EXPRESSION is true
( EXPRESSION )

# EXPRESSION is false
! EXPRESSION

# both EXPRESSION1 and EXPRESSION2 are true
EXPRESSION1 -a EXPRESSION2

# either EXPRESSION1 or EXPRESSION2 is true
EXPRESSION1 -o EXPRESSION2 

# the length of STRING is nonzero
-n STRING

# the length of STRING is zero          
-z STRING

# FILE1 and FILE2 have the same device and inode numbers
FILE1 -ef FILE2

# FILE1 is newer (modification date) than FILE2
FILE1 -nt FILE2

# FILE1 is older than FILE2
FILE1 -ot FILE2

# File exists and is block special
-b FILE

# File exists and is character special
-c FILE

# FILE exists and is a directory
-d FILE

# FILE exists
-e FILE

# FILE exists and is a regular file
-f FILE

# FILE exists and is a set-group-ID
-g FILE

# FILE exists and read permission is granter
-r FILE

# File exists and write permission is granted
-w FILE

# File exists and execute (or search) permission is granted
-x FILE

# Search files (and regular expresions)
grep 

# search silently
grep -q 

# Statement 1 OR statement 2
Statement1 || Statement2

# Statement 1 AND statement 2
Statement1 && Statement2

$? # exit code (if it equals 0, there were no errors)

############## Basic Use Case
package=Fake

sudo apt install $package

echo "the exit code for the package installed is: $?"

############# To specify a specific error code for later use

directory=/Fake

if [ -d $directory ]
then
    echo "the directory $directory exists"
    exit 0
else 
    echo "the directory $directory doesnt exist"
    exit 199
fi

echo "the exit code for this script run is $?"

###############
command < file # Read input of command from file

command > file # Write output of command to file

command > /dev/null # Discard output of command

command >> file # append output to file

command1 | command2 # Pipe output of command1 to command2

########### Use Case
package=htop

sudo apt install $package >> package_install_results.log

if [ $? -eq 0 ]
then 
    echo "the installation of $package was successful"
    echo "the new command is avaiable here:"
    which $package
else 
    echo "$package failed to install" >> package_install_results.log
fi
#############

# While loops
myvar=1

while [ $myvar -le 10 ]
do 
    echo $myvar
    myvar=$(( $myvar +1))
    sleep 0.5
done

### another use case
while [ -f ~/testfile ]
do
    echo "As of $(date), the file exists"
    sleep 0.5
done

    echo "The file no longer exists on $(date)"

########################
# Universal Update Script examplle
#########################

# use to update based on loaded linus distribution
release_file=/etc/os-release

if grep -q "Arch" $release_file
then 
    # The host is based on Arch
    # Run the pacman update command
    sudo pacman -Syu
fi

if grep -q "Debian" $release_file || grep -q "Ubuntu" $release_file
then 
    # The host is based on Ubuntu, 
    # Run the apt version of the command
    sudo apt update
    sudo apt dist-upgrade
fi

####################################
# For loops
####################################

# Variables dont need to be called outside a for loop
for current_number in 1 2 3 4 5 6 7 8 9 10 # {1..10}
do
    echo $current_number
    sleep 1
done

echo "This is outside the for loop"

# Compress files in a given directory based on wildcard.log
for file in logfiles/*.log
do 
    tar -czvf $file.tar.gz $file
done


########################################
# Storing scripts
########################################

# FHS : File System Hierchy Standard
# https://wiki.linuxfoundation.org/lsb/fhs
 
#### SAVE TO usr/local/bin & update permissions
sudo mv script.sh /usr/local/bin/script # .sh not required for linux

# update permision to root for user & root for group
sudo chown root:root usr/local/bin/script 
# able to call and execute script without specifying location since its now in $PATH


########################################
# Data Streams
########################################

# Standard Output : Output that is printed to the screen (not error) 
        # designated by 1
# Standard Error : Error that is printed to the output
        # designated by 2
# Standard input : Information received from user


find /etc -type f # Find all file types # output will be standard output & Standard error

find /etc -type f 2> /dev/null # Mute standard error by redirecting values with ($?...?) 2 into oblivion (dev/null)

find /etc -type f > /dev/null # Print standard error, delete standard output
find /etc -type f 1> /dev/null # Same thing (1 is implied)

find /etc -type f 1> file.txt # save output to file

find /etc -type f &> file.txt # send both standard output and standard error to file (&&> append)

find /etc -type f 1>find_results.txt 2>find_errors.txt # send outputs seperatly

# Standard input example 
echo "Please enter you name:"
read myname 
echo "Hello $myname!"


### Change to superuser 
sudo su - # exit to exit

# watch text file close to real-time (last 10 lines)
tail -f /var/log/updater.log

#### Update Updated file
release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

if grep -q "Arch" $release_file
then
    # The host is based on Arch
    # Run the pacman update command
    sudo pacman -Syu 1>>$logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then
        echo "An error occured, please check the $errorlog file."
    fi
fi

if grep -q "Debian" $release_file || grep -q "Ubuntu" $release_file
then
    # The host is based on Ubuntu,
    # Run the apt version of the command
    sudo apt update 1>>$logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then
        echo "An error occured, please check the $errorlog file."
    fi
    sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then
        echo "An error occured, please check the $errorlog file."
    fi
fi



#######################################
# Functions
#######################################

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

check_exit_status() {
   if [ $? -ne 0 ]
   then
        echo "An error has occured, please check the $errorlog file."
   fi
}

if grep -q "Arch" $release_file
then
    # The host is based on Arch
    # Run the pacman update command
    sudo pacman -Syu 1>>$logfile 2>>$errorlog
    check_exit_status
fi

if grep -q "Debian" $release_file || grep -q "Ubuntu" $release_file
then
    # The host is based on Ubuntu, 
    # Run the apt version of the command
    sudo apt update 1>>$logfile 2>>$errorlog
    check_exit_status

    sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
    check_exit_status

########################################
# Case statements
########################################

finished=0

while [ $finished -ne 1 ]
do

    echo "What is your favorite Linux distribution?"

    echo "1 - Arch"
    echo "2 - CentOS"
    echo "3 - Debian"
    echo "4 - Mint"
    echo "5 - Ubuntu"
    echo "6 - something else..."
    echo "7 - Exit the script."

    read distro;

    case $distro in 
        1) echo "Arch is a rolling release.";;
        2) echo "CentOS is popular on servers.";;
        3) echo "Debian is a community distribution.";;
        4) echo "Mint is popular on desktops and laptops.";;
        5) echo "Ubuntu is popular on both servers and computers";;
        6) echo "There are many distributions out there.";;
        7) finished=1;;
        *) echo "You didnt enter an appropriate choice."
    esac
done

echo "Thank you for using this script"

#####################################################
# Scheduling jobs Part 1
#####################################################

# install at command 
# sudo apt install at

at 16:06 -f ./myscript.sh # run (file) script at specified time

# job 2 at Sun Oct 20 16:10:00 2024
at 16:10 102024 -f ./myscript.sh

atq # to view jobs qeue (2       Sun Oct 20 16:10:00 2024 a mikiashwt)

atrm JOBNUMBER # to remove scheduled jobs (atrm 2)


#####################################################
# Scheduling jobs Part 2
#####################################################

# schedule with cron instead of at

# Best practices are to use full qualified path for commands
logfile=job_results.log

/usr/bin/echo "The script ran at the following time: $(/usr/bin/date)" > $logfile


# cron
crontab -e

# Edit someone else's cron job
sudo crontabl -u username -e

# Edit this file to introduce tasks to be run by cron.
# 
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
# 
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
# 
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
# 
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
# 
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
# 
# For more information see the manual pages of crontab(5) and cron(8)
# 
# m h  dom mon dow   command

# 1:30am Fridays (military time)
30 1 * * 5 /usr/local/bin/script

###################################################
# Arguments
###################################################

# Script contains
echo "You entered the argument: $1, $2, $4, $3"

# When runing 
./myscript.sh Linux is Awesome too

# Output is 
You entered the argument: Linux, is, too, Awesome

#--------------

# scrip contains
lines=$(ls -lh $1 | wc -l) # wc is word count (lines)

echo "You have $(($lines-1)) objects in the $1 directory." # (()) is a subshell, it subtracts one to remove the sum count at the top of ls output

# you run
./myscript.sh /etc

# output is 
You have 163 objects in the /etc directory.

#-------------------

# better version
lines=$(ls -lh $1 | wc -l)

if [ $# -ne 1 ] # checks for an input of 1 and no more than 1
then 
    echo "This script requires exactly one directory path passed to it."
    echo "Please try again"
    exit 1
fi

echo "You have $(($lines-1)) objects in the $1 directory."


####################################################################
# Writing a backup script
####################################################################



# Check to make sure the user has enetered exactly two arguments. 
if [ $# -ne 2 ]
then 
    echo "Usage: backup.sh <source_directory> <target_directory>"
    echo "Please try again"
    exit 1
fi

# Check to see if rsync is installed
if ! command -v rsync > /dev/null 2>&1 # checking for rscync and sending standard error and standard output to oblivion
then 
    echo "This script requires rsync to be installed"
    echo "Please use your distribution's package manager to install it and try again"
    exit 2 # Different exit codes for different regions is good practice. 
fi

# Capture the current date, and time and store in the format YYYY-MM-DD
current_date=$(date +%Y-%m-%d)

rsync_options="-avb --backup-dir $2/$current_date --delete --dry-run" 
# a = archive mode
# v = verbose
# b = dont replace files in target
# --backup-dir = similar t ob
# $2/$current_date = backups are created in a directory of specific date
# --delete = ensures target directory is clone of source directory
# --dry-run = IMPORTANT = creates a similulation. 

$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log 
# Subshel provides full qualified path to rsync command
# apply rsync_options from dir 1 to dir 2, and save target files with date.

#!!!!! Once dry run confirms proper functioning. Remove --dry-run







