FROM xiaobailong/sbt:0.13.8

ENV PATH ${JAVA_HOME}/bin:${PATH}

RUN apt-get update && \
    apt-get install -y --force-yes -q dialog curl sudo lsof vim axel telnet && \
    echo $JAVA_HOME >> /etc/environment

#Installing Cloudera repositories
RUN curl -s http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add - && \
    echo 'deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5 contrib' > /etc/apt/sources.list.d/cloudera.list && \
    echo 'deb-src http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5 contrib' >> /etc/apt/sources.list.d/cloudera.list

RUN apt-get update && apt-get -y --force-yes install hadoop-conf-pseudo impala-shell
