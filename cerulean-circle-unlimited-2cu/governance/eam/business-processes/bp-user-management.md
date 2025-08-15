[📁 Business Processes](../business-processes.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/300000055/bp-user-management.md) | [🌐 Page Structure local SymLink](./bp-user-management.page.md)

# BP User Management

# Create a new user

- Initialize an ssh key
- Update your config
- Access for a new user

* * *

## Initialize an ssh key

First, initialize an ssh key on your computer.

```
ssh.init
```

> [!WARNING]
> **Be aware:** make sure you don't already have an .ssh folder in your home directory.  
> This command overwrites an existing ssh folder and creates an ssh.backup folder from the overwritten folder. If you execute the command again, the ssh.backup will **also be overwritten.**
> If you don't want to lose your old ssh-key, then rename your backup folder or don't run this command twice.

After the first initialization there is a new folder in your home directory with the following structure:

.ssh/  
├── id\_rsa  
├── id\_rsa.pub  
├── private\_key  
│   └── <user>.<hostname>.privat\_key  
└── public\_keys      
└── **<user>.<hostname>.public\_key**

> [!INFO]
> To access the server you need the public\_key file.  
> This file gives you someone who has access to the server.  
> Please do not share your private key!

## Update your config

Add the following lines of code in your ssh/config

```
pHost WODA.root
 User root
 Port 22
 HostName cerulean.it
 IdentityFile ~/.ssh/id_rsa

Host WODA.dev
 User developking
 Port 22
 HostName cerulean.it
 IdentityFile ~/.ssh/id_rsa
```

With this configuration you only need the servername in your command line to get access.

## Access for a new user

The process is the same whether to give a user root or developer access.

**Login as developer for developer access**

```
ssh WODA.dev
```

**Login as root for root access**

```
ssh WODA.root
```

The public\_key folder is located in the .ssh folder in the home directory.  
  
Copy the **<username>.<hostname>.public\_key** file from the new user into this folder.

```
/.ssh/public_keys/
```

The next command line updates the authorized\_key file.

```
update.authorized_key
```

If you are logged in as a different user and work in a different home directory, go to the .ssh folder and run this command line instead:

```
update.here.authorized_key
```

Now all users have access if they have their public\_key on the server
