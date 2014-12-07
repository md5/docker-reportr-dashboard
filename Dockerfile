FROM node:0.10
MAINTAINER Mike Dillon <mike@embody.org> (@md5)

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV REPORTR_DASHBOARD_VERSION 3.5.1

RUN curl -L https://github.com/Reportr/dashboard/archive/${REPORTR_DASHBOARD_VERSION}.tar.gz | tar --strip-components 1 -xzf -
RUN npm install
RUN npm run grunt

COPY entrypoint /

ENV PORT 5000

ENTRYPOINT ["/entrypoint"]
CMD ["node", "bin/web.js"]
EXPOSE 5000
