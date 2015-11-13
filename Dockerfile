# Create a container from Ubuntu.
FROM ubuntu:latest

# Credits.
# MAINTAINER Guido Barbaglia "guido.barbaglia@gmail.com"

# Install Python.
RUN apt-get update && apt-get install -y build-essential
RUN apt-get update && apt-get install -y python python-pip wget
RUN apt-get update && apt-get install -y python-dev

# Create a working directory.
RUN mkdir deploy

# Install VirtualEnv.
RUN pip install virtualenv

# Add requirements file.
ADD requirements.txt /deploy/requirements.txt

# Add the script that will start everything.
ADD start.py /deploy/start.py

# Run VirtualEnv.
RUN virtualenv /deploy/env/
RUN /deploy/env/bin/pip install wheel
RUN /deploy/env/bin/pip install -r /deploy/requirements.txt