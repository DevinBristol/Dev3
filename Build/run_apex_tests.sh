echo "Deploying source to org"
sfdx force:source:deploy --sourcepath src --targetusername DevHub

echo "Testing code in org"
sfdx force:apex:test:run --testlevel runLocalTests --outputdir test-results --resultformat tap --targetusername DevHub