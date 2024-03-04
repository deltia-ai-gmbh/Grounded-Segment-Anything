FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-devel

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y \
    && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/appuser/Grounded-Segment-Anything
COPY . /home/appuser/Grounded-Segment-Anything/
WORKDIR /home/appuser/Grounded-Segment-Anything/

RUN python -m pip install -r requirements.txt
RUN python -m pip install -e segment_anything
RUN python -m pip install -e GroundingDINO
RUN pip install diffusers transformers accelerate scipy safetensors