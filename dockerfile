 FROM jboss/wildfly:11.0.0.Final
 USER root
 COPY ROOT /opt/jboss/wildfly/standalone/deployments/
 COPY modules /opt/jboss/wildfly/modules/
 COPY data /opt/jboss/data/
 COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/
 COPY standalone.conf /opt/jboss/wildfly/bin/
 COPY ROOT.war.dodeploy /opt/jboss/wildfly/standalone/deployments/
 COPY portal-ext.properties /opt/jboss/
 COPY DEP /opt/jboss
 RUN mkdir /opt/jboss/logs 
 RUN mkdir /opt/jboss/deploy
 RUN mkdir /opt/jboss/work
 RUN chown -R jboss. /opt/jboss
