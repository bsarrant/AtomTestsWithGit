# AtomTestsWithGit
test repository for valuating Atom in team work and BAU context

## write-up on github web interface
20180110-4:19PM : initialization of the readme file with basic log

## issue while pulling data from github

```
22:13:09.752997 git.c:344               trace: built-in: git 'pull' 'origin' 'master'
22:13:09.753998 run-command.c:626       trace: run_command: 'fetch' '--update-head-ok' 'origin' 'master'
22:13:09.767007 git.c:344               trace: built-in: git 'fetch' '--update-head-ok' 'origin' 'master'
22:13:09.770010 run-command.c:626       trace: run_command: 'ssh' 'git@github.com' 'git-upload-pack '\''bsarrant/AtomTestsWithGit.git'\'''
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

[Github help on Error: Permission denied (publickey)](https://help.github.com/articles/error-permission-denied-publickey/)

### 1st Investigation

```
C:\Users\user
λ ssh -vT git@github.com
OpenSSH_7.1p2, OpenSSL 1.0.2g  1 Mar 2016
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Connecting to github.com [192.30.253.112] port 22.
debug1: Connection established.
Could not create directory '/home/bruno.sarrant/.ssh'.
debug1: key_load_public: No such file or directory
debug1: identity file /home/bruno.sarrant/.ssh/id_rsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/bruno.sarrant/.ssh/id_rsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/bruno.sarrant/.ssh/id_dsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/bruno.sarrant/.ssh/id_dsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/bruno.sarrant/.ssh/id_ecdsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/bruno.sarrant/.ssh/id_ecdsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/bruno.sarrant/.ssh/id_ed25519 type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/bruno.sarrant/.ssh/id_ed25519-cert type -1
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_7.1
debug1: Remote protocol version 2.0, remote software version libssh_0.7.0
debug1: no match: libssh_0.7.0
debug1: Authenticating to github.com:22 as 'git'
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: server->client chacha20-poly1305@openssh.com <implicit> none
debug1: kex: client->server chacha20-poly1305@openssh.com <implicit> none
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ssh-rsa SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8
The authenticity of host 'github.com (192.30.253.112)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Failed to add the host to the list of known hosts (/home/bruno.sarrant/.ssh/known_hosts).
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: SSH2_MSG_SERVICE_REQUEST sent
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey
debug1: Next authentication method: publickey
debug1: Trying private key: /home/bruno.sarrant/.ssh/id_rsa
debug1: Trying private key: /home/bruno.sarrant/.ssh/id_dsa
debug1: Trying private key: /home/bruno.sarrant/.ssh/id_ecdsa
debug1: Trying private key: /home/bruno.sarrant/.ssh/id_ed25519
debug1: No more authentication methods to try.
Permission denied (publickey).
```

#### Lead #1: defining the 'HOME' W10 variable as follows `set HOME = %USERPROFILE`
But it doesn't work because we got the previous ssh debug logs where ssh.exe points to the `/home/bruno.sarrant/.ssh/` directory
see [this link ](https://superuser.com/questions/735801/ssh-could-not-create-directory-home-username-ssh)

#### Lead #2: check the "password" file configuration regarding the "home" path definition
however it doesn't work in my case because I'm using TortoiseGit which provided the whole ssh configuration
> So that message occurs every single time that I attempt to login to the remote machine.
> So the question is, how do I solve this problem? The solution was actually quite simple!
> First locate the file called 'passwd' in your C:\path\to\cygwin\etc directory and open it with wordpad.
> Second, replace the text
> /home/YOUR_NAME
> with
> /cygdrive/c/Documents and Settings/YOUR_NAME
> Finally, save the file.

see [this link](https://ekawas.blogspot.fr/2007/03/solving-pesky-ssh-issues-in-cygwin.html)

### Lead #3: installing `atom/tortoise-git`
a package was developed for allowing Atom to interact with installed TortoiseGit
(see [dev page](https://github.com/beckenrode/tortoise-git))
* direct installation process with help of `package manager` seems not working
* test with the command line `apm install tortoise-git` instead
* results: no available realease
```
C:\Users\user
λ apm install tortoise-git
Installing tortoise-git to C:\Users\user\.atom\packages failed
No releases available for tortoise-git
```

## Interim solution
* Using Atom for development / write-ups
* Managing Versioning with TortoiseGit
* Pursue the investigations with a focus on TortoiseGit
* Potential solution :
  - clean the environment
  - install a git / cygwin Versioning solution
  - retest the leads above
