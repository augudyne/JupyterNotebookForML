
# Table of Contents

1.  [Docker Jupyter Notebook for ML](#orgd20180c)
2.  [Setup steps](#org1d66578)
    1.  [1. Clone this repo into the directory of your choice](#org8f877e6)
    2.  [2. Build the docker image](#org1197485)
    3.  [3. Start the container](#org0982089)
        1.  [(First time) Run in current terminal](#org0529292)
        2.  [(Firs time) Run in background](#orgc603605)
        3.  [(Subsequent) Run from saved container](#org5aae9f4)
    4.  [4. Login to Jupyter Notebook](#org49423e8)
3.  [Reference for Docker](#org43fddb7)
    1.  [`docker build . -t jupyter`](#org08174d2)
    2.  [`docker images`](#org64bd1e0)
    3.  [`docker rmi -f $(docker images ls -f dangling=true -q)`](#org9ec9444)
    4.  [`docker ps`](#orgd14bbf2)
    5.  [`docker exec <container-name/hash> <container command>`](#org3599741)
    6.  [`docker run`](#orga2f3d19)


<a id="orgd20180c"></a>

# Docker Jupyter Notebook for ML

Quickly setup a docker container that serves a jupyter notebook compatible with Google's Machine Learning Crash Course and provides Hinterland code completion

-   Python 2.7
-   Tensorflow 1.0.0


<a id="org1d66578"></a>

# Setup steps


<a id="org8f877e6"></a>

## 1. Clone this repo into the directory of your choice

`git clone https://github.com/augudyne/jupyter-notebook-for-ml.git && cd jupyter-notebook-for-ml`


<a id="org1197485"></a>

## 2. Build the docker image

-   Takes about 10 minutes to download dependencies. Note: Keras is installed but not needed for Google ML

`docker build . -t jupyter`


<a id="org0982089"></a>

## 3. Start the container

-   You can run in terminal or in background.
-   The follow commands bind a volume to your workspace so that your work is saved and easily accessible.


<a id="org0529292"></a>

### (First time) Run in current terminal

`docker run --name jupyter-notebook -it -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`


<a id="orgc603605"></a>

### (Firs time) Run in background

`docker run --name jupyter-notebook -d -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`


<a id="org5aae9f4"></a>

### (Subsequent) Run from saved container

`docker start jupyter-notebook`


<a id="org49423e8"></a>

## 4. Login to Jupyter Notebook

`docker exec jupyter-notebook jupyter notebook list`
Copy and paste the STDOUT link into your web browser


<a id="org43fddb7"></a>

# Reference for Docker

Documenting docker commands for other first timers


<a id="org08174d2"></a>

## `docker build . -t jupyter`

-   **build:** provide with directory with Dockerfile. Can now create containers (instances) of image named jupyter


<a id="org64bd1e0"></a>

## `docker images`

Lists the available docker images we can create containers of


<a id="org9ec9444"></a>

## `docker rmi -f $(docker images ls -f dangling=true -q)`

Remove all dangling images. That means those listed as <none> 

-   **rmi:** remove images, -f flag to delete those with existing containers based on images


<a id="orgd14bbf2"></a>

## `docker ps`

Lists the processes/active containers


<a id="org3599741"></a>

## `docker exec <container-name/hash> <container command>`

Run <container commmand> inside the container. Note: not in bash context generally, but you can do stuff like /bin/bash -c "<blah blah>"


<a id="orga2f3d19"></a>

## `docker run`

-   **-it:** uses the current terminal to run the container. Aka STDOUT here
-   **-d :** runs in background
-   **-p:** opens port from host:client, where client is the container's ports
-   **-v:** uses volumes. You can create volumes with `docker create volume <name>` and use with `docker run -v <name>:/path/within/container`. This lets you reuse data if you run it again.
    Even better, we can *bind* a host directory to the container, so we can easily transfer/persist files. Do `docker run -v /absolute/host/path:/path/within/container <image name>`

