# exercise_for_Debian_package  
This is a simple exercise that related to the operations of Debian package.  


## Environment  
Operating System: Ubuntu 20.04 LTS  

## Preparation  
For this exercise, you need to create the Launchpad account and upload your OpenPGP key.  
Launchpad: https://launchpad.net/  
OpenPGP keyserver: https://keyserver.ubuntu.com/  

In Ubuntu, you can use gpg command to generate the key pair.  
```console
gpg --gen-key
```


## Guide for Users  
If you want to install this package, you can directly install the .deb file.  
```console
sudo apt install ./hello_3.0.3-yuhsin_amd64.deb
```

Then, you can test the hello command and the testing.sh file.  
```console
dpkg -S testing.sh; testing.sh
```


#### Step 1:  
Install the dpkg-dev and related packages previously.  
```console
sudo apt install dpkg-dev
sudo apt install vim git dpkg-dev devscripts debhelper
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

#### Step 2:  
Download a existed debian package.  
```console
apt-cache search hello
apt-get source hello
```

#### Step 3:  
Move into hello folder.
Create a folder at debian/scripts
```console
cd hello-3.0.3
mkdir debian/scripts
vim debian/testing.sh
```

Add the testing.sh file into debian/scripts folder. Write the message and redirect stdout to stderr.  
The example is below.  
```shell
#!/bin/bash
#
# This script is a simple exercise to print some text on the terminal
#
# 04/29/2024
set -e
echo "this is a test from Yu-Hsin Wang" >&2
exit 0
```

Then, add the execute permission for testing.sh.  
```console
chmod +x debian/testing.sh
```

We can execute testing.sh to check the result.  
```console
./debian/scripts/testing.sh
```

#### Step 4:  
Add postinst file into debian folder for showing the message during installation time.  
```console
vim debian/postinst
```

Then, write the message and output to stdout (default).  
```bash
#!/bin/bash
#
# This script will echo the string during installation time.
#
# 04/30/2024
set -e
echo "this is a test from Yu-Hsin Wang"
exit 0
```

Also, change the execute permission.  
```console
chmod +x debian/postinst
```

#### Step 5:  
Write the debian/changelog file for this custom package.  
```console
vim debian/changelog
```
For example (in the debian/changelog):  
```bash
hello (3.0.3-yuhsin) focal; urgency=low

  * Customize hello package with custom messages on Ubuntu 20.04

 -- Yu-Hsin Wang <yuhsinwa@gmail.com>  Tue, 01 May 2024 23:04:00 +0800
```
The name of version (3.0.3-yuhsin) that you can customize it.  
You should change the distroseries according to your environment.  
If the name is wrong, it may get a rejected when you upload this package to the ppa on the Launchpad.  

#### Step 6:  
You can change the information of debian/control.  
This step will not affect the running of this exercise.  

#### Step 7:  
Create the debian/install file to add the binary/scripts to this package.  
For example:
```console
vim debian/install
```

In the debian/install
```bash
debian/scripts/* /usr/bin/

```

#### Step 8:
Move to the repository.  
Create a archive file of hello-3.0.3 named hello_3.0.3.orig.tar.gz.  
Generate related source file to include the binary file.  
```console
cd ..
tar zcvf hello_3.0.3.orig.tar.gz hello-3.0.3
dpkg-source --include-binaries -b hello-3.0.3
```

#### Step 9:  
Finally, you can generate the .change file and upload this package to the ppa on the Launchpad.  
```console
cd hello-3.0.3
debuild -S
```

If you want to build .deb file and install in local, you can run the command below.  
It will generate the .deb file.  
```console
dpkg-buildpackage -us -uc -b
```

#### Step 10:  
dput the package to the ppa on the Launchpad.  
```console
dput ppa:<your-id>/<your-ppa-name> <.change_file>
```

Then, you can add the repository.  
```console
sudo add-apt-repository ppa:<your-id>/<your-ppa-name>
```

After about 30 minutes, you can install this custom package.  
```console
sudo apt install hello
```

