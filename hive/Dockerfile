FROM sequenceiq/hadoop-docker:2.7.0

ENV HIVE_VERSION=1.2.2
ENV HIVE_HOME=/usr/local/hive
ENV PATH=$HIVE_HOME/bin:$PATH



#RUN yum check-update
RUN yum history sync
RUN yum install -y yum-plugin-ovl ; yum clean all
RUN yum -y install wget  ; yum clean all

#Install Hive and PostgreSQL JDBC
# Download hive
RUN wget https://archive.apache.org/dist/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz
RUN tar -zxf ./apache-hive-${HIVE_VERSION}-bin.tar.gz 
RUN mv ./apache-hive-${HIVE_VERSION}-bin $HIVE_HOME 
RUN rm -f ./apache-hive-${HIVE_VERSION}-bin.tar.gz
	

# Download specific jars needed for ADLS and WASB and not included in Hive
RUN cd $HIVE_HOME/lib && \
	curl -O http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.9/jackson-core-2.9.9.jar && \
	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/8.6.0/azure-storage-8.6.0.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar

# RUN cd $HIVE_HOME/lib && \
#	curl -O http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.9/jackson-core-2.9.9.jar && \
#	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/8.6.0/azure-storage-8.6.0.jar && \
#       curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar // && \
#	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.3.8/azure-data-lake-store-sdk-2.3.8.jar && \
#       curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure-datalake/3.2.1/hadoop-azure-datalake-3.2.1.jar

RUN yum erase -y jdk 

#
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm

RUN rpm -i jdk-8u131-linux-x64.rpm
RUN rm jdk-8u131-linux-x64.rpm
	

EXPOSE 9083

ADD files/metastore-start.sh /etc/metastore-start.sh
RUN chmod +x /etc/metastore-start.sh && sleep 1

CMD /etc/metastore-start.sh
