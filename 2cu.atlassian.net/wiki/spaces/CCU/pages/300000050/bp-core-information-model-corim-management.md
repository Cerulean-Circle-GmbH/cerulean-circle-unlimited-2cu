[📁 Business Processes GitHub](/cerulean-circle-unlimited-2cu/governance/eam/business-processes.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/governance/eam/business-processes/bp-core-information-model-corim-management.md) | [🌐 Index Structure local SymLink](./bp-core-information-model-corim-management.entry.md)

# BP Core Information Model (CorIM) Management

A CorIM is a platform independent functional model (**PIM**) that describes the **Why** and **What** of a product.  
Starting from a **vison** or a **value proposition**, **goals** are derivable, which will be further realized in **business processes**.  
In addition all external stimuli (**triggers**) are collected **actor** based. This triggers are then used to derive **use cases**, which are grouped by the already derived business processes. The sum of all use cases fully describes the system.  
While proceeding with this description, a **glossary** will be established in order to provide a unique meaning for all used terms.  
Each of this use cases are then described in detail by a **use case template** (see: [https://2cu.atlassian.net/l/c/4cmaLugK](https://2cu.atlassian.net/l/c/4cmaLugK) ), which is a one pager.  
A use case describes the What with a dynamic and the static part. For the dynamic part **activity diagram**s are used. As activities are operating on **domain object**s, an **objects diagram** is used for this aspect.

### Agile link

A concrete path from start to end within an activity diagram of a use case is called **scenario** or **activity path**.  
It can be described as an Agile **user story** with **acceptance criteria**.

> As an **<actor>**  
> I want a **<scenario path functionality>**  
> So I have a **<goal>**

It is possible to derive at least two to three kinds of **test cases** from these acceptance criteria.  
A happy path-, a bad path-test and a edge case-test case. The format is shown below.

> #Happy|Bad|Edge-test case
> 
> **Given** <preconditions>  
> **When** <executing functionality>  
> **Then** <expected result>

### Tool chain

As vision/value proposition, goals, business processes and use cases are **high level descriptions**, they are almost **stable over time**. So they are described in **Confluence**, whereas user stories and test cases are **refined during application life cycle** over and over again. So this information is organized in **Jira** and **linked** via **Jira Epics** to the use case descriptions in Confluence. Adding a **Jira Query Report** which lists all user stories with status DONE to each use case in Confluence, will provide a **living real time documentation** for the system.  
If in addition the correlated test cases are executed automatically and are all GREEN, then the system is also **fully functional verified in real time**.
