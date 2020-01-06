FROM sonarqube

ENV SONAR_DOWNLOAD_URL http://central.maven.org/maven2/org/sonarsource

# Installing Plugins
RUN cd /opt/sonarqube/extensions/plugins/
RUN curl -o sonar-java-plugin.jar -fSL $SONAR_DOWNLOAD_URL/java/sonar-java-plugin/6.0.0.20538/sonar-java-plugin-6.0.0.20538.jar
RUN curl -o sonar-web-plugin.jar -fSL $SONAR_DOWNLOAD_URL/web/sonar-web-plugin/2.6.0.1053/sonar-web-plugin-2.6.0.1053.jar
RUN curl -o sonar-scm-git-plugin.jar -fSL $SONAR_DOWNLOAD_URL/scm/git/sonar-scm-git-plugin/1.9.1.1834/sonar-scm-git-plugin-1.9.1.1834.jar

# Add Kotlin Plugin - https://github.com/K0zka/kotlin-sonar
ADD plugins/kotlin-sonar-0.1-SNAPSHOT.jar /opt/sonarqube/extensions/plugins/

# Add default Java Quality Profile
ADD qualityprofile/java-standardprofile.xml /qualityprofile/

VOLUME ["$SONARQUBE_HOME/data", "$SONARQUBE_HOME/extensions", "/qualityprofile"]

ADD start_with_profile.sh /opt/sonarqube/start_with_profile.sh

ENTRYPOINT ["/opt/sonarqube/start_with_profile.sh"]
