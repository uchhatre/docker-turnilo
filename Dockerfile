FROM node:14.15
MAINTAINER uchhatre@gmail.com
EXPOSE 9090
RUN npm install -g turnilo@1.33.1
COPY run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]
