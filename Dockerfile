#specifying the base image
FROM centos:7
#descriping my image
LABEL description="building an apache image from dockerfile"
LABEL owner="Sunita"
#executing command to update apache
RUN yum update -y 
#executing command to install apache
RUN yum install httpd -y
#the file containg what content the user will see
COPY index.html /var/www/html/
#container will listen on port 80
EXPOSE 80/tcp
#what do you want to execute when the container starts
#start out container with httpd. equivalent to systemctl start httpd
ENTRYPOINT ["/usr/sbin/httpd"] 
#command that will override even when the container stops
CMD ["-D", "FOREGROUND"]
