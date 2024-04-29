# exercise_for_Debian_package  
This is a simple exercise that related to the operations of Debian package.  


## Environment  
Operating System: Ubuntu 20.04 LTS  


## Guide for Users  
Step 1:  
Install the dpkg-dev previously.  
```console
sudo apt install dpkg-dev
```

Add the line into /etc/apt/sources.list  
```bash
# custom source
deb-src http://archive.ubuntu.com/ubuntu/ focal main
```

Then, update apt management tools  
```console
sudo apt update
sudo apt-get update
```

Step 2:  
Download a existed debian package.  
```console
apt-cache search hello
apt-get source hello
```

Step 3:  
Move into hello folder.  
Add the testing.sh file into hello folder. Write the message and redirect stdout to stderr.  
The example is below.  
```shell
#!/bin/bash
#
# This script is a simple exercise to print some text on the terminal
#
# 04/29/2024

echo "this is a test from Yu-Hsin Wang" >&2

exit 0
```

Then, add the execute permission for testing.sh.
```console
chmod +x testing.sh
```

We can execute testing.sh to check the result.
```console
./testing.sh
```


