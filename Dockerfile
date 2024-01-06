# Use tensorflow gpu version as base image
FROM tensorflow/tensorflow:latest-gpu

WORKDIR /DockerMindStep
COPY . /DockerMindStep
RUN chmod a+x run.sh

RUN python -m pip install --upgrade pip
RUN pip install pipenv 
RUN pip install --upgrade protobuf
RUN pip install openpyxl
RUN pip install pandas pyarrow
RUN pip install gdxcc


RUN pip install -r requirements.txt


CMD ["./run.sh"]


