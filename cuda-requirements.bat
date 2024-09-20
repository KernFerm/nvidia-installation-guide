@echo off
:: Batch script to install Python packages for CUDA 11.8 environment

:: Ensure Python is installed
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install Python and try again.
    pause
    exit /b
)

:: Install packages using pip
echo Installing ONNX Runtime with GPU support...
pip install onnxruntime-gpu==1.19.2
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install onnxruntime-gpu
    pause
    exit /b
)

echo Installing NVIDIA PyIndex...
pip install nvidia-pyindex
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install nvidia-pyindex
    pause
    exit /b
)

echo Installing cuDNN for CUDA 11.8...
pip install nvidia-cudnn-cu11==8.6.0.163
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install nvidia-cudnn-cu11
    pause
    exit /b
)

echo Installing TensorRT for CUDA 11.8...
pip install nvidia-tensorrt==8.6.1
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install nvidia-tensorrt
    pause
    exit /b
)

echo Installing NumPy...
pip install numpy
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install numpy
    pause
    exit /b
)

echo Installing PyTorch 2.4.1 with CUDA 11.8...
pip install torch==2.4.1+cu118
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install torch
    pause
    exit /b
)

echo Installing TorchVision 0.19.1 with CUDA 11.8...
pip install torchvision==0.19.1+cu118
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install torchvision
    pause
    exit /b
)

echo All packages installed successfully!
pause
