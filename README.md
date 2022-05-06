# docker-lamp
Basic Docker LAMP setup w/ Apache, MySQL, and PHP. Gets your web project up and running quickly.

## Quick start
Put your files in a subdirectory called `public_html` and run `docker-compose up` in the project's root directory (the one with docker-compose.yml and Dockerfile). It will set up three Docker containers: 
1. A MySQL instance, accessible on localhost port 8761
2. The adminer GUI program (for looking at your MySQL database, like phpMyAdmin), accessible on localhost port 8762
3. A PHP-enabled web server serving your files, accessible on localhost port 8763

I chose some weird port numbers so that it wouldn't conflict with other services I have running on some of the more popular ports. Feel free to change the ports in the docker-compose.yml file.

## Questions you might have

### How do I connect to the MySQL instance from my hosted PHP files?
Look at the docker-compose.yml file, and make sure your DB connection uses the name of the docker service (in this case, "db"), **not** localhost. If using the default ports defined here, the exposed port on the container will be the default for MySQL, 3306, so you should use that if you need to specify a port (not 8761, which is where your host is connnected to it).

### The installed PHP doesn't have the PHP extension I need. How do I add it?
Easy! Just add it to the Dockerfile in the line beginning with RUN, and rebuild your containers. `docker-compose build --no-cache` usually works for me.
