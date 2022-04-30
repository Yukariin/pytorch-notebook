FROM nvidia/cuda:11.4.2-base-ubuntu20.04

ENV SHELL=/bin/bash

WORKDIR /app/

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
	python3-pip \
	libsm6 \
	libxext6 \
	libxrender-dev \
	ffmpeg \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install \
	numpy \
	opencv-python \
	pillow \
	scikit-image \
	torch \
	torchvision \
	jupyterlab
	
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888
