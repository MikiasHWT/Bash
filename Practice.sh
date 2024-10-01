# Print values from 1-50
for n in {1..50}
do 
    echo $n
done

####################################################################################################################################

# Print odd values from 1-99
for n in {1..99}
do
    if (($n % 2 != 0))
    then
        echo $n
    fi
done

####################################################################################################################################

# Welcome user
read name 
echo "Welcome $name"

####################################################################################################################################


# Given two integers, X and Y, find their sum, difference, product, and quotient.
read X
read Y
echo $((X + Y))
echo $((X - Y))
echo $((X * Y))
echo $((X / Y)) # results in integer devision, which is always rounded down. 

####################################################################################################################################

# Given two integers X and Y, compare the two 
read X
read Y

if ((X < Y))
then 
    echo "X is less than Y"
elif ((X > Y))
then 
    echo "X is greater than Y"
else 
    echo "X is equal to Y"
fi

####################################################################################################################################

# Read user input for Yes or No. and standardize output
read X

if [[ "$X" == "Y" || "$X" == "y" ]]
then
    echo "YES"
elif [[ "$X" == "N" || "$X" == "n" ]]
then 
    echo "NO"
fi

# Alternate method
read X

case "$X" in
    [Yy]) echo "YES" ;;
    [Nn]) echo "NO" ;;
       *) echo "invalid input" ;;
esac

####################################################################################################################################

# Given three integers (X, Y, and Z) representing the three sides of a triangle, identify whether the triangle is scalene, isosceles, or equilateral.
read X
read Y
read Z
if (( X == Y && Y == Z ))
then 
    echo "EQUILATERAL"
elif (( X == Y || X == Z || Z == Y))
then
    echo "ISOSCELES"
else 
    echo "SCALENE"
fi

####################################################################################################################################

# A mathematical expression containing +,-,*,^, / and parenthesis will be provided. Read in the expression, then evaluate it. Display the result rounded to 3 decimal places. 

read expression
result=$(echo "scale=3; $expression" | bc -l)
echo $result # The result is truncated NOT rounded

# Alternate mothod with appropriate rounding
read expression
result=$(echo "$expression" | bc -l)
printf "%.3f\n" "$result"

# Breakdown of printf "%.3f\n":

    # %.3f: This is the format specifier for floating-point numbers.
       # %: The start of a format specifier.
       # .: The dot indicates precision for floating-point numbers.
       # 3: The number after the dot (3) specifies the number of decimal places to include (in this case, 3).
       # f: Stands for floating-point number.

####################################################################################################################################

# Given N integers, compute their average, rounded to three decimal places.
# Input Format: The first line contains an integer, N. Each of the following N lines contains a single integer.
# Output Format: Display the average of the N integers, rounded off to three decimal places. 

read N
sum=0

for ((i = 1; i <= N; i++))
do
    read number
    sum=$((sum + number))
done

average=$(echo "$sum / $N" | bc -l)

printf "%.3f\n" "$average"


# for (( initialization; condition; increment )); do
    # # commands
# done

# Breakdown of for ((i = 1; i <= N; i++)):

   # i = 1:
        # This part initializes the loop counter i to 1.
        # The loop will start with i having the value 1.

   # i <= N:
        # This is the condition that determines whether the loop should continue.
        # The loop will run as long as i is less than or equal to N.
        # Once i becomes greater than N, the loop will terminate.

   # i++:
        # This is the increment step.
        # After each iteration of the loop, the value of i is incremented by 1 (i.e., i = i + 1).
        # The ++ operator is shorthand for adding 1 to i.

# Additionally
# $((...)) is only for integer arithmetic in Bash 
# $(...): This is used for command substitution in Bash


####################################################################################################################################

# Given N lines of input, print the 3rd character from each line as a new line of output. It is guaranteed that each of the lines of input will have a character.


# Read input line by line
while read -r line # -r flag to force literal reading of input (in the case a \ is used, without -r it would interpret it as an escape character )
do
  # Extract and print the 3rd character using cut (-c for character selection)
  echo "$line" | cut -c 3
done


####################################################################################################################################

# Display the 2nd and 7th character of each inputed line

while read -r line
do 
    echo "$line" | cut -c 2,7
done

####################################################################################################################################

# Display a range of characters starting at the 2nd position of a string and ending at the 7th position (both positions included).

while read -r line
do
    echo "$line" | cut -c 2-7
done

####################################################################################################################################
# Display the first four characters from each line of text. 

while read -r line
do 
    echo "$line" | cut -c -4
done



####################################################################################################################################
# Given a tab delimited file with several columns (tsv format) print the first three fields.

while read -r line
do
    echo "$line" | cut -f 1-3
done

####################################################################################################################################
# Print the characters from thirteenth position to the end.
while read -r line
do
    echo "$line" | cut -c 13-
done













































































####################################################################################################################################

# Creating a Fractal Tree from Y-shaped branches
# This challenge involves the construction of trees, in the form of ASCII Art.
# We have to deal with real world constraints, so we cannot keep repeating the pattern infinitely. So, we will provide you a number of iterations, and you need to generate the ASCII version of the Fractal Tree for only those many iterations (or, levels of recursion). A few samples are provided below.

# Iteration #1
# In the beginning, we simply create a Y. There are 63 rows and 100 columns in the grid below. The triangle is composed of underscores and ones as shown below. The vertical segment and the slanting segments are both 16 characters in length. 

# Iteration #2
#At the top of the left and right branches of the first Y, we now add a pair of Y-shapes, which are half the size of the original Y. 

# Input Format: A single integer, N.

# Constraints: N <= 5

# Output Format: The Nth iteration of the Fractal Tree, as shown above. It should be a matrix of 63 rows and 100 columns. (i.e. 6300 printable characters) It should be composed entirely of underscores and ones, in a manner similar to the examples provided. Do not include any extra leading or trailing spaces. 

WWWWWWWWOOOOOOOOOOOOOOOOOOOOOOOOOOOWWWWW FMSideways!










