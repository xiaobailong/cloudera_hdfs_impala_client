FROM xiaobailong/oracle-java:java8

ENV PATH=$PATH:$JAVA_HOME/bin

RUN apt-get update && \
    apt-get install -y --force-yes -q dialog curl sudo lsof vim axel telnet && \
    echo $JAVA_HOME >> /etc/environment && \
    source /etc/environment && \

#Installing Cloudera repositories
RUN curl -s http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add - && \
    echo 'deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5 contrib' > /etc/apt/sources.list.d/cloudera.list && \
    echo 'deb-src http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5 contrib' >> /etc/apt/sources.list.d/cloudera.list

RUN apt-get update && apt-get -y --force-yes install hadoop-conf-pseudo impala-shell
