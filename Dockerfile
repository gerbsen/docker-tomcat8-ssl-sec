FROM tomcat:8-jre8


RUN ["rm","-Rf", "/usr/local/tomcat/webapps/ROOT/", "/usr/local/tomcat/webapps/docs", "/usr/local/tomcat/webapps/examples"]
RUN  $JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA -keypass changeit -storepass changeit -dname "CN=Kizerv, OU=ID, O=ACC, L=MAD, S=MADRID, C=ES"  -noprompt -keystore /usr/local/tomcat/temp/.keystore

COPY server.xml /usr/local/tomcat/conf/server.xml
COPY web.xml /usr/local/tomcat/conf/web.xml

EXPOSE 8080 8443

CMD ["catalina.sh", "run"]
