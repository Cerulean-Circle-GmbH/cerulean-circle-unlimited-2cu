[📁 Once Install Guide](../once-install-guide.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000077/install-oosh-and-woda.md) | [🌐 Page Structure local SymLink](./install-oosh-and-woda.page.md)

# Install oosh and WODA

Open Page: [https://github.com/Cerulean-Circle-GmbH/once.sh](https://github.com/Cerulean-Circle-GmbH/once.sh)

# Fast install - use it anywhere

## Install oosh

| **Table of content** |
| --- |
| - [Fast install - use it anywhere](#fast-install-use-it-anywhere)<br>  - [Install oosh](#install-oosh)<br>  - [Install ONCE](#install-once)<br>  - [Setup chrome inspector](#setup-chrome-inspector)<br>  - [Setup Visual Studio Code to connect WSL](#setup-visual-studio-code-to-connect-wsl)<br>  - [Setup Git](#setup-git)<br>  - [Install Docker Client in WSL](#install-docker-client-in-wsl)<br>- [Fixing oosh in Win10](#fixing-oosh-in-win10)<br>  - [Fix group](#fix-group)<br>  - [Fix ownerships](#fix-ownerships)<br>    - [Create identities and keys](#create-identities-and-keys)<br>  - [Fix hostname in oosh](#fix-hostname-in-oosh)<br>- [Analysis history](#analysis-history) |

| Method | Command |
| --- | --- |
| **curl** | `env -i sh -c "$(curl -fsSL https://raw.githubusercontent.com/Cerulean-Circle-GmbH/once.sh/main/init/oosh)"` |
| **wget** | `env -i sh -c "$(wget -O- https://raw.githubusercontent.com/Cerulean-Circle-GmbH/once.sh/main/init/oosh)"` |
| **fetch** | `env -i sh -c "$(fetch -o - https://raw.githubusercontent.com/Cerulean-Circle-GmbH/once.sh/main/init/oosh)"` |

## Install ONCE

```
# Currently only possible as root !!!
sudo su

# dependencies
apt-get install -y errno

# Install & setup
once init
once domain.set localhost
once stage next

# Start
once start
```

Start browser with → [http://localhost:8080](http://localhost:8080)

## Setup chrome inspector

- Open it with right mouse click → “Inspect”
- → Sources → File → File System
- → “Add folder to workspace”
- Select the folder `U:\var\dev\EAMD.ucp` assuming `\\wsl.localhost\Ubuntu` is mapped to `U:`

> [!INFO]
> Be aware that you do not develop on this Windows share of a WSL directory!

## Setup Visual Studio Code to connect WSL

> [!NOTE]
> It is absolutely important to not connect to the ONCE or WODA source code with natively opening the directories in Visual Studio Code.

- Install and open Visual Studio Code
- Click bottom left on the remote button
- Click “New WSL Window using Distro” (if it does not appear, type WSL …)
- Select “Ubuntu …” (resp. your prefered WSL distro
- Then open folder “/var/dev/EAMD.ucp”

## Setup Git

> [!NOTE]
> It is absolutely important to not connect to the ONCE or WODA source code with native Windows Git. This must be done through a Linux resp. WSL 2 Ubuntu shell!

- Open /var/dev/EAMD.ucp in a WSL shell (if not already done):

```
git config --global user.name "FIRST_NAME LAST_NAME"
git config --global user.email "MY_NAME@example.com"
```

For better logs in the shell see [https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs](https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs). Add to `~/.gitconfig` :

```
[alias]
lg1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
lg = !"git lg1"
```

- Add your user to the 2cuDev group in bitbucket (must be done by administrator)
- Add your public key to your to your bitbucket account
  - ```
cat ~/.ssh/id_rsa.pub
```
  - In bitbucketopen settings→Personal Settings→SSH keys→Add key
  - Give a name and copy the complete key there
  - Click Save
- Add this to your ssh config with `ossh config.edit` :
  - ```
Host 2cuBitbucket
 User git
 Port 22
 HostName bitbucket.org
 IdentityFile ~/.ssh/id_rsa
```
- Now `git pull` or `git push` should work

## Install Docker Client in WSL

- Install Docker
- Install Docker in WSL:
```
oo cmd docker.io
```
- Allow WSL in Docker
  - Docker→Settings→Resources→WSL Integration
  - Enable for “Ubuntu” (resp. your WSL distribution)

# Fixing oosh in Win10

## Fix group

Your user needs to be in the group `dev`. If not call:

```
sudo usermod -a -G dev YourUserNameHERE
```

## Fix ownerships

- Check ownership of `/var/dev/EAMD.ucp`:

```
> ll /var/dev
<snip>
drwxrwxr-x  8 developking dev  4096 Jan 19 16:40 EAMD.ucp/
```

If the permissions and/or ownership are not correct do:

```
sudo su
chown -R developking:dev /var/dev/EAMD.ucp
chmod -R g+rw /var/dev/EAMD.ucp
```

- Check ownership as user in `/var/dev/EAMD.ucp` with `git`

```
> git status
fatal: detected dubious ownership in repository at '/var/dev/EAMD.ucp'To add an exception for this directory, call:

    git config --global --add safe.directory /var/dev/EAMD.ucp

ERROR> line 13: "git" from  returned with ERROR code: EKEYREVOKED 128 Key has been revoked
```

In case of those errors, fix with:

```
git config --global --add safe.directory /var/dev/EAMD.ucp
```

### Create identities and keys

```
# To create a local configuration
ossh config create
```

See also [Install and deploy keys (and command reference)](../once-install-guide/install-and-deploy-keys-and-command-reference.md)

## Fix hostname in oosh

- Check the permissions in .ssh (700 resp. 600)
- Do:

```
config ssh.set.config win10u22_04
```

# Analysis history

See also:  [N1-21](https://2cu.atlassian.net/browse/N1-21) - Getting issue details... STATUS

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

error list and fixing list

(function(){ var data = { "addon\_key":"render-Markdown", "uniqueKey":"render-Markdown\_\_markdown5703160320974187913", "key":"markdown", "moduleType":"dynamicContentMacros", "moduleLocation":"content", "cp":"/wiki", "general":"", "w":"", "h":"", "url":"https://d27i9fmzbobp10.cloudfront.net/render-markdown.html?pageId=1853816845&pageVersion=31&macroHash=e2d12bc5-be2d-4150-8749-84a7e783f11e&macroId=e2d12bc5-be2d-4150-8749-84a7e783f11e&outputType=email&highlightStyle=&highlight=&xdm\_e=https%3A%2F%2F2cu.atlassian.net&xdm\_c=channel-render-Markdown\_\_markdown5703160320974187913&cp=%2Fwiki&xdm\_deprecated\_addon\_key\_do\_not\_use=render-Markdown&lic=none&cv=1000.0.0-9ec310e9ed61&traceId=5e028f41d73967663e497d3af94bc97d&spanId=0501b09be806b628&traceSampled=0", "structuredContext": "{\\"confluence\\":{\\"editor\\":{\\"version\\":\\"v2\\"},\\"macro\\":{\\"outputType\\":\\"email\\",\\"hash\\":\\"e2d12bc5-be2d-4150-8749-84a7e783f11e\\",\\"id\\":\\"e2d12bc5-be2d-4150-8749-84a7e783f11e\\"},\\"tracing\\":{\\"traceId\\":\\"5e028f41d73967663e497d3af94bc97d\\",\\"spanId\\":\\"0501b09be806b628\\",\\"sampled\\":\\"0\\"},\\"content\\":{\\"type\\":\\"page\\",\\"version\\":\\"31\\",\\"id\\":\\"1853816845\\"},\\"space\\":{\\"key\\":\\"CCU\\",\\"id\\":\\"229377\\"}},\\"url\\":{\\"displayUrl\\":\\"https://2cu.atlassian.net/wiki\\"}}", "contentClassifier":"content", "productCtx":"{\\"page.id\\":\\"1853816845\\",\\"macro.hash\\":\\"e2d12bc5-be2d-4150-8749-84a7e783f11e\\",\\"space.key\\":\\"CCU\\",\\"tracing.sampled\\":\\"0\\",\\"page.type\\":\\"page\\",\\"content.version\\":\\"31\\",\\"page.title\\":\\"Install oosh and WODA\\",\\"macro.localId\\":\\"593e54b1-21d0-4977-b5c5-fd273a4dda6c\\",\\"macro.body\\":\\"# Install Errors\\\\n\\\\n## 1 no user set\\\\n\\\\nIMPORTANT\\u003e generating /home/donges/config/user.env\\\\ninitializing logging\\\\n\\\\n config.add to /h\\",\\": = | RAW | = :\\":null,\\"space.id\\":\\"229377\\",\\"macro.truncated\\":\\"true\\",\\"content.type\\":\\"page\\",\\"output.type\\":\\"email\\",\\"page.version\\":\\"31\\",\\"macro.fragmentLocalId\\":\\"\\",\\"content.id\\":\\"1853816845\\",\\"tracing.traceId\\":\\"5e028f41d73967663e497d3af94bc97d\\",\\"macro.id\\":\\"e2d12bc5-be2d-4150-8749-84a7e783f11e\\",\\"tracing.spanId\\":\\"0501b09be806b628\\",\\"user.isExternalCollaborator\\":\\"false\\",\\"editor.version\\":\\"v2\\"}", "timeZone":"Europe/Berlin", "origin":"https://d27i9fmzbobp10.cloudfront.net", "hostOrigin":"https://2cu.atlassian.net", "sandbox":"allow-downloads allow-forms allow-modals allow-popups allow-popups-to-escape-sandbox allow-scripts allow-same-origin allow-top-navigation-by-user-activation allow-storage-access-by-user-activation", "apiMigrations": { "gdpr": true } } ; if(window.AP && window.AP.subCreate) { window.\_AP.appendConnectAddon(data); } else { require(\['ac/create'\], function(create){ create.appendConnectAddon(data); }); } // For Confluence App Analytics. This code works in conjunction with CFE's ConnectSupport.js. // Here, we add a listener to the initial HTML page that stores events if the ConnectSupport component // has not mounted yet. In CFE, we process the missed event data and disable this initial listener. const \_\_MAX\_EVENT\_ARRAY\_SIZE\_\_ = 20; const connectAppAnalytics = "ecosystem.confluence.connect.analytics"; window.connectHost && window.connectHost.onIframeEstablished((eventData) => { if (!window.\_\_CONFLUENCE\_CONNECT\_SUPPORT\_LOADED\_\_) { let events = JSON.parse(window.localStorage.getItem(connectAppAnalytics)) || \[\]; if (events.length >= \_\_MAX\_EVENT\_ARRAY\_SIZE\_\_) { events.shift(); } events.push(eventData); window.localStorage.setItem(connectAppAnalytics, JSON.stringify(events)); } }); }());
