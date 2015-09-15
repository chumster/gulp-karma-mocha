#FROM ubuntu:14.10
FROM ubuntu:trusty

MAINTAINER Stephen Chumley "s.chumley@edgecase.io"

# Update packages
##### RUN apt-get update -y --fix-missing && apt-get upgrade -y

# Install some packages we need
##### RUN apt-get install -y curl git

# Install Node.JS, chrome and xvfb
# node v0.12.0 is the most recent that circleci supports, so we are using this for now
RUN apt-get update; \
    apt-get install -y git curl; \
    curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -; \
    curl https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ; \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'; \
    apt-get update && apt-get install -y google-chrome-stable nodejs Xvfb; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy files and run
ADD . /opt/ci-grunt-karma-mocha
RUN cd /opt/ci-grunt-karma-mocha && npm install

# Build display versions
# RUN cd /opt/ci-grunt-karma-mocha && node build.js

###ADD xvfb.sh /etc/init.d/xvfb
###ADD entrypoint.sh /entrypoint.sh

###ENV DISPLAY :99.0
###ENV CHROME_BIN /usr/bin/google-chrome

##### EXPOSE 5000
##### CMD forever /opt/display/server.js
##### CMD /bin/bash

###ENTRYPOINT ["/entrypoint.sh"]