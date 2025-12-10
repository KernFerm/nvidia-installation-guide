# Start with an official CUDA base image that is compatible with PyTorch 2.5.1
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

# Set environment variable to suppress prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and other dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-dev \
    gcc git zip curl htop libgl1-mesa-glx libglib2.0-0 tzdata && \
    rm -rf /var/lib/apt/lists/*

# Set Python 3 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Upgrade pip and install PyTorch 2.6.0 with CUDA 11.8
RUN pip install --upgrade pip
RUN pip install torch==2.6.0+cu118 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Create working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Clone the latest YOLOv5 repository
RUN git clone https://github.com/ultralytics/yolov5 /usr/src/app

# Copy requirements.txt if you have custom dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt albumentations comet gsutil notebook \
    coremltools onnx onnx-simplifier onnxruntime 'openvino-dev>=2022.3'

# Set environment variables
ENV OMP_NUM_THREADS=1

# Add any other optional configurations or commands here
# ...

# Usage Examples (commented for reference)
# To build: docker build -t my-yolov5-image .
# To run: docker run -it --ipc=host --gpus all my-yolov5-im
