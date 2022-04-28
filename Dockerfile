FROM nvidia/cuda:11.4.2-base-ubuntu20.04

ENV SHELL=/bin/bash

WORKDIR /app/

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
		python3-pip \
		apt-utils \
		vim \
		git \
		libsm6 \
		libxext6 \
		libxrender-dev \
		ffmpeg && \
	rm -rf /var/lib/apt/lists/*
	
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip install \
	numpy \
	opencv-python \
	pillow \
	scikit-image \
	torch \
	torchvision \
	jupyterlab
	
	
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888
