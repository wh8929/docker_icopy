FROM wh89/newb:mongodb_alpine

VOLUME /data/db
EXPOSE 27017

COPY create_admin.js run.sh /root/

RUN apk update && apk add git gcc libressl-dev libffi-dev musl-dev python3-dev bash && \
    wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && \
    cd /root && git clone https://github.com/fxxkrlab/iCopy.git && \
    mkdir -p /root/.config/rclone && \
    cd iCopy && chmod +x iCopy.py && \
    pip3 install -r requirements.txt && \
    wget https://github.com/mawaya/rclone/releases/download/fclone-v0.3.1/fclone-v0.3.1-linux-amd64.zip && \
    unzip fclone-v0.3.1-linux-amd64.zip && \
    chmod +x fclone-v0.3.1-linux-amd64/fclone && \
    mv fclone-v0.3.1-linux-amd64/fclone /usr/bin/fclone && fclone version && \
    rm -r fclone-v0.3.1-linux-amd64 && rm fclone-v0.3.1-linux-amd64.zip

ENTRYPOINT [ "/root/run.sh" ]
CMD [ "mongod",  "--auth", "--bind_ip", "0.0.0.0" ]
