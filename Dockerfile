############################################################
# Dockerfile to install JDK & TOMCAT on ORACLE LINUX
#
# 0_1           Mahesh             04MAR2015
# 
#
############################################################

FROM oraclelinux

MAINTAINER INFOSYS Mahesh

RUN yum install -y wget

RUN yum install -y tar

# INSTALL JAVA BEGIN

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.tar.gz" -P /opt/

RUN tar xzf /opt/jdk-8u31-linux-x64.tar.gz -C /opt

RUN echo "export JAVA_HOME=/opt/jdk1.8.0_31" >> /root/.bash_profile

RUN echo "export PATH=$PATH:/opt/jdk1.8.0_31/bin:/opt/jdk1.8.0_31/jre/bin" >> /root/.bash_profile

RUN echo "export JRE_HOME=/opt/jdk1.8.0_31/jre" >> /root/.bash_profile

ENV JAVA_HOME /opt/jdk1.8.0_31

ENV JRE_HOME /opt/jdk1.8.0_31/jre

# INSTALL JAVA END

# INSTALL TOMCAT BEGIN

RUN cd /tmp;wget http://apache.bytenet.in/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz

RUN cd /tmp;tar xzf apache-tomcat-8.0.20.tar.gz

RUN cd /tmp;mv apache-tomcat-8.0.20 /opt/tomcat8

RUN chmod -R 755 /opt/tomcat8

EXPOSE 8080

# INSTALL TOMCAT END

CMD /opt/tomcat8/bin/startup.sh

#ENTRYPOINT ./root/.bash_profile

