FROM node:0.10
MAINTAINER Mike Dillon <mike@embody.org> (@md5)

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV REPORTR_DASHBOARD_VERSION e5cbb5d97a0a07932ff79b6885f07dc22444383c

RUN curl -L https://github.com/Reportr/dashboard/archive/${REPORTR_DASHBOARD_VERSION}.tar.gz | tar --strip-components 1 -xzf -
RUN npm install
RUN npm install -g grunt-cli
RUN grunt

COPY entrypoint /

ENV PORT 5000

ENTRYPOINT ["/entrypoint"]
CMD ["node", "bin/web.js"]
EXPOSE 5000
