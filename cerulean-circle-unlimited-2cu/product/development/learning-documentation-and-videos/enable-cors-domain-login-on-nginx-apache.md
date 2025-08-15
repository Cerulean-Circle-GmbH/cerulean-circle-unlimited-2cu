[📁 Learning Documentation And Videos](../learning-documentation-and-videos.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000060/enable-cors-domain-login-on-nginx-apache.md) | [🌐 Page Structure local SymLink](./enable-cors-domain-login-on-nginx-apache.page.md)

# Enable CORS Domain Login On Nginx & Apache

# How to Enable CORS in Ngnix Web Server

The following Nginx configuration enables CORS, with support for preflight requests.

```
#
# Wide-open CORS config for nginx
#
location / {
     if ($request_method = 'OPTIONS') {
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        #
        # Custom headers and headers various browsers *should* be OK with but aren't
        #
        add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range';
        #
        # Tell client that this pre-flight info is valid for 20 days
        #
        add_header 'Access-Control-Max-Age' 1728000;
        add_header 'Content-Type' 'text/plain; charset=utf-8';
        add_header 'Content-Length' 0;
        return 204;
     }
     if ($request_method = 'POST') {
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range';
        add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
     }
     if ($request_method = 'GET') {
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range';
        add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
     }
}
```

# How to Enable CORS in Apache Web Server

By default, cross domain requests are disabled in Apache web server. You need to set the Access-Control-Allow-Origin header to enable CORS (Cross Origin Resource Sharing) in Apache. Here are the steps to enable CORS in Apache web server.

 How to Enable CORS in Apache Web Server

Here’s how to enable CORS in Apache

## 1\. Enable headers module

You need to enable headers module to enable CORS in Apache.

**Ubuntu/Debian**

In ubuntu/debian linux, open terminal & run the following command to enable headers module.

```
sudo a2emod headers

```

**CentOS/Redhat/Fedora**

In CentOS/Redhat/Fedora linux, open the Apache configuration file *httpd.conf* and uncomment the following line by removing # in front of them.

```
LoadModule headers_module modules/mod_headers.so

```

## 2\. Enable CORS in Apache

Next, add the “Header add Access-Control-Allow-Origin \*” directive to either your Apache config file, or .htaccess file, or Virtual Host configuration file, depending on your requirement. If you add it to your main configuration file, CORS will be enabled to all websites on your server. If you add it to .htaccess file or  virtual host configuration file, then it will be enabled for only that file’s website. Here are examples of how to add this directive in different files. You can use any one of them.

### Directory Tag in Main Configuration File

```
<Directory /var/www/html>
   ...
   Header set Access-Control-Allow-Origin "*"
   ...
</Directory>

```

### Anywhere in .htaccess file

```
   ...
   Header add Access-Control-Allow-Origin "*"
   ...

```

### VirtualHost Tag in Virtual Host Configuration File

```
<VirtualHost *:443>
   ...
   Header add Access-Control-Allow-Origin "*"
   ...
</VirtualHost>

```

There are different configurations available to enable CORS in Apache.

### Enable CORS from all websites

If you want to enable CORS for all websites, that is, accept cross domain requests from all websites, add the following

```
Header add Access-Control-Allow-Origin *;

```

In the above statement, we use wildcard (\*) for Apache Access-Control-Allow-Origin directive

### Enable  CORS from one domain

If you want to enable CORS for one website domain (e.g [example.com](http://example.com)), specify that domain in place of wildcard character \*.

```
Header add Access-Control-Allow-Origin "example.com";

```

### Enable CORS from multiple domains

If you want to enable CORS for multiple domains (e.g [example1.com](http://example1.com), [example2.com](http://example2.com),[example3.com](http://example3.com)), specify them separately one after another

```
Header add Access-Control-Allow-Origin "example1.com";
Header add Access-Control-Allow-Origin "example2.com";
Header add Access-Control-Allow-Origin "example3.com";

```

### Enable CORS from localhost

If you want to enable CORS from localhost, add 127.0.0.1 or localhost in place of domain name

```
Header add Access-Control-Allow-Origin "localhost";

```

## 3\. Restart Apache Server

Restart Apache web server to apply changes

```
-------------- On Debian/Ubuntu -------------- 
# apache2 -t
# systemctl restart apache2.service

-------------- On RHEL/CentOS/Fedora --------------
# httpd -t
# systemctl restart httpd.service

```
