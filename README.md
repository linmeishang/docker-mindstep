# DockerMindStep
This docker repository reads a dataset of ".parquet.gzip" format, processes the data and trains neural networks with the data.
To see how to transform gdx file from GAMS into ".parquet.gzip", please see https://github.com/linmeishang/MindStep-WP4.5.git
Due to the issue with GAMS license, this docker image does not conduct data collection step, but only prepares data and train models.
To train models with your own data, just replace the dataset total_df_20230818.parquet.gzip with your own data. 
To change the hyperparameters of the neural network, just define new values in the train.py file.


# How to run the application on your computer

Make sure you have docker and git installed.

## Step 1: Clone this repositrory

```
git clone https://github.com/linmeishang/docker-mindstep.git
```


## Step 2: Build docker image using this repository. Make sure your current working directory is DockerMindStep.
```
docker build .
```

## Step 3: Run a container using the built image. Replace <image-id> with the image-id you have built.

```
docker run <image-id>
```

## Step 4: If everything works perfectly, then neural network is already trained and saved in the container. To check the container id:

```
docker ps -all 
```

## Step 5:  Go inside of the container, where model and data are saved. Replace <container-id> with yours.

```
docker commit <container-id> mysnapshot
```

```
docker run -t -i mysnapshot /bin/bash
```

## Step 6:  Now you are inside the container. Use "ls" and "cd" command to switch the directory and check if the trained models and save data are there.


## Step 7:  Copy everything in this container. 

You have to jump out from the container first using:

```
exit
```

Then copy the whole container to your home directory under the folder "Container". Replace <container-id> with yours. 

```
docker cp <container-id>:/DockerMindStep ~/Container
```

The saved surrogate model "FarmLin.h5" and related files of the model performance is under: /Container/DockerMindStep/DataPreparation/DataPreparation_YYYYMMDDHHMM/Model_YYYYMMDDHHMM.



