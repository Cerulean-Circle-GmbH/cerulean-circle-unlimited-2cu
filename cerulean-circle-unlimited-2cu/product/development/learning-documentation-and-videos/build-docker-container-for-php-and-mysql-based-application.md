[📁 Learning Documentation And Videos](../learning-documentation-and-videos.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000059/build-docker-container-for-php-and-mysql-based-application.md) | [🌐 Page Structure local SymLink](./build-docker-container-for-php-and-mysql-based-application.page.md)

# Build Docker Container For PHP and MySQL Based Application

Docker has given a different perception to application development and their run time environment. Containerization of application is very much essential now a days. Think about you have two different application in production server at same time and those applications are developed in PHP 7.2 and PHP 5.6 respectively. Now you can imagine how much trouble it could be to manage two different PHP version.

If you were using Docker, you could simply spin up another container, set the PHP version to 5.6 and put it right next to your other container that has PHP version 7.2 on it, running on the same server with no problems whatsoever. That flexibility, portability and the option to more efficiently use your server resources are what make Docker so compelling to use.

In this demo application we will also need `docker-compose` for the complete application. Check is docker compose is installed already by `docker-compose -v` command in Linux terminal. In case you need to install it, you may run the command `apt install docker-compose` to install from `apt` package manager.

**PHP Application:**

Create a folder (something like `$HOME/Documents/docker-example/php-mysql-demo`) and start writing your PHP code.

```
cd $HOME/Documents/docker-example/php-mysql-demo
mkdir www
```

*www/index.php*

```
<?php
   echo "This is a PHP-MySQL demo application.";
   echo "<br>";
   echo "Thanks for watching...";
?>
```

This is a simple PHP page to render few textual information with with `echo`. Now let us create one more page with name *www/php-info.php*

```
<?php
   echo 'PHP-MySQL demo application for docker';
   phpinfo();
?>
```

In the above code we will display the `phpinfo()` function to display all details of the PHP installed.

**Create Docker Image and Run the Image as Container:**

Now we have developed the PHP application, it is time to create an Docker image and execute the image as docker container.So far we have not used MySQL and it will be discussed later with `docker-compose`. Now we have to create a Docker file (the file name is *Dockerfile* without any extension) with the below content:

```
FROM php:7.2-apache

RUN apt-get update && apt-get install -y

RUN docker-php-ext-install mysqli pdo_mysql

RUN mkdir /app \
 && mkdir /app/php-mysql \
 && mkdir /app/php-mysql/www

COPY www/ /app/php-mysql/www/

RUN cp -r /app/php-mysql/www/* /var/www/html/.

```

Now build the image with docker command:

```
$sudo docker build . -t phpmysqlapache/php-mysql-demo:1.0.0
```

Replace the `phpmysqlapache` with your own docker repository name with any name you want.

Run the Command to see docker images:

```
$ sudo docker images
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
phpmysqlapache/php-mysql-demo   1.0.0               45bb32043b10        2 days ago          411MB
php                           7.2-apache          3492f624190e        3 days ago          378MB

```

 Now you see that your docker image `phpmysqlapache/php-mysql-demo` is created and available. Now you have to run the image to execute and start the PHP application.

To execute use the below command:

```
$ sudo docker run -d -it -p 30001:80 --name "php-mysql-app" \
-v "$(pwd)"/www:/var/www/html \
phpmysqlapache/php-mysql-demo:1.0.0
```

This will run the application image as container which you can see the run time with below command:

```
$ sudo docker ps
CONTAINER ID        IMAGE                               COMMAND                  CREATED             STATUS              PORTS                   NAMES
0a5673538ae3        phpmysqlapache/php-mysql-demo:1.0.0   "docker-php-entrypoi…"   7 seconds ago       Up 7 seconds        0.0.0.0:30001->80/tcp   php-mysql-app
```

 The `-p 30001:80` is telling that to publish the port 80 to host's 30001 port. Now you can access your application to `http://localhost:30001` in any web browser.

Also the `-v "$(pwd)"/www:/var/www/html` option is telling to bind a volume to the container's `/var/www/html` directory to `"$(pwd)"/www`. This will help the development as every time you do a code change it will be reflected ASAP to the container application.

**Docker Compose for PHP, MySQL and PHPMyAdmin:**

 Now it is time to deploy the all three that is the PHP application, MySQL database and PHPMyAdmin as docker container and connect the MySQL database from PHP application. For this we will use docker-compose. You need to write a `docker-compose.yml` file whose content will as below:

```
version: "3.2"
services:
  php:
    build: 
      context: .
    image: phpmysqlapache/php-mysql-demo:1.0.0
    networks:
      - frontend
      - backend
    environment:
      - MYSQL_HOST=couch7-mysql-app
      - MYSQL_USER=couch7user
      - MYSQL_PASSWORD=couch7pass
      - MYSQL_DB=couch7
    volumes:
      - ./www/:/var/www/html/
    ports:
      - "30001:80"
    container_name: couch7-php-app
  mysql:
    image: mysql:5.7
    networks:
      - backend
    environment:
      - MYSQL_ROOT_PASSWORD=rootpassword
      - MYSQL_USER=couch7user
      - MYSQL_PASSWORD=couch7pass 
      - MYSQL_DATABASE=couch7
    container_name: couch7-mysql-app
  phpmyadmin:
    image: phpmyadmin/phpmyadmin:4.7
    depends_on:
      - mysql
    networks:
      - backend
    ports:
      - "30002:80"
    environment:
      - PMA_HOST=couch7-mysql-app
      - PMA_PORT= 3306
    volumes:
      - /sessions
    container_name: couch7-phpmyadmin-app
networks:
  frontend:
  backend:

```

 Run the command for the docker compose:

```
$ sudo docker-compose up --build
```

Now check the application is available at `http://localhost:30001`

Write a PHP page `www/mysql-connect.php` as below:

```
<h3>Welcome to Docker setup</h3>
<h4>Attempting MySQL connection from php...</h4>
<?php
if(!empty($_ENV['MYSQL_HOST']))
   $host = $_ENV['MYSQL_HOST'];
else
   $host = 'couch7-mysql-app';

if(!empty($_ENV['MYSQL_USER']))
   $user = $_ENV['MYSQL_USER'];
else
   $user = 'couch7user';

if(!empty($_ENV['MYSQL_PASSWORD']))
   $pass = $_ENV['MYSQL_PASSWORD'];
else
   $pass = 'couch7pass';

if(!empty($_ENV['MYSQL_DB']))
   $db_name = $_ENV['MYSQL_DB'];
else
   $db_name = 'couch7';

echo "Connecting to Database: $host $user $pass $db_name";
echo "<br><br>";

$conn = new mysqli($host, $user, $pass, $db_name);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected to MySQL successfully!";
echo "<br><br>";

$res = $conn->query("Select ITEM_NAME, ITEM_DESC, ITEM_ONHAND from MOE_ITEM_T");

for ($row_no = 0; $row_no < $res->num_rows; $row_no++) {
    $res->data_seek($row_no);
    $row = $res->fetch_assoc();
    echo " Item Name = " . $row['ITEM_NAME'] . " Item Description = " . $row['ITEM_DESC'] . " Item Onhand = " . $row['ITEM_ONHAND'];
    echo "<br>";
}

$res->close();
$conn->close();
?>
```

 Access this page by [http://localhost:30001/mysql-connect.php](http://localhost:30001/mysql-connect.php) and you will see the below output in your browser.

Now you might be wondering how the data are coming from MySQL database? Well, as we also have PHPMyAdmin container, we can connect to the MySQL database from browser with the port given in the `docker-compose.yml` file as `30002`.

![](./attachments/Screenshot_2020-09-08%200%200%200%200%2030002%20couch7-mysql-app%20phpMyAdmin%204%207%209.png)

After that you can create the tables as per the below database script:

```
-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 03, 2020 at 11:20 AM
-- Server version: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.33-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cu_couch7`
--

-- --------------------------------------------------------

--
-- Table structure for table `abuse_spam`
--

CREATE TABLE `abuse_spam` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `spam_user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `request_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `shortcode` varchar(255) NOT NULL,
  `group` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_required` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `default_value` varchar(255) NOT NULL,
  `placeholder` varchar(255) NOT NULL,
  `fallback` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `pattern` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugtracker`
--

CREATE TABLE `bugtracker` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `url_from` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created_at` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `church`
--

CREATE TABLE `church` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `street` varchar(255) NOT NULL,
  `area_code` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

```

Now you are all set to run the complete application as PHP-MySql combination. Here the PHP application is containerized and also the MySQL is containerized. They are running as two different container and talking to each other. Similarly the PHPMyAdmin is another container and talking to the MySQL container.

[https://2cu.atlassian.net/browse/WODA-618](https://2cu.atlassian.net/browse/WODA-618)
