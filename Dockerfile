FROM stackbrew/ubuntu:14.04

RUN apt-get -y update
RUN apt-get install -y apt-utils
RUN apt-get install -y nodejs npm git
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g hubot coffee-script
RUN hubot --create evey
RUN cd evey && npm install hubot-irc --save && npm install
RUN cd evey && npm install hubot-scripts
RUN cd evey && npm install tomahk

RUN git clone https://github.com/xhochy/hubot-tomahk.git
RUN cd hubot-tomahk && npm install
RUN ln -s /hubot-tomahk/tomahk.coffee /evey/scripts/tomahk.coffee

RUN git clone https://github.com/lorenzhs/hubot-tell.git
RUN cd hubot-tell && npm install
RUN ln -s /hubot-tell/src/tell.coffee /evey/scripts/tell.coffee

ADD hubot-scripts.json evey/hubot-scripts.json
ADD evey evey/evey
ADD axes axes
ADD pw pw

CMD cd evey && ./evey

