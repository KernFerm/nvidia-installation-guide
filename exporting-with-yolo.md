### Files in the Repository

- **commands-to-export.txt:** A file containing useful commands for exporting your YOLO model.
- **export.py:** The Python script responsible for handling the export process.

## Exporting YOLO Models (NVIDIA and AMD GPUs)

### Export to TensorRT Engine (For NVIDIA GPUs)

To export your YOLO model to a TensorRT engine (for NVIDIA GPUs only), use the following command:

```
python .\export.py --weights ./"your_model_path.pt" --include engine --half --imgsz 320 320 --device 0
```
- Replace `"your_model_path"` with the path to your YOLO `.pt` file.
- The `--half` flag enables half-precision inference for faster performance and lower memory usage.
- `--imgsz 320 320` sets the image size to 320x320 pixels for export.
- `--device 0` specifies the GPU device ID (use `--device cpu` for CPU-based inference).
- **Note**: TensorRT is only compatible with **NVIDIA GPUs**.

### Export to ONNX

To export your YOLO model to ONNX format, use the following command:

```
python .\export.py --weights ./"your_model_path.pt" --include onnx --half --imgsz 320 320 --device 0
```
- Replace `"your_model_path"` with your YOLO `.pt` model.
- The `--half` flag enables half-precision inference (if supported).
- `--imgsz 320 320` sets the image size to 320x320 pixels.

### Export for AMD GPU

To export your YOLO model for an AMD GPU, use the following command:

```
python .\export.py --weights .\your_model_path.pt --include onnx --imgsz 320 320
```
- Replace `"your_model_path"` with the path to your YOLO `.pt` file.
- This command will export the model in the ONNX format for AMD GPU inference.

## Troubleshooting

- If you encounter issues during export, ensure that your `CUDA`, `cuDNN`, and `TensorRT` versions are compatible with the version of `PyTorch` you are using.
- For `ONNX` export issues, ensure you have the `correct ONNX version` installed.

