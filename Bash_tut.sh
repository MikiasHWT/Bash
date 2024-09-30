# Determine what shell youre usuing
echo $SHELL 

# Find bash
which bash 

# This will pass in current process ID (i.e. your shell) and return the name.
ps -p $$

# information on kernel used.
uname -a  
uname -r
cat /proc/version 



pwd # print working directory
ls # list contents
nano # create & open file
touch # create file
rm # remove file
chmod # alter permissions
cat # read out contents of file
./[Script.sh] # execute contents of ccript 

# subshell: To save comand outputs as a variable (Create variables in lowercase)
files=$(ls)
now=$(date)

# Standard variable 
$USER
env # to view standard variables

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

-f # Checks for file
-v # 
-y # assume yes

# manual/help page for tests
man test


































