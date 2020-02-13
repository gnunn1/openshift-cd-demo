# Create Projects
oc new-project dev --display-name="Tasks - Dev"
oc new-project stage --display-name="Tasks - Stage"
oc new-project cicd --display-name="CI/CD"

# Grant Jenkins Access to Projects
oc policy add-role-to-group edit system:serviceaccounts:cicd -n dev
oc policy add-role-to-group edit system:serviceaccounts:cicd -n stage

sleep 10

oc new-app -n cicd -f cicd-template.yaml --param EPHEMERAL=false

oc new-app -n cicd --template jenkins-persistent --param DISABLE_ADMINISTRATIVE_MONITORS=true