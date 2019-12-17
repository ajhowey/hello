FROM centos

MAINTAINER ajhowey@gmail.com

RUN mkdir /app/tomcat/

WORKDIR /app/tomcat
RUN curl -O https://www.apache.org/dist/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.47/* /app/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /app/tomcat/webapps
RUN curl -O -L  https://github.com/ajhowey/hello/raw/master/dist/hello.war

EXPOSE 8080

CMD ["/app/tomcat/bin/catalina.sh", "run"]
