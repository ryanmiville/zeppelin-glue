# Forward the local port 9007 to AWS Glue
# We copy the key because it has to have the correct permissions in order to be accepted by ssh
cp /keys/${KEY} conf/key.pem
chmod 700 conf/key.pem

ssh -f -o "StrictHostKeyChecking no" -i /keys/${KEY} -vnNT -L :9007:169.254.76.1:9007 glue@${ENDPOINT}
# Start the zeppelin server
exec bin/zeppelin.sh