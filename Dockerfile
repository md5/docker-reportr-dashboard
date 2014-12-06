FROM node:0.10
MAINTAINER Mike Dillon <mike@embody.org> (@md5)

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV REPORTR_DASHBOARD_VERSION 17fff858fe9cacf8aa2db27c34dd6ff72b75bd65

RUN curl -L https://github.com/md5/reportr-dashboard/archive/${REPORTR_DASHBOARD_VERSION}.tar.gz | tar --strip-components 1 -xzf -
RUN npm install
RUN npm install -g grunt-cli
RUN grunt

COPY entrypoint /

ENV PORT 5000

ENTRYPOINT ["/entrypoint"]
CMD ["node", "bin/web.js"]
EXPOSE 5000
