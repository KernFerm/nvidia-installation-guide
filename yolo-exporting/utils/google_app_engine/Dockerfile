# Use a slim official Python image for better control over Python version and size
FROM python:3.10-slim

# Set up environment variables for the virtual environment
ENV VIRTUAL_ENV=/env
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install system dependencies and required libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the application's requirements.txt and install Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt

# Copy the application source code
COPY . /app
WORKDIR /app

# Expose the port used by Gunicorn
EXPOSE $PORT

# Run Gunicorn to serve the application (ensure gunicorn is in requirements.txt)
CMD ["gunicorn", "-b", ":$PORT", "main:app"]
