[📁 Once Documentation GitHub](/cerulean-circle-unlimited-2cu/product/development/once/once-documentation.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/once/once-documentation/once-system-requirements.md) | [🌐 Index Structure local SymLink](./once-system-requirements.entry.md)

# Once System requirements

# What is required to run ONCE / WODA on an own server

- some naked linux distribution in its latest long term support version (LTS)
  - we like Ubuntu 20.04 LTS
  - we tested on
    - Debian
    - Arch Linux
    - Mac OSX
    - WSL 2 (Windows Subsystem for Linux V2 running one of the linux systems above)
- a latest docker runtime [https://www.docker.com/products/container-runtime](https://www.docker.com/products/container-runtime)
  - installed on the naked linux
    - e.g. on ubuntu: `sudo apt install docker.io`
    - test installation if `docker ps` command works and gives at least the following output  
`CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS`
  - docker should come with the command
    - `docker-compose up` or `docker compose up`
- if not further specified the linux should com with full “root" rights

## Where do I continue if I have access to naked linux and I am logged in as root

Read here: [../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/38436869/ONCE_Documentation.md#use-the-once.sh-script](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/38436869/ONCE_Documentation.md#use-the-once.sh-script)  
and start on code line 6 and 7
