

# Docker Jupyter Notebook for ML

Quickly setup a docker container that serves a jupyter notebook compatible with Google's Machine Learning Crash Course and provides Hinterland code completion. Helps avoid the frustrations of python version/package management via conda/virtualenv.

-   Python 2.7
-   Tensorflow 1.0.0


# Setup steps


## 1. Clone this repo into the directory of your choice

`git clone git@github.com:augudyne/jupyter-notebook-for-ml.git && cd jupyter-notebook-for-ml`


## 2. Build the docker image

Takes about 10 minutes to download dependencies. Note: Keras is installed but not needed for Google ML

`docker build . -t jupyter`


## 3. Start the container

You can run in terminal or in background.

The following commands bind a volume on your host to your workspace so that your work is saved and easily accessible.


### (First time) Run in current terminal

`docker run --name jupyter-notebook -it -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`


### (First time) Run in background

`docker run --name jupyter-notebook -d -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`

### Stop the container

`docker stop jupyter-notebook`

### (Subsequent) Run from saved container

`docker start jupyter-notebook`


## 4. Login to Jupyter Notebook

`docker exec jupyter-notebook jupyter notebook list`

Copy and paste the link that is printed out into your web browser

Congratulations! You're now in a Jupyter Notebook environment. Note that if you copied and pasted my command to run, then all files in this notebook are saved on your host directory `path/to/repo/jupyter-notebook-for-ml/notebook`

# FAQ
## How do I get it to show suggestions?

Hinterland should be on by default (under nbextensions)

Make sure to run the import cells so that variables are defined

Yes, there is this weird bug where it might auto-complete without asking when first entering a cell. LMK if you know how to fix it.

You can also press TAB for method suggestions or SHIFT+TAB for quick docs

## When I run the first cell with all the import statement, I get a lot of error messages

Apparently numpy likes to whine, but it's a benign warning that is safely ignored

## How do I add additional libraries?

`docker exec jupyter-notebook /bin/bash -c "pip install library"`

# Reference for Docker

Self-documenting docker commands for other first timers

## `docker build . -t jupyter`

-   **build:** provide with directory with Dockerfile. Can now create containers (instances) of image named jupyter


## `docker images`

Lists the available docker images that we can create containers of


## `docker rmi -f $(docker images ls -f dangling=true -q)`

Remove all dangling images. That means those listed as `<none>`

-   **rmi:** remove images, -f flag to delete those with existing containers based on images


## `docker ps`

Lists the processes/active containers


## `docker exec <container-name/hash> <container command>`

Runs `container commmand` inside the container. Note: not in bash context generally, but you can do stuff like `/bin/bash -c "<blah blah>"`


## `docker run`

-   **-it:** uses the current terminal to run the container. Aka STDOUT here
-   **-d :** runs in background
-   **-p:** opens port from host:client, where client is the container's ports
-   **-v:** uses volumes. You can create volumes with `docker create volume <name>` and use with `docker run -v <name>:/path/within/container`. This lets you reuse data if you run it again.
    Even better, we can *bind* a host directory to the container, so we can easily transfer/persist files. Do `docker run -v /absolute/host/path:/path/within/container <image name>`

