FROM alpine:latest

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV PATH=$PATH:$JAVA_HOME/bin

RUN apk add --no-cache openjdk11
RUN apk add --no-cache curl

ENV TOMCAT_MAJOR=9
ENV TOMCAT_VERSION=9.0.50

RUN curl -L https://archive.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz \
    -o tomcat.tar.gz && \
    tar -xf tomcat.tar.gz && \
    rm tomcat.tar.gz && \
    mv apache-tomcat-$TOMCAT_VERSION /opt/tomcat

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]