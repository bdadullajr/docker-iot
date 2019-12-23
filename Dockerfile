FROM centos

MAINTAINER bdadullajr@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-7/v7.0.99/bin/apache-tomcat-7.0.99.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-7.0.99/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://iot-innovation.s3-ap-southeast-1.amazonaws.com/IOT-PROJECT/IOT_PROJECT-NAME.war

EXPOSE 8181

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
