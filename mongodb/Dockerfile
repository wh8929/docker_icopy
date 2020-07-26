FROM mvertes/alpine-mongo:4.0.6-1

VOLUME /data/db
EXPOSE 27017

COPY run.sh create_admin.js /root/

RUN mongod --fork --logpath /root/mongod.log --bind_ip 0.0.0.0 && \
    mongo admin /root/create_admin.js
	
ENTRYPOINT [ "/root/run.sh" ]
CMD [ "mongod", "--auth", "--bind_ip", "0.0.0.0" ]
