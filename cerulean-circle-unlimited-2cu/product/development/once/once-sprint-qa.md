[📁 Once](../once.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000086/once-sprint-qa.md) | [🌐 Page Structure local SymLink](./once-sprint-qa.page.md)

# ONCE Sprint QA

- [ ] run "once test”on the server
- [ ] call [https://test.wo-da.de/test](https://test.wo-da.de/test)
- [ ] check /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1\_infrastructure/DockerWorkspaces/nakedUbuntu/20.04$ ./runDockerfile   
and start "once.sh"
- [ ] check if woda is reachable afterwards under http://localhost:8090/woda
- [ ] check [https://localhost:8443/woda](http://localhost:8090/woda) (NOT YET IMPLEMENTED)

# ToDo

- add starting and installing the postgres scenario and DB to the once script
  - and starting it obviously
- run it as a user
- having tests for it
- once config should be capable of DELETING a ONCE\_…. variable and come up with a new shell in which the config is active
- once should be capable of easily switching scenarios
  - once scenario.check
  - once scenario.fix
    - uses either $HOSTNAME
    - or once scenario.fix my.domain.name
  - ~/.once
  - $ONCE\_DEFAULT\_SCENARIO
