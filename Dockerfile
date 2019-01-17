From ubuntu:latest
RUN apt-get update \
    && apt-get install -y openjdk-8-jdk \
    && apt-get install tomcat8 -y \
    &&  apt-get install maven -y
RUN mkdir java-app
WORKDIR java-app
ADD * ./
RUN ls
RUN mvn clean install
CMD cp target/SpringMVCSecurityXML.war /var/lib/tomcat8/webapps/saishma.war
