FROM alpine:3.8

RUN apk add --no-cache mongodb

VOLUME /data/db

COPY entry.sh /root
RUN chmod +x /root/entry.sh

ENTRYPOINT [ "/root/entry.sh" ]
CMD [ "mongod", "--bind_ip", "0.0.0.0" ]

EXPOSE 27017 28017