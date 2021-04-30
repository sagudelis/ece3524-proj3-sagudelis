#!/bin/sh

#Make a Variable to Hold the Name of the Output File
outFileName="filetree.html"

#Check that the top level directory is a directory 
if ! [ -d "$HOME" ]; then
	#display error message
	echo "ERROR: $HOME is not a directory"
	exit 1
fi
#Check that the top level directory is accessible
if ! [ -r "$HOME" ]; then
	#display error message
	echo "ERROR: Permission denied for $HOME"
	exit 1
fi

#recursive function to print subdirectory tree to .html
makeTree () {
	#if the current file/directory is readable, continue
	if [ -r "$1" ]; then
		#if current is a directory
		if [ -d "$1" ]; then
			#output the directory name to the output file
			echo "<li> $(basename $1) </li>" >> $outFileName
			#for each file/directory in the top level of current
			for each in $(find "$1" -mindepth 1 -maxdepth 1 | sort); do
				echo "<ul>" >> $outFileName	#formatting
				#calls the recursive function for each 
				[ -e "$each" ] && makeTree "$each"	
				echo "</ul>" >> $outFileName	#formatting
			done
		#if current is a file
		elif [ -f "$1" ]; then
			#output the file name and link to the output file
			echo "<li><a href=$1> $(basename $1) </a></li>" >> $outFileName
		fi
	fi			
}

#call recursive function
makeTree "$HOME"

