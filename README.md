# vmshare

Setting up the vmshare repository

1) Create a directory on windows to share
	C:\Users\mcunningham\Documents\thumb\vmshare

2) Share new directory in VirtualBox as vd_vmshare

3) Create repo on github

4) on vm machine
   as root:
	mkdir /mnt/vmshare
	chmod 777 /mnt/vmshare

   as michael:
	cd /mnt/vmshare
	echo "# vmshare" >> README.md
	git init
	git add README.md
	git commit -m "first commit"
	git config --global user.name "Michael Cunningham"
	git config --global user.email "napacunningham@gmail.com"
	git remote add origin https://github.com/michaelcunningham/vmshare.git
	git push -u origin master

Adding repository to another server
In this case I have another directory on windows and it is shared to the vm as vd_vmshare

1) on vm machine
   as root:
	mkdir /mnt/vmshare

   as michael:
	cd /mnt/vmshare
	git clone https://github.com/michaelcunningham/vmshare.git .
