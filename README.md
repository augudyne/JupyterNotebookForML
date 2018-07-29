
# Table of Contents

1.  [Docker Jupyter Notebook for ML](#org8eb4631)
2.  [Setup steps](#orgf4f45b9)
    1.  [Clone this repo into the directory of your choice](#orgb63e5b5)
    2.  [Build the docker image](#org68af203)
    3.  [(First time) Run the container to serve the notebook.](#org238b077)
        1.  [Run in current terminal](#orgf362595)
        2.  [Run in backround](#org4bfaa85)
    4.  [(Further runs) Simple run `docker run jupyter-notebook`](#orga535d42)


<a id="org8eb4631"></a>

# Docker Jupyter Notebook for ML

Quickly setup a docker container that serves a jupyter notebook compatible with Google's Machine Learning Crash Course and provides Hinterland code completion

-   Python 2.7
-   Tensorflow 1.0.0


<a id="orgf4f45b9"></a>

# Setup steps


<a id="orgb63e5b5"></a>

## Clone this repo into the directory of your choice

`git clone https://github.com/augudyne/jupyter-notebook-for-ml.git && cd jupyter-notebook-for-ml`


<a id="org68af203"></a>

## Build the docker image

-   Takes about 10 minutes to download dependencies. Note: Keras is installed but not needed for Google ML
    `docker build . -t jupyter`


<a id="org238b077"></a>

## (First time) Run the container to serve the notebook.

-   You can run in terminal or in background.
-   I recommend binding a volume to your workspace so that your work is saved and easily accessible.


<a id="orgf362595"></a>

### Run in current terminal

-   `docker run --name jupyter-notebook -it -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`
-   Jupyter will display a login link in STDOUT e.g.
    `http://(9b2805d551b8 or 127.0.0.1):8888/?token=<some token>`
-   Visit `http://localhost:8888/?token=<some token>`


<a id="org4bfaa85"></a>

### Run in backround

-   `docker run --name jupyter-notebook -d -p 8888:8888 -v $(pwd)/notebook:/home/jupyter/notebook jupyter`
-   You will need to retrieve the token from jupyter
    `docker exec jupyter-notebook jupyter notebook list`


<a id="orga535d42"></a>

## (Further runs) Simple run `docker run jupyter-notebook`

