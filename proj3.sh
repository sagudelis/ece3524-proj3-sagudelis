#!/bin/bash

#display menu options
echo "---------------------------"
echo "Main Menu"
echo "---------------------------"
echo "1. Operating system info" 
echo "2. Hostname and DNS info" 
echo "3. Network info" 
echo "4. Who is online"
echo "5. Last logged in users" 
echo "6. My IP address" 
echo "7. My disk usage"
echo "8. My home file-tree" 
echo "9. Process operations" 
echo "10. Exit" 

#allow the user to select options until they chose to exit
while [ true ]; do
	read -r -p "Enter your choice [ 1 - 10 ] " option
	case $option in
		1)
			#print out header
			echo "------------------------------------------------------"
			echo "System information"
			echo "------------------------------------------------------"

			#get information and display on command line
			osnm=$(uname)
			echo "Operating system : $osnm"
			lsb_release -a
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		2)
			#print out header
			echo "------------------------------------------------------"
			echo "Hostname and DNS information"
			echo "------------------------------------------------------"

			#get information and display on command line
			hn=$(hostname)
			echo "Hostname : $hn"
			dns=$(dnsdomainname)
			echo "DNS domain : $dns"
			fqdn=$(hostname -f)
			echo "Fully qualified domain name : $fqdn"
			netadd=$(hostname -i)
			echo "Network Address (IP) : $netadd"
			dnsip=$(hostname -id)
			echo "DNS name servers (DNS IP) : $dnsip"
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		3)
			#print out header
			echo "------------------------------------------------------"
			echo "Network information"
			echo "------------------------------------------------------"
			
			#get information and display on command line
			intcount=$(ls -A /sys/class/net | wc -l)
			echo "Total network interfaces found : $intcount"
			ipaddr=$(ip addr show)
			echo "*** IP Addresses Information ***"
			echo "$ipaddr"
			netnr=$(netstat -nr)
			echo "***********************"
			echo "*** Network routing ***"
			echo "***********************"
			echo "$netnr"
			neti=$(netstat -i)
			echo "*************************************"
			echo "*** Interface traffic information ***"
			echo "*************************************"
			echo "$neti"
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		4)
			#print out header
			echo "------------------------------------------------------"
			echo "Who is online"
			echo "------------------------------------------------------"
						
			#get information and display on command line
			who=$(who -H)
			echo "$who"
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		5)
			#print out header
			echo "------------------------------------------------------"
			echo "List of last logged in users"
			echo "------------------------------------------------------"
			
			#get information and display on command line
			last=$(last)
			echo "$last"
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		6)
			#print out header
			echo "------------------------------------------------------"
			echo "Public IP information"
			echo "------------------------------------------------------"
			
			#get information and display on command line
			#pubIP=$(hostname -I)
			pubIP=$(host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}')
			echo "$pubIP"
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		7)
			#print out header
			echo "------------------------------------------------------"
			echo "Disk Usage Info"
			echo "------------------------------------------------------"
			
			#get information and display on command line
			diskUsage=$(df --output=pcent,target | sed 1d)
			echo "$diskUsage"
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		8)
			#print out header
			echo "------------------------------------------------------"
			echo "My home file-tree"
			echo "------------------------------------------------------"
			
			#run proj1.sh
			sh proj1.sh
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		9)
			#print out header
			echo "------------------------------------------------------"
			echo "Process operations"
			echo "------------------------------------------------------"
			
			#run proc.sh
			sh proc.sh
			
			#wait for enter key to continue
			read -p "Press [Enter] key to continue..."
			;;
		10)
			break
			;;
		*) echo invalid option;;
	esac
done
				
					
				
				
				
				
				
				
				
				
				
				
