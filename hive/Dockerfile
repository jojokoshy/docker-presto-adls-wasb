FROM bde2020/hadoop-base:2.0.0-hadoop2.7.4-java8

ENV HIVE_VERSION=1.2.1
ENV HIVE_HOME=/usr/local/hive
ENV PATH=$HIVE_HOME/bin:$PATH

# Download hive
RUN curl -s -O http://apache.claz.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz && \
	tar -zxf ./apache-hive-${HIVE_VERSION}-bin.tar.gz && \
	mv ./apache-hive-${HIVE_VERSION}-bin $HIVE_HOME && \
	rm -f ./apache-hive-${HIVE_VERSION}-bin.tar.gz

# Download specific jars needed for ADLS and WASB and not included in Hive
RUN cd $HIVE_HOME/lib && \
	curl -O http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.9/jackson-core-2.9.9.jar && \
	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/8.6.0/azure-storage-8.6.0.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/3.2.1/hadoop-azure-3.2.1.jar && \
	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.3.8/azure-data-lake-store-sdk-2.3.8.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure-datalake/3.2.1/hadoop-azure-datalake-3.2.1.jar

 

EXPOSE 9083

ADD files/metastore-start.sh /etc/metastore-start.sh
RUN chmod +x /etc/metastore-start.sh && sleep 1

CMD /etc/metastore-start.sh
