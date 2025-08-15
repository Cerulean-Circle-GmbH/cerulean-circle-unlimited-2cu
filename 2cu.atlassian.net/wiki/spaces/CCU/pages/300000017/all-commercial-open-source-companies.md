[📁 Contracts Discussion GitHub](/cerulean-circle-unlimited-2cu/governance/cc-internals/contracts-discussion.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/governance/cc-internals/contracts-discussion/all-commercial-open-source-companies.md) | [🌐 Index Structure local SymLink](./all-commercial-open-source-companies.entry.md)

# All Commercial Open Source Companies

![](./attachments/image-20230314-121901.png)

[https://docs.google.com/spreadsheets/d/17nKMpi\_Dh5slCqzLSFBoWMxNvWiwt2R-t4e\_l7LPLhU/edit#gid=0](https://docs.google.com/spreadsheets/d/17nKMpi_Dh5slCqzLSFBoWMxNvWiwt2R-t4e_l7LPLhU/edit#gid=0)

The license picker:

[https://heathermeeker.com/license-picker-2-0/](https://heathermeeker.com/license-picker-2-0/)

I want a dual licensing business: anyone who will not share source code should pay me for a license.

I am seeking, or intend to seek, patents that read on my software.

I don’t need my software to be useable in the Linux kernel.

My software is the kind that others will use (including local or SaaS) but don’t need to distribute.

My software is an entire program.

My software does not need to be useful in consumer electronics.

# About the License Picker

The best open source license to apply to your code depends on your objectives.  Once you know your objectives, the license pretty much picks itself, if we follow some simple rules.

First, this picker assumes that there are only handful of reasonable choices: GPL, LGPL, MPL, Apache 2.0, BSD, MIT, public domain (CC Zero) and **AGPL**.   The reason for the limited choices is that picking an unusual license will usually backfire, because it will limit adoption.  If you think you want to pick an open source license but none of these is good enough, you may not really want an open source license, and should consult with an expert on how to achieve your code release goals. But at least, you should choose a different license only with caution. To be clear, this does not mean these are the best written licenses, viewed in a vacuum — just that they are usually the best choices.

If you want to see the exact logic for the license picker, you can view the HTML/Javascript, but the main rules are:

- If you need to **protect your patents,** you should choose a license with patent terms, such as GPL3,LGPL3, MPL2 or Apache 2.0. There are differences of opinion over how to manage patents relating to open source software, so your patent lawyers may not agree with this rule.
- If you must be **compatible with the Linux kernel**, you can only choose GPL 2 or a compatible license, such as LGPL 2.1, BSD or MIT. GPL2+ or LGPL2.1+ will also work. MPL2 will also do in a pinch.
- If you expect people to adopt your software for use in commercial IoT, you can’t choose GPL3 (or its variants) because most developers will not adopt it, *due to the Installation Information provisions.*
- If your software will not typically be distributed, then choosing a copyleft license like GPL is not useful, because its copyleft provisions will not matter.

There are many combinations of answers that don’t work together (such as patent grants, IoT and SaaS), and when the picker encounters such a case, it produces an alert as to which path it is taking and which element it prioritizes.

When several options would meet your criteria, the picker will choose the most popular or permissive option, or a “version+” option, on the assumption that maximum compatibility and promoting adoption is an overarching goal.

Of course, this tool mostly a thought experiment.  I wrote it to “eat my own dog food” in the sense that I had to write Javascript and HTML, and systematize my thoughts about the rules.  So it may not be the right advice for you.  But I welcome questions, comments and suggestions.

[https://www.gnu.org/licenses/agpl-3.0.en.html](https://www.gnu.org/licenses/agpl-3.0.en.html)

# AGPL -the great review

The GNU Affero General Public License is designed specifically to ensure that, in such cases, the modified source code becomes available to the community.

Therefore, public use of a modified version, on a publicly accessible server, gives the public access to the source code of the modified version.

> Each contributor grants you a non-exclusive, worldwide, royalty-free patent license under the contributor's essential patent claims, to make, use, sell, offer for sale, import and otherwise run, modify and propagate the contents of its contributor version.

With AGPL, software teams can ensure all changes to the codebase becomes available to the public, even on server-side applications.

- Ensures that any code snippet developed by the open source community stays available and prevents others from repackaging and selling open-source software.

![](./attachments/image-20230314-124504.png)

[https://snyk.io/learn/open-source-licenses/](https://snyk.io/learn/open-source-licenses/)

## [Copyleft Licenses](https://snyk.io/learn/open-source-licenses/#copyleft)

The most popular copyleft open source licenses, in order of restrictiveness, are AGPL, GPL, LGPL, EPL, and Mozilla:

- The [**GNU General Public License (GPL)**](https://snyk.io/learn/what-is-gpl-license-gplv3-explained/)preserves license notifications and copyright terms and is suitable for commercial, patent, and private use. Any software that uses GPL code must distribute all its source code under the same license. So if you use GPL code in your software (e.g., by using a GPL library), and distribute your application, all your source code must be made available under the same GPL license. This restriction makes the GPL a strong copyleft license.
- The [**Affero GPL (AGPL)**](https://snyk.io/learn/agpl-license/) only adds only one clause, but an important one for some software. Because the GPL license is only triggered when software is distributed, there is a loophole for software that is made available over the network only, i.e., not explicitly “distributed”. The AGPL license closes this loophole by including a remote network interaction clause that triggers the GPL license for any software used over a network.

> [!INFO]
> A licensee must remember that just because software may be freely available, it does not mean there are no obligations. Unknowingly or negligently using software subject to a restrictive open source license such as the GPL may create unintended consequences for licensees who fail to understand the underlying obligations. A licensee prepared to ask the right questions is the most equipped to avoid compliance issue and avoid costly compliance failures.

Types of Software licenses:

- Subscription licensing – temporary licensing that has to be renewed at set times, as opposed to perpetual licenses which are one-time costs
- loating/network license – gives a large group of users a limited number of licenses to share between them
- Device/workstation licensing – limits the license to a particular computer, no matter who is using it
- Named vs. concurrent users- named licenses allow only specific users no matter who else is using the software, as opposed to concurrent licenses which allow a limited number of simultaneous users within an organization, no matter who they are
- Metered/pay-per-use – consumption-based licensing fees, with software that automatically records the number of uses or time used
- Featured licensing – a software license that limits the number of features used or the number of times particular features are used
