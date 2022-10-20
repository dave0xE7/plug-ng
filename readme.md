
# plug-ng (*next-generation)


## build scripts for

### .deb packages for debian based linux distros

### .deb packages for termux environments

### .zip or .tar packages for universal usage

#

# features
- host uptime tracker
- system load and usage monitor
- hardware detection
    - system, cpu, motherboard,... names, types, serial
- report system information
    - mountpoints
    - processes
- report session infos
- sync console histories
- internet connection details
    - isOn/offline tracker
    - lan connection
    - wifi connectons
    - public internet connection (ipv4 &6 addresses) 
- tor hidden-service for sshd

# componnets

- data
    - local settings db
      - polling time
      - 
    - local cache db
- system daemons/services
    - shellscript version
    - nodejs version
- web-interface/-dashboard

-------


# $ plug \<cmd>
    plug help

    plug install
	
    plug init			# initializes local settings from defaults and generates new host id and keys
	
    plug info			# shows local id and other info
	
    plug config			# shows local configuration
	plug config set <key>
	plug config get <key>

    plug service        # run node src/app/main.js

	plug dashboard		# opens the dashboard (webinterface in the browser)



# [installer](src/install.sh)
    if (user==root)
        destination=


    - install dest <>
    - install symbols


# [platforms](resources/platform/)
- ## [debian](resources/platform/debian/)
- ## [termux](resources/platform/termux/)


# How to install?
    git clone https://github.com/dave0xE7/plug-ng
    cd plug-ng
    bash bin/plug install