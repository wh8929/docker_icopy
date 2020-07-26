FROM jfloff/alpine-python:3.8-slim

RUN apk add --no-cache \
        libressl-dev \
        musl-dev \
        git \
        gcc \
        libffi-dev && cd /root && \
        git clone https://github.com/fxxkrlab/iCopy.git && \
        mkdir -p /root/.config/rclone && \
        cd iCopy && chmod +x iCopy.py && \
        pip3 install -r requirements.txt && \
        apk del \
        libressl-dev \
        musl-dev \
        gcc \
        libffi-dev && \
        wget https://github.com/mawaya/rclone/releases/download/fclone-v0.3.1/fclone-v0.3.1-linux-amd64.zip && \
        unzip fclone-v0.3.1-linux-amd64.zip && \
        /bin/bash -c 'chmod +x fclone-v0.3.1-linux-amd64/fclone' && \
        mv fclone-v0.3.1-linux-amd64/fclone /usr/bin/fclone && fclone version && \
        rm -r fclone-v0.3.1-linux-amd64 && rm fclone-v0.3.1-linux-amd64.zip
		
CMD [ "python3", "/root/iCopy/iCopy.py" ]