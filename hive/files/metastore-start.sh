#!/bin/bash

# Start Hadoop
/etc/bootstrap.sh

# Start the metastore
hive --service metastore --hiveconf hive.root.logger=DEBUG,console --hiveconf fs.azure.account.key.${AZURE_STORAGE_ACCOUNT_NAME}.blob.core.windows.net=${AZURE_STORAGE_ACCOUNT_KEY} --hiveconf fs.abfs.impl=org.apache.hadoop.fs.azurebfs.AzureBlobFileSystem --hiveconf fs.AbstractFileSystem.abfs.impl=org.apache.hadoop.fs.azurebfs.Abfs --hiveconf fs.azure.account.oauth.provider.type=org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider --hiveconf fs.azure.account.oauth2.client.id=${ADLS_CLIENT_ID} --hiveconf fs.azure.account.oauth2.client.secret=${ADLS_CLIENT_SECRET} --hiveconf fs.azure.account.oauth2.client.endpoint=https://login.microsoftonline.com/${ADLS_TENANT_ID}/oauth2/token

# Spin wait
while true; do sleep 1000; done
