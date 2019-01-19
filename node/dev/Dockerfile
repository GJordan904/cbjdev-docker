FROM node:10-alpine

VOLUME /app

COPY entry.sh /root
RUN chmod +x /root/entry.sh

ENTRYPOINT [ "/root/entry.sh" ]