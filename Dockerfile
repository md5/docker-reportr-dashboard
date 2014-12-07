FROM node:0.10
MAINTAINER Mike Dillon <mike@embody.org> (@md5)

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV REPORTR_DASHBOARD_VERSION 30eabf2d2f50a680126353560e15dc807768ea11

RUN curl -L https://github.com/md5/reportr-dashboard/archive/${REPORTR_DASHBOARD_VERSION}.tar.gz | tar --strip-components 1 -xzf -
RUN npm install
RUN npm install -g grunt-cli
RUN grunt

COPY entrypoint /

ENV PORT 5000

ENTRYPOINT ["/entrypoint"]
CMD ["node", "bin/web.js"]
EXPOSE 5000
