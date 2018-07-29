
# Table of Contents

1.  [Docker Jupyter Notebook for ML](#org2eaca71)
2.  [Setup steps](#org15e8595)
    1.  [1. Clone this repo into the directory of your choice](#orgb72e86f)
    2.  [2. Build the docker image](#org201e449)
    3.  [3. Start the container](#org3008758)
        1.  [(First time) Run in current terminal](#org380a78c)
        2.  [(Firs time) Run in background](#org9c14e69)
        3.  [(Subsequent) Run from saved container](#org940fbc8)
    4.  [4. Login to Jupyter Notebook](#org4bfaea3)
3.  [Reference for Docker](#orgfaa5675)
    1.  [`docker build . -t jupyter`](#org221bca1)
    2.  [`docker images`](#orgd80c10d)
    3.  [`docker rmi -f $(docker images ls -f dangling=true -q)`](#orge8015e1)
    4.  [`docker ps`](#org89c48ba)
    5.  [`docker exec <container-name/hash> <container command>`](#orgd7d5f81)
    6.  [`docker run`](#orga8041ea)


<a id="org2eaca71"></a>

# Docker Jupyter Notebook for ML

Quickly setup a docker container that serves a jupyter notebook compatible with Google's Machine Learning Crash Course and provides Hinterland code completion

-   Python 2.7
-   Tensorflow 1.0.0


<a id="org15e8595"></a>

# Setup steps


<a id="orgb72e86f"></a>

## 1. Clone this repo into the directory of your choice

`git clone https://github.com/augudyne/jupyter-notebook-for-ml.git && cd jupyter-notebook-for-ml`


<a id="org201e449"></a>

## 2. Build the docker image

-   Takes about 10 minutes to download dependencies. Note: Keras is installed but not needed for Google ML

`docker build . -t jupyter`


<a id="org3008758"></a>

## 3. Start the container

You can run in terminal or in background.

The follow commands bind a volume to your workspace so that your work is saved and easily accessible.


<a id="org380a78c"></a>

### (First time) Run in current terminal

`docker run --name jupyter-notebook -it -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`


<a id="org9c14e69"></a>

### (Firs time) Run in background

`docker run --name jupyter-notebook -d -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`


<a id="org940fbc8"></a>

### (Subsequent) Run from saved container

`docker start jupyter-notebook`


<a id="org4bfaea3"></a>

## 4. Login to Jupyter Notebook

`docker exec jupyter-notebook jupyter notebook list`

Copy and paste the STDOUT link into your web browser


<a id="orgfaa5675"></a>

# Reference for Docker

Documenting docker commands for other first timers


<a id="org221bca1"></a>

## `docker build . -t jupyter`

-   **build:** provide with directory with Dockerfile. Can now create containers (instances) of image named jupyter


<a id="orgd80c10d"></a>

## `docker images`

Lists the available docker images that we can create containers of


<a id="orge8015e1"></a>

## `docker rmi -f $(docker images ls -f dangling=true -q)`

Remove all dangling images. That means those listed as <none> 

-   **rmi:** remove images, -f flag to delete those with existing containers based on images


<a id="org89c48ba"></a>

## `docker ps`

Lists the processes/active containers


<a id="orgd7d5f81"></a>

## `docker exec <container-name/hash> <container command>`

Run <container commmand> inside the container. Note: not in bash context generally, but you can do stuff like /bin/bash -c "<blah blah>"


<a id="orga8041ea"></a>

## `docker run`

-   **-it:** uses the current terminal to run the container. Aka STDOUT here
-   **-d :** runs in background
-   **-p:** opens port from host:client, where client is the container's ports
-   **-v:** uses volumes. You can create volumes with `docker create volume <name>` and use with `docker run -v <name>:/path/within/container`. This lets you reuse data if you run it again.
    Even better, we can *bind* a host directory to the container, so we can easily transfer/persist files. Do `docker run -v /absolute/host/path:/path/within/container <image name>`

