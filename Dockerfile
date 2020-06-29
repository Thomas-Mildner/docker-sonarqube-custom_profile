FROM sonarqube:latest

ENV SONAR_DOWNLOAD_URL https://repo1.maven.org/maven2/org/sonarsource

# Install curl
RUN apk --no-cache add curl

# Installing Plugins
RUN cd /opt/sonarqube/extensions/plugins/
RUN curl -o sonar-java-plugin.jar -fSL $SONAR_DOWNLOAD_URL/java/sonar-java-plugin/6.5.0.22421/sonar-java-plugin-6.5.0.22421.jar
RUN curl -o sonar-web-plugin.jar -fSL $SONAR_DOWNLOAD_URL/web/sonar-web-plugin/2.6.0.1053/sonar-web-plugin-2.6.0.1053.jar
RUN curl -o sonar-scm-git-plugin.jar -fSL $SONAR_DOWNLOAD_URL/scm/git/sonar-scm-git-plugin/1.9.1.1834/sonar-scm-git-plugin-1.9.1.1834.jar

# Add default Java Quality Profile
ADD qualityprofile/java-standardprofile.xml /qualityprofile/

VOLUME ["$SONARQUBE_HOME/data", "$SONARQUBE_HOME/extensions", "/qualityprofile"]

ADD start_with_profile.sh /opt/sonarqube/start_with_profile.sh

ENTRYPOINT ["/opt/sonarqube/start_with_profile.sh"]
