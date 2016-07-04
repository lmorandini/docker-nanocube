# docker-nanocube

An Ubuntu-based Doker image for Nanocube (tested with Nanocube 3.2.1) that starts with the "crime" test dataset.


## Image building

```
git clone git@github.com:lmoran/docker-nanocube.git
cd docker-nanocube
docker build --tag nanocube:3.2.1 .

```


## Creating and Running the container

```
docker create nanocube:3.2.1
docker start <container id>

```


## Testing the container

The container IP address can be inffered using this command:
`docker inspect --format='{{.NetworkSettings.IPAddress}}' <container id>`

The Nanocube API can be reached at port 25912:
`http://<container ip address>:29512/count.a(%22crime%22,set([21],[22]))`

The web application API can be reached at port 8000:
`http://<container ip address>:8000/#config_crime`




