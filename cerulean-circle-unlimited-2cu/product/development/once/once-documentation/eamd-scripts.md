# EAMD Scripts

### What is EAMD Scripts?

EAMD, is a shell script that makes your work station ready for “Cerulean Circle“ and installs initial dependencies. i.e. Node

### What is Shell Script?

A shell script is a computer program designed to be run by the Unix/Linux shell. A shell is a command-line interpreter and typical operations performed by shell scripts include file manipulation, program execution, and printing text.

### EAMD installation steps?

Follow this “[LINK](./2cu.atlassian.net/wiki/spaces/CCU/pages/38436869/ONCE_Documentation.md)” to step by step installation steps.

### Known Issue

In some scenarios. `eamd` command not works and we can run the same command with `./eamd` (give a try).  
To fix that issue you can run command:-  
`eamd init links` that command help us to run directly without `./`  

```
>eamd
no warn.log.... mitigated using internal functions...status: ok
usage: /root/scripts/eamd command parameter
        options are
            -x  get debug log
            -X  enable stepDebugger    c continues ... most other exit ... try ll,r,h,cd,cmd
        commands are                           - Short details what it does

            check: checks the installation and settings
            reset: ensures all properties are set do default. 
                   !!! USE: . eamd reset
            init:  creates the /EAMD.ucp link
                eamd init                      - shows init options
                eamd init user <?user:root>    - installes the 'user scripts' for convenience
                eamd init profile              - includes init user....also the othe init options are additiv
                eamd init ssh <?user:root>     - sets up the SSH config to sync with the EAMD.ucp Repository
                eamd init components           - Clones the EAMD.ucp Repository to the local directroy
                
                eamd init all                  - all of the abave
            create:
                eamd create component some.component.Name 0.1.0         - commits and pusches to git
                eamd create local component some.component.Name 0.1.0   - no git actions

                eamd create local component some.component.Name <?version>
                eamd create version   some.component.Name 0.2.0
                eamd create version   . 0.2.0
                eamd create weBean    . <?version> <?weBeanName=Name>
                eamd create test      some.namespace.component 0.1.0
                eamd create mochaTest some.namespace.component 0.1.0
            component:
                eamd component export
                eamd component exportVersion
                eamd component import Some.zip <?targetdir:/var/dev/EAMD.ucp/Components> - in /EAMD.ucp/eport
                eamd test packageExport packagename
            update:
            list: <?componentFullQualifiedName=.> <?version> <?weBeanName=Name>
            repo:   acts on branches of git
                eamd repo                      - shows repo options
            test:
                eamd test someFunction some parameters
                eamd test namespace2path some.namespace
                eamd test path2namespcae /some/path
                eamd test findVersions .

                eamd test createFromNPM org.playground.Bootstrap 4.0.0 bootstrap
                eamd test updateVersionTree com.twitter.Bootstrap 3.3.7 5.0.0

                eamd test checkCommand ssh openssh
                eamd test checkCommand ssh openssh
            
            only for developer use:
            v:    get a version timestamp
            op:   update the script itself from once on localhost...use v to check the timestamp if it worked
                eamd op x down: like op but for root only
                eamd op x here: like op but for the current user

```