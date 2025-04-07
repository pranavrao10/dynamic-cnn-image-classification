FROM nvidia/cuda:12.4.1-base-ubuntu20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
COPY requirements.txt /tmp/
RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

# Set working directory
WORKDIR /workspace
COPY . /workspace

# Default command
CMD ["bash"]