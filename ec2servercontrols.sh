cd /home/ubuntu/AWS-ansible
echo $SELECT
sudo ansible-playbook change-EC2-state.yml --extra-vars ec2_tag=$EC2_TAG_NAME -e ec2_state=$EC2_STATE
if [ $SELECT = "true" ]
then
    if [ $EC2_TAG_NAME = "Tomcat-test" ]; then export SERVER_HOST="devservers"; fi
    if [ $EC2_TAG_NAME = "Tomcat-prod" ]; then export SERVER_HOST="prodservers"; fi
    if [ $EC2_TAG_NAME = "Nagios-Monitor" ]; then export SERVER_HOST="nagiosserver"; fi
    if [ $EC2_TAG_NAME = "Bamboo-server" ]; then export SERVER_HOST="Bambooserver"; fi
    if [ $EC2_TAG_NAME = "Artifactory-server" ]; then export SERVER_HOST="Artifactoryserver"; fi

    sudo ansible-playbook stop-VM.yml --extra-vars Time_in_minutes=$Time_in_minutes -e Host=$SERVER_HOST
    echo "Your VM/server will be automatically stop after $Time_in_minutes minuts"
else
	echo "Your VM will keep running"
fi