#Day 1 challenge-
#!/bin/bash
: '<<task
Scripts are also identified with a shebang. Shebang is a combination of bash # and bang ! followed the the bash shell path. This is the first line of the script. Shebang tells the shell to execute it via bash shell. Shebang is simply an absolute path to the bash interpreter.
task'

echo "Welcome to my Day 1 Task"
echo "Your Bash"
which bash
a="Hello"
echo $a

# read p Mesaage var_name cmd used to accept input from user and store it into varname
read -p "Enter user name" name
echo "$a $name"

# built in variables - built-in variables are predefined variables that are available to the shell and can be used in scripts without having to be set or exported first.
echo "Built in variable out put; bash:$BASH,bash version: $BASH_VERSION,home:$HOME,pwd: $PWD,hostname:$HOSTNAME"
echo "Name of script execusted $0"

# ./day1.sh arg1 arg2
echo "Fist Arguement passed to script : $1"
echo "Second argument passed to script : $2"

echo "Number of arguments : $#"

#Print all the arguments passed to the script as a single string
echo "All argument passed as single string : $*"

# Print all the arguments passed to the script as separate strings
echo "All arguments paased as seprate string: $@"

# Print the process ID of the current shell
echo "Process ID of current shell: $$"

# Print the process ID of the last command run in the background
echo "Background process ID: $!"



echo "Wildcards  ------"
echo "list of files ends with sh:"
ls *.sh
