AngularDev
----------

Automation for building a basic Angular dev environment in a Vagrant VM based on Yeoman Angular
Genrator. The VM is based in a Ubuntu Trusty Server (14.04 LTS) base box, but the provisioning
script should work in any Debian-based distribution.

All basic dependencies of Yeoman Generator are installed such as NodeJS, NPM, Ruby, Compass
and some NPM packages.


Get AngularDev box
------------------

First of all, you need to get your AngularDev base box. If you don't feel like generating your
own, you can use the prehosted ones:

AngularDev 32bits:
```
	vagrant init willyneutron/angularDev32; vagrant up --provider virtualbox
```

AngularDev 64bits:
```
        vagrant init willyneutron/angularDev64; vagrant up --provider virtualbox
```

If you want to build your own AngularDev VM, just run `create_box.sh` and follow the steps to 
generate the box from a clean Ubuntu trusty base. This process will take a while. This way you
can customize the base box, RAM or net parameters.

After building and customizing the VM, it is possible to package it into a box by running 
`package_box.sh <vm_box_name> <vm_box_package_filename>.box`


Start Yeoman Generator
---------------------- 

From this point, just connect via ssh and create a project. You can follow a totorial in
Yeoman website:

http://yeoman.io/codelab/scaffold-app.html

FAQ
----

*When I try to install some NPM packages inside my VM, NPM freezes or gets killed unexpectedly*
Your VM is running out of RAM. Add some more in Vagrantfile, at least 1024MB.

*When I run my VM it takes forever or get stuck trying to connect via SSH ("Warning: Authentication failure. Retrying...")
*
Recheck your net configuration in Vagrantfile. Setting up net as "public_connection" and setting
a fixed IP usually solves the problem. In some cases, the VM takes a long time to initialize SSH
services, so be patient!
