
# plug-ng (*next-generation)


## build scripts for
### .deb packages for debian based linux distros
### .deb packages for termux environments
### .zip or .tar packages for universal usage


# features
    - host uptime tracker
    - system load and usage monitor
    - hardware detection
        - system, cpu, motherboard,... names, types, serial
    - report system information
        - mountpoints
        - processes
    - internet connection details
        - isOn/offline tracker
        - lan connection
        - wifi connectons
        - public internet connection (ipv4 &6 addresses) 
    # local settings db
    # local cache db

# system daemons/services
    - shellscript version
    - nodejs version

# web-interface/-dashboard
    

# $ plug <cmd>

	plug init			# initializes local settings from defaults and generates new host id and keys
	plug info			# shows local id and other info
	plug config			# shows local configuration
	plug config set <key>
	plug config get <key>


	plug dashboard		# opens the dashboard (webinterface in the browser)



# installer
    if (user==root)
        destination=


    - install dest <>
    - install symbols


# installation
    git clone https://github.com/dave0xE7/plug-ng
    cd plug-ng
    bash bin/plug install