# Comparison Of Codeigniter framework

As a business owner, you want CodeIgniter 3 to meet the following important components:

1. Security
2. Performance
3. 3rd party Integrations

#1. Security – CodeIgniter 2 vs. CodeIgniter 3  
In the past few years security has become a huge concern for Internet-based applications. Hackers not only challenge websites, but also potentially harm users. Most major frameworks and CMS solutions release security patches regularly to ensure an up-to-date security system.  
CodeIgniter provides security functions. XSS Filtering is one example. XSS Filtering usually protects from cross site scripting by using the following function: $this->security->xss\_clean()  
CodeIgniter 2.x had a bug in the xss\_clean function though. Malicious users now can bypass the function and inject cross site scripting. Ellis Labs received many requests to have this bug fixed, but it wasn’t fixed until BCIT took over and created CodeIgniter 3.  
With CodeIgniter 3.x hackers cannot bypass the xss\_clean function to inject XSS. The new version has the following updates:

- Cross site scripting

xss\_clean()

- Header injections

Base\_url() will fallback to $\_SERVER\[‘SERVER\_ADDR’\], when $config\[‘base\_url’\] is empty in order to avoid Host header injections.

- CAPTCHA helper is changed to use the operating system’s PRNG.
- This new version is more secure than version 2.x.

#2. Performance – CodeIgniter 2 vs. CodeIgniter 3  
As a business owner, you want your website to function well, managing the load of many users and providing them quick search results. In order to meet this expectation, the website code has to be optimized.  
The code functions need to fetch records immediately after a search is performed. The database plays an important role as data is fetched from the database via custom queries. So, in short, database functions provided by the code frameworks need to be written and used well.  
When it comes to performance, we noticed a few bugs with CodeIgniter 2. CodeIgniter 3 has helped by making the following improvements:

- Caching library: APC, Memcache has been added to improve performance.
- Query builder method count\_all\_results() is fixed to not fail even when ORDER BY condition is used.
- Database method improvements

simple\_query() has been fixed. In earlier versions this function executed queries without checking if the connection was initialized.  
csv\_from\_result() has been optimized for speed with larger result sets.

- The library has been modified for a few other performance fixes.

#3. 3rd-Party Integrations – CodeIgniter 2 vs. CodeIgniter 3  
One of the major needs today is bringing 3rd-party integration to your business website. The integrations can include Sales CRM data, Email subscription, Calendar schedule, or Social media accounts. These could be in the form of API, JSON, XML, iFrame, or direct query fetch. The framework you use for developing the website should be flexible enough to support them.  
CodeIgniter has always supported integrations with 3rd-party libraries. This latest version is no exception. CodeIgniter 3 supports a number of 3rd-party file extensions and system libraries. Examples include ICS calendar file, Google Earth (kmz and kml) and PEM. One of the major changes is added support for DSN configuration setting for drivers that support DSN strings (PDO, PostgreSQL, Oracle, ODBC, CUBRID). All this makes the web application perform better.  
Other Important Changes – CodeIgniter 2 vs. CodeIgniter 3  
Besides security, performance and 3rd-party integrations, there are still many improvements in version 3.x. Here are some important ones:

- Updated PHP: Increases security and performance

CodeIgniter requires PHP 5.2.4 and recommends 5.4+  
PHP 5.1.6 is not supported anymore

- File Naming Conventions: Improves standard coding practices

Class file names now must be uppercase first and everything else lowercase

- Database Performance: Makes queries faster

The default database driver is changed to ‘mysqli’  
The old ‘mysql’ driver has depreciated

Differences between versions 3.x & 4.x  
CodeIgniter 4 is very different from 3 and below you will see a little about the main differences between them.  
#1 - Support for PHP versions  
To use CodeIgniter 4 the minimum PHP version required is 7.2, while with CodeIgniter 3 it is possible to use from version 5.6 (which has already been completely discontinued).  
#2 - Directory organization  
The file structure is completely different. CodeIgniter 4 has its structure organized in 5 directories: /app,/system,/public,/writable,/tests. While CodeIgniter 3 is organized in 2 directories:/applicationand/system\`.  
#3 - Use of namespaces  
CodeIgniter 4 is written entirely in PHP 7 and makes use of namespaces, while CodeIgniter 3 does not use namespaces.  
#4 - Autoloading  
CodeIgniter 4 has a much more efficient autoload process, and one of the factors that help is the use of namespaces. While in CodeIgniter 3 it is necessary to manually configure most of the files to be loaded.  
#5 - Use of entities  
CodeIgniter 4 has native support for the use of Entities (entities) that help in structuring the database part of an application, representing the existing columns in the tables. CodeIgniter 3 did not have this feature and anyone who needed to use it needed to use third-party libraries and make adjustments to the file upload to support it.  
#6 - Performance  
CodeIgniter 4, for using PHP 7 in writing and as a minimum configuration on the server, and other aspects, has a better performance than CodeIgniter 3.  
#7 - Monolithic Libraries  
Unlike CodeIgniter 3, in this new version the use of monolithic libraries in the PEAR style is almost zero.  
#8 - Settings  
With CodeIgniter 4, the initial settings for your application to start running are minimal, while in CodeIgniter 3 it was necessary to perform a good number of configurations.  
#9 - Native support for .env files  
CodeIgniter 4 has native support for .env files, allowing an optimization of the settings of the different environments where it may be running (production, tests, development). This feature did not exist natively in CodeIgniter 3.  
#10 - Migration between versions  
CodeIgniter 4 is not backward compatible, so the process of updating applications from version 3 to version 4 will require a little more work, but it is not at all complicated.  
While the migration from version 2.x to 3.x, and between the different versions 3.x was just overwriting the files in the /system directory and updating the name of some files, from version 3 to four a new structure is needed for the application and a rewrite of all the classes used in it to adapt to the new standard.  
These are some of the main differences between versions 3 and 4 of CodeIgniter. Stay tuned here that has a lot of content about CodeIgniter 4 being produced.

Namespace –  
Codeigniter 4 is build for PHP 7.2+ versions. so you can say its build for the mainly latest version of PHP. and everything in the framework is namespaced, except for the helpers.  
Compatibility –  
It is not compatible with the old version of CodeIgniter. so if you want to use CodeIgniter 4 then definitely you have to give some more effort to update. because in the last versions it was very easy to update but in this update, they have added a lot of new features that are the reason it’s not compatible with the oldest version of CodeIgniter.  
Application Structure – 

- The application folder is renamed as app and the framework still has system folders, with the same interpretation as before
- The framework now provides for a public folder, intended as the document root for your app
- There is also a writable folder, to hold cache data, logs, and session data
- The app folder looks very similar to the application for CI3, with some name changes, and some subfolders moved to the writable folder
- Now there is not nested application/core folder because now in CI4 there is a different mechanism to extend the framework component.

Controllers – 

- In Codeigniter 4, You have to extend \\Codeigniter\\Controller instead of CI\_Controller
- In this version, they do not use any constructor to use CI magic. now it is the part of the base controller which you will make.
- The new thing is that CI4 provides Request and Response object to work. It’s more powerful than the CI3 way.
- If you want to use your controller to use as a Base Controller then make your controller anywhere you like and extend Controller and then use it anywhere you want.

Models – 

- Same as controller now the model will not extent CI model you have to extend \\Codeigniter \\Model.
- In the CI4 model, there are more functionalities than CI3 including automatic database connection, basic CRUD, in -model validation and automatic pagination.
- instead of writing in CI3 $this->load->model(x) now you have to write $this->x = new X():
- CI4 has Entity class also to use richer data mapping to database tables;

Views – 

- Instead of writing in CI3 $this->load->view(x) you can use echo view(x);
- CI4 supports view cells to build your responce in pices.

 [WODA-495](https://2cu.atlassian.net/browse/WODA-495?src=confmacro)