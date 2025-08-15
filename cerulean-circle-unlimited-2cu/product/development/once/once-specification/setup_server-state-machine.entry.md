# SETUP_SERVER state machine

| **enter** |     | **Remark (mostly in check methods)** | **follow up** |
| --- | --- | --- | --- |
|     | \[0\] = not.installed | defined in `state.machine.init` |     |
| `initialising state machine: SETUP_SERVER` | \[1\] = initialized |     |
| first `state.add` | \[2\] = setup |     |
| first `state.next` in oo.`private.init.state.machine()` | \[3\] = all.states.added |     |
| `state.machine.start oo` | \[4\] = started |     |
| `state.next` | \[5\] = 11  <br>`found transition state: 5 => 11` | auto to 11 |
|     | \[6\] = to.be.deleted |     |
|     | *\[11\] = "next.custom.state" (overridden)* |     |
| auto from 5 | \[11\] = remote.install.started | Only checks `$SSH_CONFIG_FROM_REMOTE` | `create.result` 12 |
|     | *\[12\] = 99 (overridden)* | *defined in state.machine.init* | *auto to 99* |
|     | \[12\] = local.install.started | Only checks `$OOSH_DIR/this` |     |
| `state next` | \[13\] = priviledges.checked | Check if user is root or has active sudo rights | `create.result` 30 (if sudo)<br><br>`create.result` 20 (else) |
|     | \[20\] = user.rights.only | recheck 13 | recheck 13 |
|     | \[21\] = user.installation.done | Only checks `$HOME/oosh` |     |
|     | \[22\] = user.mode.release | Checks `"$OOSH_MODE" = "released"` |     |
|     | \[23\] = user.mode.dev | Checks `"$OOSH_MODE" = "dev"` |     |
|     | \[30\] = root.rights | recheck 13 | recheck 13 |
| `state next` | \[31\] = root.shared.dev.folder.created | Creates shared dev folder<br><br>(and links `config` and `oosh` so that a different implementation of the state machine is continued with) |     |
|     | \[32\] = root.dev.keys.installed | nothing yet |     |
|     | \[33\] = root.installation.done | nothing yet |     |
|     | \[40\] = user.shared.dev.folder.linked | makes `config` and `oosh` a link to shared dev (but already done in 31) |     |
|     | \[41\] = user.state.machine.synced.with.root | nothing yet |     |
|     | \[50\] = headless.setup.started | nothing yet |     |
|     | \[51\] = headless.setup.finished | nothing yet |     |
|     | \[60\] = once.setup.started | once init  <br>once set.domain localhost  <br>once stage.next |     |
|     | \[61\] = once.setup.finished | nothing yet |     |
|     | \[99\] = finished | nothing yet |     |
|     | \[100\] = 6 | defined in `state.machine.init` | auto to 6 |