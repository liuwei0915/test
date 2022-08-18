FROM ubuntu:20.04

RUN apt update
RUN apt install \vim \wget -y
RUN apt install curl -y

ARG DEBIAN_FRONTEND=noninteractive

RUN apt install apache2 -y

RUN groupadd aws
RUN adduser weiliu
RUN passwd -d weiliu
RUN usermod -aG aws weiliu

RUN a2enmod userdir
RUN a2enmod autoindex


RUN echo "<html> <head> <title>Amazon wei's test </title> <style>body {margin-top: 40px;\
 background-color: #333;} </style> </head><body> <div style=color:white;text-align:center> \
<h1>Amazon ECS Wei's web App</h1> <h2>Congratulations!</h2> <p>Your \
application is now running on a container right now</p> </div\
</body></html>" >  /var/www/html/index.html
EXPOSE 80


CMD /usr/sbin/apache2ctl -D FOREGROUND