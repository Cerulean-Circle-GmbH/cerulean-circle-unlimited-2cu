[📁 Woda Component Doc GitHub](/cerulean-circle-unlimited-2cu/product/development/woda/woda-component-doc.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/woda/woda-component-doc/branchfeature-deployment-intro.md) | [🌐 Index Structure local SymLink](./branchfeature-deployment-intro.entry.md)

# Branch/Feature deployment intro

**Point to consider before deployment**

1. Test and deployment are the responsibility of the developer itself.
2. Later this role assigned to the dedicated owner “tester“ and “DevOps“.

**Pre-Deploy points**

1. You should have access to the Test/Staging server. [Shantanu Kushwaha (Unlicensed)](https://2cu.atlassian.net/wiki/people/5d8def929f69410dca90c037?ref=confluence) will help you to setup.
2. You can access the test server “ssh woda.test” in the terminal and “ssh woda.staging“
```
ssh woda.test
```

> [!NOTE]
> we don’t have staging/production.

**These are the 4 server setup to deploy your branch on production**

![](./attachments/image-20210412-051556.png)

**Local Development**

- It's your local environment with latest <sprint branch> + <new feature>,
- Tested local and the whole project works fine after your new changes.

**Test Deploy**

- Inform team about using the Test environment to avoid clashes.
- Clean environment and pull latest <Sprint> branch.
- Test new features and overall project.
- Inform team about <Test Environment> free.

**Staging Deploy**

- Staging is a replica of production with production data.
- With all the latest features, but on hold for production.

**Production Deploy**

- Production release

> [!NOTE]
> Developer responsibility
> - Develop, test and deploy the feature/branch on “Test environment“ before review.

# Branch Naming Conventions

- ssh
  - WODA.dev
  - WODA.test
  - WODA.prod
- Domian
  - [dev.wo-da.de](http://dev.wo-da.de)
  - test.wo-da.de
  - [wo-da.de](http://wo-da.de) === [prod.wo-da.de](http://prod.wo-da.de)
- branches
  - dev/WODA
  - test/WODA
  - prod/WODA

how to map test/sprint27 to the process of staging
