![Docker](https://github.com/XCSoar/xcsoar-mapgen-container/workflows/Docker/badge.svg)

# XCSoar's Mapgen in containerized Form

This repository contains DockerCompose and Dockerfiles for building a containerized version of mapgen. 

## Frontend
The frontend container contains the cherrypy based service and an nginx based reverse proxy for exposing the mapgen on port 9090
Both processes in the frontend container are started by supervisord.  

Frontend produces job files that are put into a shared volume /opt/mapgen/jobs/<jobid>.queued

## Worker
This is the actual map builder, that takes the queued jobs in /opt/mapgen/jobs/jobid and starts processing all the *.queued jobs. 

## Volumes
These are named volumes inside your docker service.

/opt/mapgen/jobs:
 This is the job directory where all jobs get stored

/opt/mapgen/data:
 This directory caches all the data from the data repository. WARNING: This volume can take up a lot of space (100GB).  

## Ports
Port 9090

## Build Variables
The Following build variables can be set during build (optional):

 1. GITURL - The git url where the mapgen sources are from (https://github.com/xcsoar/mapgen/mapgen.git)
 1. GITBRANCH - The branch where to pull from (default:master)

### Building
in the current directory: 

```bash
docker-compose build
```
or with options: 

```bash
docker-compose build --build-arg=GITURL=https://github.com/myuser/mapgen/mapgen.git --build-arg=GITBRANCH=myfeature
```

### Starting
```bash
docker-compose up -d 
```
