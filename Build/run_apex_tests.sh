echo "Deploying source to org"
sfdx force:source:deploy --sourcepath force-app --targetusername DevHub

echo "Testing code in org"
sfdx force:apex:test:run --testlevel runLocalTests --outputdir test-results --resultformat tap --targetusername DevHub