#!/bin/bash

#v.1: creates script-file (or exits if file already exists), sets permissions, adds "#!/bin/bash" to first line

name=$1

#check if $name is a file that already exists in folder, if yes, end the whole script.
if [[ -f $name ]]; then
	echo "Error: The file \"$name\" already exists in this directory. Script terminates, no changes have been made."
	#exit 0 is "Success", exit 1,2,3... is error 
	exit 0
fi

touch $name
#set permissions to -rwxr-----
chmod 740 $name
echo "Created script-file \"$name\" with file mode bits:"
#could also only show file mode bits (by piping or possibyl using an ls option), but this is handy as is. 
ls -l $name

#write "#!/bin/bash" into first line of file if charcount of file is 0 (so only if file is empty)
binbash="#!/bin/bash"
charcount=$(wc -m $name | cut -f1 -d' ')
if [[ "$charcount" == "0" ]]; then
	echo $binbash >> $name
	echo "file is good to go"
else 
	echo "Could not add $binbash to the first line because character count of file is not 0. Other than that, file should be good to go."
fi

