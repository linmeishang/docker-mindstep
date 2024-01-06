# DockerMindStep
This docker repository reads a dataset of ".parquet.gzip" format, processes the data and trains neural networks with the data.

To see how to transform gdx file from GAMS into ".parquet.gzip", please see https://github.com/linmeishang/MindStep-WP4.5.git

Due to the issue with GAMS license, this docker image does not conduct data collection step, but only prepares data and train models.

To train models with your own data, just replace the dataset total_df_20230818.parquet.gzip with your own data. 

To change the hyperparameters of the neural network, just define new values in the train.py file.



# How to run the application on your computer

Make sure you have docker and git installed.

## Step 1: Clone this repositrory.

```
git clone https://github.com/linmeishang/docker-mindstep.git
```


## Step 2: Build docker image using this repository. Make sure your current working directory is "docker-mindstep", where the Dockerfile is directly located.
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

Step 5 - Step 7 help you to navigate into the container to check if everything works as expected. You can also skip them and directly jump to Step 8. 

## Step 5:  Go inside of the container, where model and data are saved. Replace <container-id> with yours.

```
docker commit <container-id> mysnapshot
```

```
docker run -t -i mysnapshot /bin/bash
```

## Step 6:  Now you are inside the container. Use "ls" and "cd" command to switch the directory and check if the trained models and save data are there.
```
ls
```
You should see the following files/folders:

DataCollection  DataPreparation  Dockerfile  README.md  data_preparation.py  requirements.txt  run.sh  train.py

Go to the DataPreparation folder using cd command:

```
cd DataPreparation
```

Then use ls command and cd command to navigate to the newly created folder DataPreparation_YYYYMMDDhhmm and Model_YYYYMMDDhhmm, where the trained model is saved.

## Step 7:  Jump out from the container. 

```
exit
```

## Step 8:  Copy the whole container to your home directory under the folder "Container"  to better ultilize the saved files. 

Replace < container-id > with yours. 

```
docker cp <container-id>:/DockerMindStep ~/Container
```

The trained surrogate model "FarmLin.h5" and related files of the model performance are saved under: /Container/DockerMindStep/DataPreparation/DataPreparation_YYYYMMDDhhmm/Model_YYYYMMDDhhmm.



