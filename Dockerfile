FROM ubuntu:18.04

# Run a system update and install python
RUN apt-get update && apt-get install -y python python-pip

#Create a new system user
RUN useradd -m jupyter

#Login as user
USER jupyter

RUN pip install jupyter
ENV PATH="/home/jupyter/.local/bin:${PATH}"
RUN pip install jupyter tensorflow==1.0.0 jupyter_contrib_nbextensions pandas matplotlib sklearn Keras seaborn

RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable hinterland/hinterland

WORKDIR /home/jupyter/notebook

# Start the notebook
ENTRYPOINT ["jupyter", "notebook", "--ip=*"]