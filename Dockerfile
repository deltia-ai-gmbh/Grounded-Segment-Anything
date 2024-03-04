FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-devel

RUN apt-get update && apt-get install --no-install-recommends wget ffmpeg=7:* \
    libsm6=2:* libxext6=2:* git=1:* nano=2.* \
    vim=2:* -y \
    && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/appuser/Grounded-Segment-Anything
COPY . /home/appuser/Grounded-Segment-Anything/
WORKDIR /home/appuser/Grounded-Segment-Anything/

RUN python -m pip install -r requirements.txt
RUN python -m pip install -e segment_anything
RUN python -m pip install -e GroundingDINO
RUN pip install diffusers transformers accelerate scipy safetensors