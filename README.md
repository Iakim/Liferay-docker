# Liferay Community Edition Portal 7.1.3 CE GA4 + Docker version 19.03.8
Follow all this steps bellow for create with success your container

## Start Docker
Run commands, if necessary, for start your docker service

    # mkdir /sys/fs/cgroup/systemd
    # mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd
    # service docker start

## Dependencies
The Elasticsearch 6.5.1 is a dependencies and clone this repository

    # docker network create liferay
    # docker pull docker.elastic.co/elasticsearch/elasticsearch:6.5.1
    # docker create --name iakimv2 -p 9200:9200 -p 9300:9300 --network liferay -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.5.1
    # docker start iakimv2
    # git clone https://github.com/Iakim/Liferay-docker.git
    # cd Liferay-docker

## Customize your installation

### If you want a liferay from scratch, skip to "Review portal-ext.properties"

Copy the folders, of your previous instalation, hypersonic and document_library for data

    # cp -r /opt/you_instalation_liferay_path/data/hypersonic/* data/hypersonic/
    # cp -r /opt/you_instalation_liferay_path/data/document_library/* data/document_library/

Copy your thema for folder DEP/osgi/war/

    # cp /opt/you_instalation_liferay_path/osgi/war/my_theme.war DEP/osgi/war

Review portal-ext.properties **SKIP FOR HERE**

    # vim portal-ext.properties  

Review standalone.conf 

    # vim standalone.conf

# Checkpoint

- Docker runs correctly
- Create a network liferay
- Install ElasticSearch 6.5.1 with docker
- Get a clone for the repository https://github.com/Iakim/Liferay-docker.git
- Customization your container with ALL the steps

## Construct your container
Execute the commands bellow to contruct your container

    # docker build -t iakim/liferay-docker .
    # docker create --name iakimv1 -p 8080:8080 -p 9990:9990 --network liferay  iakim/liferay-docker:latest
    # docker start iakimv1
    # docker exec -u jboss iakimv1 touch /opt/jboss/wildfly/standalone/deployments/ROOT.war.dodeploy
    # docker ps -a
    
## End Steps
Log in portal http://localhost:8080/c/portal/login

User: test@liferay.com
Pass: test

    Control Panel -> Configuration -> Search -> Reindex all indexes of search

## Destroy your container and image
Execute the commands bellow to destruct your container and your image

    # docker stop iakimv1
    # docker rm iakimv1
    # docker image rm iakim/liferay-docker:latest
