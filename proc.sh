#!/bin/bash

#display menu options
echo "(please enter the number of your selection below)"
echo " "
echo "1. Show all processes" 
echo "2. Kill a process" 
echo "3. Bring up top" 
echo "4. Return to Main Menu"
echo " "

#allow the user to select options until they chose to exit
while [ true ]; do
	read -r -p "Enter your choice [ 1 - 4 ] " option
	case $option in
		1)
			show=$(ps -ef)
			echo "$show"
			;;
		2)
			echo "Please enter the PID of the process you would like to kill:"
			read pid
			kill $pid
			;;
		3)
			top
			;;
		4)
			break
			;;
		*) echo invalid option;;
	esac
done
	
