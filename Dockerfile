FROM tomcat:latest
RUN apt-get update \
    && apt-get install maven -y \
    && apt-get install -y openjdk-8-jdk
RUN mkdir java-app
WORKDIR java-app
ADD  * ./
RUN ls
RUN mvn clean install
RUN cp target/SpringMVCSecurityXML.war /usr/local/tomcat/webapps/saishma.war
