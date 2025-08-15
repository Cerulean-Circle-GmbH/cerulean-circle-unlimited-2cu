[📁 Contracts Discussion](../contracts-discussion.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/300000015/agpl.md) | [🌐 Page Structure local SymLink](./agpl.page.md)

# agpl

- [UniDoc-EULA-2020](./agpl/unidoc-eula-2020.md)

* * *

- [key Thoughts](#key-thoughts)
  - [oracle](#oracle)
  - [needs](#needs)
  - [Quick Reference](#quick-reference)
- [way forward](#way-forward)
- [faq](#faq)
  - [copyleft](#copyleft)
  - [What is a Copyleft License?](#what-is-a-copyleft-license)
  - [copylft vs copyright](#copylft-vs-copyright)
  - [agpl](#agpl)
    - [vorteile dual licensing](#vorteile-dual-licensing)
- [Dual-Licensing Open Source Business Models](#dual-licensing-open-source-business-models)
  - [What Is a Dual-Licensing Model?](#what-is-a-dual-licensing-model)
  - [Who's Doing It?](#whos-doing-it)
  - [IP and Licensing Concerns](#ip-and-licensing-concerns)
  - [Corporate Concerns](#corporate-concerns)
  - [Does It Work?](#does-it-work)
- [Abk.](#abk)

* * *

- [ ] [Marcel Donges](https://2cu.atlassian.net/wiki/people/557058:26fa7b10-cf49-473c-81c1-fee4e574a9f7?ref=confluence) Companies may require outside developers agree to a contributor license agreement

# key Thoughts

## oracle

> “Our open source license permits you to use \[WODA Kernel\] \[. . . \] at no charge under the condition that if you use the software in an application you redistribute, the complete source code for your application must be available and freely redistributable under reasonable conditions. If you do not want to release the source code for your application, you may purchase a license from Oracle.”(see [www.oracle.com](http://www.oracle.com))

## needs

## Quick Reference

| License | Use | Change | Distribute | Limitation |
| --- | --- | --- | --- | --- |
| agpl | Yes |     |     | Non-Commercial |
| agpl | Yes | Yes | Yes | Non-Commercial |
| CCG-Evaluation Offering | Yes | Yes |     | Trial |
| CCG-Development License | Yes | Yes |     | Internal |
| CCG-SEL Subscription Offering | Yes | Yes | Yes | SMB |
| [PolyForm-Perimeter](https://polyformproject.org/licenses/perimeter/) | Yes | Yes | Yes | No Competition with Software |
| [PolyForm-Shield](https://polyformproject.org/licenses/shield/) | Yes | Yes | Yes | No Competition with Provider |

[https://polyformproject.org/](https://polyformproject.org/)

# way forward

[https://spencerjones.blog/dual-licensing-deep-dive/](https://spencerjones.blog/dual-licensing-deep-dive/)

- [ ] First, you've got to create software to license. You should create a software package intended to be incorporated and released in another software product.
- [ ] Include the license file in the source of the codebase, and publish *publicly* on a registry like `github`.
- [ ] You'll need the non-packaged, source code availalbe as well to satisfy GPL, so publish the code on Github or where you like to host your source code.
- [ ] Anyone can use and distribute your open source UI Kit in their applications as long it's also open source. AND
- [ ] But, if someone at a company wants to use it in a *closed-source, distributed* application, you'll need to provide a way for them to purchase your UI Kit under a *separate*, commercial license.
- [ ] You could use a license like the commercial license from SOPERA / SUSE to cover usage of your UI Kit.

# faq

## copyleft

Copyleft is a method of making intellectual property reusable and modifiable without any restrictions, except that anything new produced using the original asset must also be available freely. This can apply to everything from works of art to software.

[https://snyk.io/learn/what-is-copyleft-license/](https://snyk.io/learn/what-is-copyleft-license/)

## What is a Copyleft License?

Copyleft licenses allow software to be modified and re-distributed by anyone as long as the same rights are also preserved in derivative works.

## copylft vs copyright

Copyleft is the opposite of copyright, and is used widely in Open Source development, the copyleft license allows creators, contributors, and maintainers to make changes to open source projects, and share them with the community.

## agpl

[https://www.gnu.org/licenses/agpl-3.0.en.html](https://www.gnu.org/licenses/agpl-3.0.en.html)

Wird irgendein Programm auf diesem Webserver unter der GNU AGPL freigegeben, muss der Webserver Nutzern eine Möglichkeit zum Herunterladen des korrespondierenden Quellcodes bieten. Das ist soweit gut, aber mit diesem Quellcode wird ihnen keine Kontrolle über die auf dem Webserver durchgeführte Datenverarbeitung gegeben. Ebenso wenig wird geklärt, was für andere Software möglicherweise noch auf diesem Webserver ausgeführt wird, ihre Daten auf andere Weise untersuchend und ändernd.

### vorteile dual licensing

Mit diesem Lizenzierungsprinzip können Unternehmen eigene Anwendungen entwickeln, ohne diese selbst wieder der Open-Source-Lizenz unterwerfen zu müssen. So ist es einerseits möglich, das Open-Source-Modell zur Entwicklung und Distribution von Software zu fördern, und andererseits ein professionelles Geschäftsmodell zu etablieren, bei dem Softwarelizenzen ohne Einschränkungen verkauft werden können. Für eine Mehrfachlizenzierung spricht des Weiteren die Möglichkeit, die Software mit proprietären Erweiterungen zu versehen.

Käufer einer mehrfach lizenzierten Software sind darüber hinaus nicht an die teils sehr restriktiven Vorgaben zur Weitergabe von Software unter einer freien Lizenz gebunden. Die Entwicklung freier Software wird gefördert, ohne auf Spenden angewiesen zu sein.

[https://de.wikipedia.org/wiki/Mehrfachlizenzierung](https://de.wikipedia.org/wiki/Mehrfachlizenzierung)

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Dual-Licensing Open Source Business Models

# Dual-Licensing Open Source Business Models

*To Open Source or not to Open Source - that is the question. Or is it? Open Source has matured into a robust development model, and many businesses that shied away from it are reconsidering it. The good news these days is that Open Source is no longer an all-or-nothing choice.*

## What Is a Dual-Licensing Model?

A dual-licensing model is a business model in which a company that markets a commercial software product gives its licensees the choice of two licensing models: Open Source and closed source (or "proprietary"). In this business model, a customer can choose to license the software under the terms of an Open Source license such as the GNU General Public License (GPL). Open Source licenses let licensees sublicense the product's source code to multiple levels of sub-licensees, but require re-licensing in source code format, usually on identical terms. Alternatively, the customer can choose a closed source or proprietary license with more conventional licensing terms that limit his ability to re-license the product, or restrict him to object code sublicenses only.

The theory is that the dual-licensing model helps both the free software community and the commercial software licensee. The open availability of source code lets the software be improved by those who have the right to change it under an Open Source license. The proceeds from commercial licensing help fund additional development, and help establish the product as a commercial standard.

## Who's Doing It?

Several companies have broken ground by launching dual-licensing models.

The best known is mySQL AB, which produces an Open Source database. mySQL has two license options: a commercial license and a modified GPL license, which allows the licensee to distribute mySQL code under GPL side-by-side with other FLOSS licenses.

Commercial licensees get a commercially supported product with a level of assurance from mySQL that doesn't require that their mySQL-based software be Open Sourced. mySQL can offer a commercial license because it owns the mySQL code. The commercial license sells for several hundred dollars per server. The two licensing models cover identical products.

TrollTech AS uses a dual-licensing model with its QT product, a C++ application development framework. It charges a per-developer price for its commercial license. The two licensing models cover identical code bases. The free licensing model is available under the GPL (or the QPL, a free software license that's not that widely used).

Active Endpoints, Inc. uses a different strategy, having launched a separate Open Source product that complements its core product. Its ActiveBPEL engine is a runtime environment for executing processes based on the BPEL4WS 1.1 specification. It is the core of Active Endpoints' ActiveWebflow family. Active Endpoints licenses the Active BPEL Engine under the GPL, and its suite of products on commercial licensing terms.

Mandrakesoft distributes a popular Linux distribution. It, too, has multiple license options, but its commercial product is different from its free software. Mandrake's Web site says that "The difference is not the license of our products, but the licenses of third-party software contained in the commercial distributions. Download edition Mandrakesoft products only include components licensed under a Free Software/Open Source License. Commercial products may also include software add-ons that are covered by a proprietary license that often prevents free copying and redistribution of the product."

SleepyCat Software distributes Berkeley DB, a data storage and retrieval development package, under multiple licenses. Its Open Source option requires any redistribution to include source code. It also offers commercial licenses: "If you do not want to release the source code for your application, you may purchase a license from Sleepycat Software," it says.

Many Open Source projects offer licenses under multiple Open Source options - such as the Mozilla Foundation, which gives its licensees the choice of Mozilla, GPL, or LGPL.

## IP and Licensing Concerns

Lurking in all of this are some profound legal issues:

- ***Ur-Licensing***: The decision "to Open Source or not to Open Source" is only possible for the original author of software code - the "Ur-licensor." This is because, once software is licensed under a "viral" or free software license, it must forever be licensed under those terms. No licensee can change this. The necessity of being the original author is borne out by the dual-licensing businesses described above. All that offer commercial licenses are the authors of their code - but for Mandrakesoft the exception proves the rule. Its commercial licensing option is dictated by third-party licensing terms.
- ***Contributions***: The premise of dual licensing is that the community can contribute to the product's code base to build better code. So, assuming a company has the right - by virtue of having written its code - to give its licensees a choice of Open Source or commercial terms, it must decide how to manage contributions from the Open Source community. There are two ways to go about it: by requiring contributors to assign all rights to their contributions to the company, or to require the contributors to grant a license to the company that's broad enough to allow redistribution on both commercial and non-commercial terms. Either approach can meet with significant resistance from the contributor community, so public relations - and a good licensing FAQ - are key.
- ***Trademarks***: Any company launching any business initiative needs to consider branding. Open Source businesses are no different, but the trademark policies covering Open Source products can be trickier than for proprietary software. The problem, in a nutshell, is that trademark law and Open Source are fundamental opposites. Trademarks are only as valuable as their owners make them by controlling the quality and source of the products that bear them. Losing control means losing rights through a process known as dilution or blurring. But Open Source is all about lack of control. A company can decide to grant the right to modify its software to all and sundry. But it must decide how far to let those modifications stray from the official release before the product's branding has to be changed. Different Open Source companies and projects approach this issue differently. Some allow limited use of the mark associated with the product; some allow none. A savvy dual-licensing model requires serious thought about trademark policy, as well as active policing of the policy to avoid compromising of a company's trademark rights.
- ***Patents***: Finally, any company that offers Open Source licensing terms for code it has written must consider the effect on its patent portfolio. Releasing code under Open Source licenses can give licensees an implied license to a patent that covers the code - though the scope of that license will be unclear. Some of the more "corporate" Open Source licenses include express patent grants, and this helps clarify the scope of the patent licenses that are included. But any commercial enterprise that releases Open Source code must make this decision with its eyes open after formulating a general patent strategy.

## Corporate Concerns

Companies pursuing a dual-licensing strategy should consider the lesson - learned too dear and too late by many start-ups - that distinct businesses are better separated into different operating entities. While many in the business community are embracing Open Source as a development method or a business model, some still consider it a substantial negative. A start-up may find that a potential acquirer or investor dislikes the idea of buying or investing in Open Source assets, or, at least, doesn't value those assets seriously. If your acquirer tells you that it loves your product, but doesn't want to be involved in Open Source, you may need to segregate the Open Source business prior to sale. Doing this on the eve of an acquisition can be difficult, as any CEO who's gone through a spin-off can tell you. The longer a business operates, the harder it is to segregate its multiple business lines. Assets like copyrights, trade secrets, trademark rights, and goodwill can be difficult to un-mingle. The solution may be to create dual corporations to handle your dual-licensing model.

Creating dual corporations also helps compartmentalize liability, so your for-profit business won't be responsible for losses or liabilities that the Open Source project may incur. But to preserve this advantage, you'll need to follow corporate formalities like directors' meetings and corporate minutes, or the "corporate veil" that limits liability can fail.

If you decide to use a dual-corporate structure with your dual-licensing model, you might also consider designating one of them as a not-for-profit entity. Many Open Source projects operate through public benefit corporations (classified under 501(c)(3) of the Internal Revenue Code). However, before doing this, you should consult a tax attorney or an advisor who's experienced in this area to establish this status and help set your expectations. Keep in mind that not-for-profit entities are obliged to operate for the benefit of the public at large, not to remove liabilities and costs from your for-profit balance sheet. Transfer payments between for-profit and not-for-profit entities can land you in tax trouble, and compromise your not-for-profit status. This status has other more important uses - getting donations and grants, and garnering goodwill with the community. It also lets you invite participation by board members who prefer not to sit on boards of private for-profit corporations.

## Does It Work?

In a sense, the business theory behind dual licensing is nothing new. Software companies have historically offered "lite" versions of their products as teasers, shareware, or free evaluation copies. Familiar examples are the video game Doom (which was licensed for free in a version that contained only a few levels, whereas the full game contained many others), and the Netscape browser (which was licensed for free to users of the client portion, whereas the server portion was licensed to businesses on commercial terms). Hardware companies have traditionally included software - even software source code - free with their products to leverage hardware sales. This is sometimes called "widget frosting." For instance, a company that sells computer hardware may Open Source its drivers or interface tools, which are not normally sold separately to the customer. And of course IBM is a major proponent of Linux, which drives sales of its hardware, software, and consulting services.

So, there's no reason for dual licensing not to work as a business model. It's too early to tell, but the dual-licensing model seems to be serving the companies doing it - not only for financial success but to engender community support as well. Dual-licensing models are accepted by most members of the Open Source community, and increasingly by investors concerned with the bottom line.

© 2007 SYS-CON Media Inc.

# Abk.

**Authorized Distributor |** A distributor authorized to provide genuine software.

**Certified Partner |** A Partner status providing proven competences in different areas.

**Competitive Upgrade |** A previous license option to migrate from a third-party product.

**End User License Agreement (EULA) |** EULA is a contract between the licensor and purchaser, establishing the purchaser’s right to use the software.

**Enterprise Agreement |** A license program (perpetual) to standardize desktop licensing with the latest versions of Microsoft licenses.

**External Connector License |** A server license to cover server access by external users.

**Full Package Product License (FPP) |** A license included within a boxed product, purchased from retailers.

**License Assignment |** A license needs to be assigned to a device or a user before deploying/accessing the software.

**License Inventory Report |** A summary, provided by Microsoft, of licenses known to be purchased by the customer.

**Non-Perpetual |** In Microsoft licensing terms this means that a license provides use rights for a limited period of time only.

**Open License |** A license program (containing OPEN-NL and OPEN C, OPEN Value and OPEN Value subscriptions) for low license volumes.

**Perpetual License |** In Microsoft licensing, a perpetual license gives use rights without time limitations. A non-perpetual license is limited to a particular period of time.

**Product activation |** Some products and online services are protected by technological measures and require activation and a Volume License key to install or access them.

**SAM (Software Asset Management) Engagement Letter |** Announcement of a so-called friendly compliance audit.

**Software as a Service (SaaS) |** On-demand services as application service providing.

**Subscription License |** A licensing model (non-perpetual) to ensure that the latest version is licensed. The programs are: EA Subscription, OPEN Value, MSDN.

**Trial Version |** A product from Microsoft limited to a certain time period for the purpose of evaluation. Trial versions are usually limited to 90, 120 or 180 days.

**True Up |** A yearly report to Microsoft of claimed licenses within a subscription license or Enterprise Agreement.

**Virtual Machine |** A non-physical machine providing an OSE.
