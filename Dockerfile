FROM node:0.10
MAINTAINER Mike Dillon <mike@embody.org> (@md5)

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV REPORTR_DASHBOARD_VERSION b6ee09ead4fa7a37fae1f174d660687b9161476f

RUN curl -L https://github.com/Reportr/dashboard/archive/${REPORTR_DASHBOARD_VERSION}.tar.gz | tar --strip-components 1 -xzf -
RUN npm install
RUN npm install -g grunt-cli
RUN grunt

COPY entrypoint /

ENV PORT 5000

ENTRYPOINT ["/entrypoint"]
CMD ["node", "bin/web.js"]
EXPOSE 5000
