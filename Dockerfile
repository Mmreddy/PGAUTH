############################################################
# Dockerfile to install JDK & TOMCAT on ORACLE LINUX
# 0_1           Maheswara Reddy M          04APRIL2015
############################################################

FROM oraclelinux
MAINTAINER Maheswara Reddy<maheswara_mayaluri@infosys.com>

# INSTALL ORACLELINUX
RUN yum -y upgrade
RUN yum install -y wget
RUN yum install -y tar

ENV CATALINA_HOME /applications/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_VERSION 8.0
ENV TOMCAT_TGZ_URL http://mirror.apache-kr.org/tomcat/tomcat-$TOMCAT_MAJOR_VERSION/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

# INSTALL TOMCAT
RUN wget -q $TOMCAT_TGZ_URL
RUN tar xvf apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN mv apache-tomcat-$TOMCAT_VERSION tomcat
RUN rm -rf apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN mkdir /applications
WORKDIR /applications

EXPOSE 8080

CMD /applications/tomcat/bin/startup.sh
