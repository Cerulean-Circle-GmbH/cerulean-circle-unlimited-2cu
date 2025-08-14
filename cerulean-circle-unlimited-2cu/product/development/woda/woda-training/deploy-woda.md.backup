# Deploy WODA

WORK IN PROGRESS

> ONCE is managing itself.
> 
> *– Marcel Donges,* 02 Feb 2023

- We only use this Commit and Push policy with its git interactions

# Git repository

This is the code and repository for the ONCE server implementation, WODA components and scenarios. It is usually located in `/var/dev/EAMD.ucp`.

Repository: `2cuBitbucket:donges/eamd.ucp.git`

See also: [https://2cu.atlassian.net/wiki/spaces/CCU/pages/1853194241/NEOM+Kickoff-Planning#Release-Planning](https://2cu.atlassian.net/wiki/spaces/CCU/pages/1853194241/NEOM+Kickoff-Planning#Release-Planning)

| **Table of content** |
| --- |
| - [Git repository](#git-repository)<br>  - [Repository health](#repository-health)<br>- [Problem with dev/neom](#problem-with-devneom)<br>- [Commit and Push policy](#commit-and-push-policy)<br>  - [Intention](#intention)<br>  - [Rules](#rules)<br>  - [Commit messages](#commit-messages)<br>  - [Flow](#flow)<br>  - [Flow visualized](#flow-visualized)<br>  - [Settings](#settings) |

### Repository health

See [http://test.wo-da.de:8086/job/Branch.Check/lastBuild/console](http://test.wo-da.de:8086/job/Branch.Check/lastBuild/console)

# Problem with `dev/neom`

We use `dev/neom` as development branch. The branches `dev` and `devel/neom` are now deleted. If you get the error:

```
error: cannot lock ref 'refs/remotes/origin/dev/neom': 'refs/remotes/origin/dev' exists; cannot create 'refs/remotes/origin/dev/neom'
```

Just call:

```
git fetch --prune
```

and it should be fixed.

Maybe you also need to remove local branches with:

```
git branch -d branch_which_is_remotely_already_deleted
```

# Commit and Push policy

We start with this policy for the NEOM PoC product increment 1 (PI-1).

## Intention

- Simple work flow to get this done and continuously integrated (CI)
- Secure 4 eyes principle. This helps to spread knowledge, improve your own code and reflect the own code in preparation of a code review.
- Balance between effort and quality

## Rules

- There are
  - official protected branches (`master` - production, `test/neom` - test resp. pre-release, `dev/neom` - daily ci development branch) and
    - ```
master # NEOM PoC production branch
- prod/neom # production with NEOM configuration
test/neom # Only Accepted Features
dev/neom # Only Reviewed By Development - 4 eyes principle per feature
```
    - See also [https://2cu.atlassian.net/wiki/spaces/CCU/pages/1853194241/NEOM+Kickoff-Planning#Release-Planning](https://2cu.atlassian.net/wiki/spaces/CCU/pages/1853194241/NEOM+Kickoff-Planning#Release-Planning)
      - [https://bitbucket.org/donges/eamd.ucp/branch/master](https://bitbucket.org/donges/eamd.ucp/branch/master)
      - [https://bitbucket.org/donges/eamd.ucp/branch/test/neom](https://bitbucket.org/donges/eamd.ucp/branch/test/neom)
      - [https://bitbucket.org/donges/eamd.ucp/branch/dev/neom](https://bitbucket.org/donges/eamd.ucp/branch/dev/neom)
  - personal branches (`feature-...`, ...) on bitbucket
    - ```
feature/neom/<issue-#>_<text>
```
    - e.g.
      - [https://bitbucket.org/donges/eamd.ucp/branch/feature/neom/N1-186-put-woda-commit-policy-in-place](https://bitbucket.org/donges/eamd.ucp/branch/feature/neom/N1-186-put-woda-commit-policy-in-place)
- Changes to official branches **must** go through a pull-request and code review (4 eyes principle)
- Naming of feature branches is connected with the JIRA ticket (`feature/neom/<issue-#>_<text>`)

## Commit messages

Commit messages must have a simple structure, contain the Jira issue number, a type, a subject and optionally a body.

Example:

```
N1-100 Add template 1.0.0 and Metaverse component

Optionally more text
```

> [!NOTE]
> Number of Jira ticket is important!

Other convention could be: [https://www.conventionalcommits.org/en/v1.0.0/](https://www.conventionalcommits.org/en/v1.0.0/)

## Flow

| **Flow** | **What** | **Then** |
| --- | --- | --- |
| (1) Start a new feature branch | Create branch:<br><br>- Jira ticket (e.g.  [N1-186](https://2cu.atlassian.net/browse/N1-186) - Getting issue details... STATUS ) → “Show Git development panel” → “Create branch”<br>- Select repository `donges/eamd.ucp` and `dev/neom` (and make them default)<br>- → Click: “Create branch”<br><br>Local checkout:<br><br>```<br>git fetch<br>git checkout feature/neom/N1-186-put-woda-commit-policy-in-place<br>```<br><br>*Remark:* `git checkout` *should not need "*`-b`*" because the branch is already created through JIRA.* | local |
| (2) Commit changes | See commit messages above<br><br>```<br>git status<br>git add <files_n_dirs><br>git commit -m "feat: N1-186 Add ..."<br>``` | local |
| (3) Push feature branch | Push local branch<br><br>```<br>git push<br>``` | Pushes changes |
| (4) Code review | Create a “pull request” from feature branch to `dev/neom` (in b[itbucket.org)](http://bitbucket.org)<br><br>Bitbucket → “Pull requests” → “Create pull request”<br><br>*OR*<br><br>Jira ticket (e.g.  [N1-186](https://2cu.atlassian.net/browse/N1-186) - Getting issue details... STATUS ) → “Show Git development panel” → “Create pull request”<br><br>Select repository `donges/eamd.ucp`, your branch and `dev/neom`<br><br>→ Click: “Create pull request“ | Mergeable with min one reviewer<br><br>Additionally require a specific group of reviewers ![(question)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/help_16.png) |
| (5) Local update | Local update of feature branch from dev branch during a feature development (with feature branch)<br><br>```<br>git pull --rebase origin dev/neom<br>``` | local |
| (6) Update code review | Push local branch (as pull request update)<br><br>```<br>git push<br>``` | updates pull request |
| Push local branch (as update after rebase)<br><br>```<br>git push<br>``` | forbidden (“rejected”), push enforces fast forward<br><br>(alternative: delete/recreate branch + recreate pull request) |
| (7) Code review done - Merge | The reviewer reviews the pull request and gives feedback.<br><br>> [!INFO]<br>> The reviewer might approve or request for changes.<br><br>If the reviewer approves, then the “Merge” button will be enabled.<br><br>![](./attachments/Screenshot%202023-02-14%20at%2017.08.50-20230214-160856.png)<br><br>Click merge and do not forget to tick “Close source branch”, if you are about to close the ticket.<br><br>> [!INFO]<br>> The developer is responsible to merge his/her own code after successful code review. |     |
| (8) Local restart | Local update after successful merge<br><br>```<br>git pull<br>```<br><br>→ Start a new feature branch (1) | local |
| Try to violate rules ![(wink)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/wink.png) | Push `master`, `dev/neom` or `test/neom`<br><br>```<br>git checkout dev/neom<br><make changes in file><br>git commit -m "I should not do it!" <file><br>git push<br>``` | forbidden (“remote rejected“) |

## Flow visualized

| **Current deployment process** |
| --- |
| ![](./attachments/branch%20with%205.png) |

## Settings

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Settings for JIRA

![](./attachments/Screenshot%202023-02-13%20at%2018.22.08.png)

![](./attachments/Screenshot%202023-02-13%20at%2018.22.22.png)

![](./attachments/Screenshot%202023-02-13%20at%2018.24.00.png)

![](./attachments/Screenshot%202023-02-13%20at%2018.23.36.png)

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Settings for BitBucket

![](./attachments/Screenshot%202023-02-13%20at%2018.24.46.png)

![](./attachments/Screenshot%202023-02-13%20at%2018.24.33.png)