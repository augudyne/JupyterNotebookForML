
# Table of Contents

1.  [Docker Jupyter Notebook for ML](#orga426b1a)
2.  [Setup steps](#orge67f47a)
    1.  [Clone this repo into the directory of your choice](#org88c63d7)
    2.  [Build the docker image](#org99dccca)
    3.  [(First time) Run the container to serve the notebook.](#org30e7b0a)
        1.  [Run in current terminal](#org1240109)
        2.  [Run in backround](#orgb9078bc)
    4.  [On future runs](#org3796028)


<a id="orga426b1a"></a>

# Docker Jupyter Notebook for ML

Quickly setup a docker container that serves a jupyter notebook compatible with Google's Machine Learning Crash Course and provides Hinterland code completion

-   Python 2.7
-   Tensorflow 1.0.0


<a id="orge67f47a"></a>

# Setup steps


<a id="org88c63d7"></a>

## Clone this repo into the directory of your choice

`git clone https://github.com/augudyne/jupyter-notebook-for-ml.git && cd jupyter-notebook-for-ml`


<a id="org99dccca"></a>

## Build the docker image

-   Takes about 10 minutes to download dependencies. Note: Keras is installed but not needed for Google ML

`docker build . -t jupyter`


<a id="org30e7b0a"></a>

## (First time) Run the container to serve the notebook.

-   You can run in terminal or in background.
-   I recommend binding a volume to your workspace so that your work is saved and easily accessible.


<a id="org1240109"></a>

### Run in current terminal

`docker run --name jupyter-notebook -it -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`

-   Jupyter will display a login link in STDOUT e.g.

`http://(9b2805d551b8 or 127.0.0.1):8888/?token=<some token>`

-   Visit <http://localhost:8888/?token=<some token>>


<a id="orgb9078bc"></a>

### Run in backround

`docker run --name jupyter-notebook -d -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`

-   You will need to retrieve the token from jupyter

`docker exec jupyter-notebook jupyter notebook list`


<a id="org3796028"></a>

## On future runs

`docker run jupyter-notebook`

