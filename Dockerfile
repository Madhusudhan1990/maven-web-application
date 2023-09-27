#FROM tomcat:8.0.20-jre8
#COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war 

FROM maven:3.6.1-jdk-8-alpine as madhu
# as madhu is one alias name, we will use that for referring tomcat image
WORKDIR /app
COPY . .
RUN mvn clean package




FROM tomcat:8.0.20-jre8
COPY --from=madhu /app/target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
