FROM tomcat:8.5-jre11-temurin

ARG PETCLINIC_WAR_APP=apps/petclinic.war

# Add JVM environment variables for the tomcat server
ENV CATALINA_OPTS="${CATALINA_OPTS} -XX:MaxRAMPercentage=50.0 -XX:InitialRAMPercentage=50.0 -XX:+UseContainerSupport"

# Copy petclinic.war app
ADD ${PETCLINIC_WAR_APP} /usr/local/tomcat/webapps/petclinic.war

# Copy all relevant files from the directory tree of the Tomcat server.
ADD --chown=root:root tomcatServer.tar.gz /usr/local/tomcat

# Copy external resources and configurations
ADD --chown=root:root additionalFiles.tar.gz /

## Copy modified log configurations
#ADD --chown=root:root logConfigs.tar.gz /usr/local/tomcat

# Fixing CVE-2021-45960 in Tomcat community image
RUN apt update && apt upgrade -y libexpat1 libtasn1-6
