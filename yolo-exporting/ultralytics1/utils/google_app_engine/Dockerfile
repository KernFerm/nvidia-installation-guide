# Start with an official Python base image (e.g., Python 3.9 or newer)
FROM python:3.9-slim

# Create and activate a virtual environment for dependencies
ENV VIRTUAL_ENV=/env
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install system dependencies and Python packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the application's requirements.txt and install Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r /app/requirements.txt

# Copy the application source code
COPY . /app
WORKDIR /app

# Expose the port and specify the command to run the application
# Gunicorn must be declared as a dependency in requirements.txt.
EXPOSE $PORT
CMD ["gunicorn", "-b", ":$PORT", "main:app"]
