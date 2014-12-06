FROM node:0.10

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN curl -L https://github.com/Reportr/dashboard/archive/3.5.0.tar.gz | tar --strip-components 1 -xzf -
RUN npm install
RUN npm install -g grunt-cli
RUN grunt

COPY entrypoint /

ENV PORT 5000

ENTRYPOINT ["/entrypoint"]
CMD ["node", "bin/web.js"]
EXPOSE 5000
