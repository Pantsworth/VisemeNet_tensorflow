# NOTE: Later versions of Tensorflow will not work. 
FROM tensorflow/tensorflow:1.1.0-gpu-py3

RUN apt-get update && apt-get install -y git  \
	python3-tk \
	nano

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

COPY . Visemenet_tensorflow/
