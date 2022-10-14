
# plug-ng (*next-generation)


## build scripts for
### .deb packages for debian based linux distros
### .deb packages for termux environments
### .zip or .tar packages for universal usage


# features
    - host uptime tracker
    - system load and usage monitor
    - hardware detection
    - offline detection
    - internet connection details
    - lan connection
    - wifi connectons
    # local settings db
    # local cache db



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