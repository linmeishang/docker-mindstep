# DockerMindStep
This docker repository reads dataset of ".parquet.gzip" format, processes the data and traind neural networks with the data.


# How to run the application using Docker


## Step 1: Clone this docker repo

"""
git clone
"""


## Step 2: Build docker image using this docker repository. Make sure your current working directory is DockerMindStep.

"""
docker build .
"""

## Step 3:  Run a container using the built image. Replace <image-id> with the image-id you have built.

"""
docker run <image-id>
"""

## Step 4:  If everything works perfectly, then neural network is already trained and saved in the container. To check the container id:

"""
docker ps -all 
"""

## Step 5:  Go inside of the container, where model and data are saved. Replace container-id with yours.

"""
docker commit <container-id> mysnapshot
"""

"""
docker run -t -i mysnapshot /bin/bash
"""

## Step 6:  Now you are inside the container. Use "ls" and "cd" command to switch the directory and check if the trained models and save data are there.


## Step 7:  Copy everything in this container, you have to jump out from the container first using:

"""
exit
"""

Then copy the whole container to your home directory under the folder "Container". Replace container-id with yours. 

"""
docker cp <container-id>:/DockerMindStep ~/Container
"""

For example, the saved surrogate model FarmLin.h5 is under: /Container/DockerMindStep/DataPreparation/DataPreparation_202401061447/Model_202401061447.



