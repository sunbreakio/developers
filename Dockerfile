FROM node:10-alpine

RUN npm install --global gitbook-cli && \
    gitbook fetch 3.2.2 && \
    npm cache clear --force && \
    rm -rf /tmp/*

# Fixes https://github.com/GitbookIO/gitbook/issues/1309
RUN sed -i.bak 's/confirm: true/confirm: false/g' \
    /root/.gitbook/versions/3.2.2/lib/output/website/copyPluginAssets.js

WORKDIR /srv/gitbook

COPY ./src /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook install && /usr/local/bin/gitbook serve --no-watch --no-live
