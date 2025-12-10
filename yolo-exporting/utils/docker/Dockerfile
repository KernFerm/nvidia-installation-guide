# YOLOv5 🚀 by Ultralytics, AGPL-3.0 license
# Builds ultralytics/yolov5:latest image on DockerHub https://hub.docker.com/r/ultralytics/yolov5
# Image is CUDA-optimized for YOLOv5 single/multi-GPU training and inference

# Start FROM the latest compatible PyTorch image
FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-runtime

# Set up environment variables for non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive
ENV OMP_NUM_THREADS=1

# Install system dependencies and set timezone
RUN apt update && \
    apt install -y --no-install-recommends \
    tzdata gcc git zip curl htop libgl1 libglib2.0-0 libpython3-dev gnupg && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt upgrade -y openssl && \
    rm -rf /var/lib/apt/lists/*

# Download custom fonts
ADD https://ultralytics.com/assets/Arial.ttf /root/.config/Ultralytics/
ADD https://ultralytics.com/assets/Arial.Unicode.ttf /root/.config/Ultralytics/

# Create working directory and copy application files
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

# Copy requirements file and install Python dependencies
COPY requirements.txt .
RUN python3 -m pip install --upgrade pip wheel && \
    pip install --no-cache-dir -r requirements.txt albumentations comet gsutil notebook \
    coremltools onnx onnx-simplifier onnxruntime 'openvino-dev>=2023.0'

# Clean up
ENV DEBIAN_FRONTEND=teletype

# Usage Examples (commented for reference)
# Build and Push
# t=ultralytics/yolov5:latest && docker build -t $t . && docker push $t

# Pull and Run
# t=ultralytics/yolov5:latest && docker pull $t && docker run -it --ipc=host --gpus all $t

# Pull and Run with local directory access
# t=ultralytics/yolov5:latest && docker pull $t && docker run -it --ipc=host --gpus all -v "$(pwd)"/datasets:/usr/src/datasets $t

# Clean up
# docker system prune -a --volumes

# Update Ubuntu drivers
# https://www.maketecheasier.com/install-nvidia-drivers-ubuntu/
