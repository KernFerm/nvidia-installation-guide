# 🚀 NVIDIA CUDA Installation Guide

This guide walks you through installing NVIDIA CUDA Toolkit 11.8, cuDNN, and TensorRT on Windows, including setting up Python packages like Cupy and TensorRT. It ensures proper system configuration for CUDA development, with steps for setting environment variables and verifying installation via cmd.exe

### 1. **Download the NVIDIA CUDA Toolkit 11.8**

First, download the CUDA Toolkit 11.8 from the official NVIDIA website:

👉 [Nvidia CUDA Toolkit 11.8 - DOWNLOAD HERE](https://developer.nvidia.com/cuda-11-8-0-download-archive)

### 2. **Install the CUDA Toolkit**

- After downloading, open the installer (`.exe`) and follow the instructions provided by the installer.
- Make sure to select the following components during installation:
  - CUDA Toolkit
  - CUDA Samples
  - CUDA Documentation (optional)

### 3. **Verify the Installation**

- After the installation completes, open the `cmd.exe` terminal and run the following command to ensure that CUDA has been installed correctly:
  ```
  nvcc --version
  ```
This will display the installed CUDA version.

### **4. Install Cupy**
Run the following command in your terminal to install Cupy:
  ```
  pip install cupy-cuda11x
  ```

## 5. CUDNN Installation 🧩
Download cuDNN (CUDA Deep Neural Network library) from the NVIDIA website:

👉 [Download CUDNN](https://developer.nvidia.com/downloads/compute/cudnn/secure/8.9.6/local_installers/11.x/cudnn-windows-x86_64-8.9.6.50_cuda11-archive.zip/). (Requires an NVIDIA account – it's free).

## 6. Unzip and Relocate 📁➡️
Open the `.zip` cuDNN file and move all the folders/files to the location where the CUDA Toolkit is installed on your machine, typically:

```
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8
```


## 7. Get TensorRT 8.6 GA 🔽
Download [TensorRT 8.6 GA](https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/secure/8.6.1/zip/TensorRT-8.6.1.6.Windows10.x86_64.cuda-11.8.zip).

## 8. Unzip and Relocate 📁➡️
Open the `.zip` TensorRT file and move all the folders/files to the CUDA Toolkit folder, typically located at:

```
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8
```


## 9. Python TensorRT Installation 🎡
Once all the files are copied, run the following command to install TensorRT for Python:

```
pip install "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\python\tensorrt-8.6.1-cp311-none-win_amd64.whl"
```

🚨 **Note:** If this step doesn’t work, double-check that the `.whl` file matches your Python version (e.g., `cp311` is for Python 3.11). Just locate the correct `.whl` file in the `python` folder and replace the path accordingly.

## 10. Set Your Environment Variables 🌎
Add the following paths to your environment variables:

```
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\lib
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\libnvvp
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\bin
```

# Setting Up CUDA 11.8 with cuDNN on Windows

Once you have CUDA 11.8 installed and cuDNN properly configured, you need to set up your environment via `cmd.exe` to ensure that the system uses the correct version of CUDA (especially if multiple CUDA versions are installed).

## Steps to Set Up CUDA 11.8 Using `cmd.exe`

### 1. Set the CUDA Path in `cmd.exe`

You need to add the CUDA 11.8 binaries to the environment variables in the current `cmd.exe` session.

Open `cmd.exe` and run the following commands:

```
set PATH=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\bin;%PATH%
set PATH=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\libnvvp;%PATH%
set PATH=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\extras\CUPTI\lib64;%PATH%
```
These commands add the CUDA 11.8 binary, lib, and CUPTI paths to your system's current session. Adjust the paths as necessary depending on your installation directory.

2. Verify the CUDA Version
After setting the paths, you can verify that your system is using CUDA 11.8 by running:
```
nvcc --version
```
This should display the details of CUDA 11.8. If it shows a different version, check the paths and ensure the proper version is set.

3. **Set the Environment Variables for a Persistent Session**
If you want to ensure CUDA 11.8 is used every time you open `cmd.exe`, you can add these paths to your system environment variables permanently:

1. Open `Control Panel` -> `System` -> `Advanced System Settings`.
Click on `Environment Variables`.
Under `System variables`, select `Path` and click `Edit`.
Add the following entries at the top of the list:
```
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\bin
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\libnvvp
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\extras\CUPTI\lib64
```
This ensures that CUDA 11.8 is prioritized when running CUDA applications, even on systems with multiple CUDA versions.

4. **Set CUDA Environment Variables for cuDNN**
If you're using cuDNN, ensure the `cudnn64_8.dll` is also in your system path:
```
set PATH=C:\tools\cuda\bin;%PATH%
```
This should properly set up CUDA 11.8 to be used for your projects via `cmd.exe`.
