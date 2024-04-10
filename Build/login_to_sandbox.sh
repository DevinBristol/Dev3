

echo "Logging into Sandbox Org"
mkdir keys
echo $Sandbox_CERT_KEY | base64 -di > keys/server.key

echo "Authenticating Org"
sfdx force:auth:jwt:grant --clientid $Sandbox_APP_KEY --jwtkeyfile keys/server.key --username $SANDBOX_USERNAME --setdefaultdevhubusername -a Devhub
