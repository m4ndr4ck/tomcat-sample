FROM praqma/network-multitool

FROM maven:3.8.2-jdk-8 as maven_builder
ADD . .
RUN mvn clean package

FROM tomcat:8.5.70-jdk8
RUN cp -pr /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
COPY server.xml /usr/local/tomcat/conf/
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY --from=maven_builder /target/hello-1.0.war /usr/local/tomcat/webapps
