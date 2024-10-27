FROM node:20-alpine

RUN npm update -y -g npm
RUN apk update
RUN apk add avahi git openrc dbus

ADD https://api.github.com/repos/niunai/google-home-voicetext/git/refs/heads/master /.git-hashref
RUN git clone https://github.com/niunai/google-home-voicetext.git
WORKDIR /google-home-voicetext
RUN npm install
RUN mkdir firebase-secret
COPY boot.bash /usr/local/bin/
COPY serviceAccountKey.json /google-home-voicetext

CMD ["/usr/local/bin/boot.bash"]
