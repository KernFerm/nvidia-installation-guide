@echo off
:: Batch script to install Python packages for CUDA 11.8 environment

echo MAKE SURE TO HAVE THE WHL DOWNLOADED BEFORE YOU CONTINUE!!!
pause
echo Click the link to download the WHL: press ctrl then left click with mouse
echo https://github.com/cupy/cupy/releases/download/v12.0.0b1/cupy_cuda11x-12.0.0b1-cp311-cp311-win_amd64.whl
pause

echo Installing CuPy from WHL...
pip install https://github.com/cupy/cupy/releases/download/v12.0.0b1/cupy_cuda11x-12.0.0b1-cp311-cp311-win_amd64.whl
echo Press enter to continue with the rest of the dependency installs
pause

echo Installing ONNX Runtime with GPU support...
pip install onnxruntime-gpu==1.19.2
echo Press enter to continue with the rest of the dependency installs
pause

echo Installing NVIDIA PyIndex...
pip install nvidia-pyindex
echo Press enter to continue with the rest of the dependency installs
pause

echo Installing cuDNN for CUDA 11.8...
pip install nvidia-cudnn-cu11==8.6.0.163
echo Press enter to continue with the rest of the dependency installs
pause

echo Installing TensorRT for CUDA 11.8...
pip install nvidia-tensorrt==8.6.1
echo Press enter to continue with the rest of the dependency installs
pause

echo Installing NumPy...
pip install numpy
echo Press enter to continue with the rest of the dependency installs
pause

:: Installing PyCUDA (Optional, required for some CUDA functionalities)
echo Installing PyCUDA...
pip install pycuda
echo Press enter to continue with the rest of the dependency installs
pause

:: Installing Protobuf (Required for ONNX operations)
echo Installing Protobuf...
pip install protobuf==4.23.3
echo Press enter to continue with the rest of the dependency installs
pause

:: Optional: Installing additional tools
echo Installing Additional Tools like Scipy and Matplotlib...
pip install scipy matplotlib
echo Press enter to continue with the rest of the dependency installs
pause

echo All packages installed successfully!
pause
