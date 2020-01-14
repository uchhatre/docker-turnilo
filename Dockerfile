FROM node:12.14
MAINTAINER uchhatre@gmail.com
EXPOSE 9090
RUN npm install -g turnilo@1.20.1
COPY run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]
