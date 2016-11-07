FROM jboss/wildfly:latest

ADD ojdbc7.jar /opt/jboss/wildfly/
ADD oracle-driver-commands.cli /opt/jboss/wildfly/bin/oracle-driver-commands.cli

# Change the ownership of added files/dirs to `jboss`
USER root

RUN yum -y install /sbin/ip

RUN chown -R jboss:jboss /opt/jboss/wildfly
RUN chmod +x /opt/jboss/wildfly/bin/oracle-driver-commands.cli
RUN chmod +x /opt/jboss/wildfly/ojdbc7.jar
USER jboss

EXPOSE 8080 9990 9999 8009 45700 7600 57600

EXPOSE 23364/udp 55200/udp 54200/udp 45688/udp

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
