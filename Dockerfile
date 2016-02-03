# Built using Docker 1.9.1
#
# To Build:
#   docker build --force-rm=true -t costco/bact:0.0.1 .
# To Run:
#   docker run -d -p 3000:3000 costco/bact:0.0.1
# 
FROM alpine:edge 
MAINTAINER Jeffrey Gilbert <jgilber@costco.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 
RUN apk update
RUN apk add --update bash wget git nodejs && rm -rf /var/cache/apk/*
RUN apk update
RUN apk upgrade
RUN npm install -g ember-cli@1.13.15 bower phantomjs
RUN npm cache clean && bower cache clean --allow-root

# Add production or dist version (minified & finger printed) of your application.
WORKDIR /root

RUN mkdir -p /root/node_app/dist
# Copy in Node.js configs
ADD ./node_app/package.json /root/node_app/package.json
ADD ./node_app/startApp.js /root/node_app/startApp.js
# Copy in Ember distribution
ADD ./ember_app/dist /root/node_app/dist
# Build Node.js app
RUN cd /root/node_app && npm install && npm cache clear && cd ..

# Expose port needed for Node.js
EXPOSE 3000

# Start Node.js application via npm start command in package.json.
CMD ["/bin/bash", "-c", "cd /root/node_app && npm start"]
