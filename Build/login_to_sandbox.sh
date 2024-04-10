

echo "Logging into Sandbox Org"
mkdir keys
echo $SANDBOX_CERT_KEY | base64 -di > keys/server.key

echo "Authenticating Org"
sf org login jwt --client-id $SANDBOX_APP_KEY --jwt-key-file keys/server.key --username $SANDBOX_USERNAME --set-default-dev-hub DevHub