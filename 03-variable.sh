# If we hold some data with some name t is variable
# If we assign a name to a set of data then it is called as a variable

# User defined variables
# syntax: var = data

x=10

# Access: $var or ${var}


echo x value is $x

#System Special Variables

#$0, $1, ...., $n
#$#, S*, $?


# $? - Exit status of a command

ls
echo exit status - $?

#Exit status : 0-255
#0- Success
#1-255 - Failure


echo x value is ${x}
$?

$0
#$1
#$2
#$3
#$#
#$*
