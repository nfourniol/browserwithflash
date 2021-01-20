FROM dorowu/ubuntu-desktop-lxde-vnc

WORKDIR /root/data

RUN apt-get -y update \
    && apt-get -y install wget vim mlocate iputils-ping \
	&& apt-get -y install alien dpkg-dev debhelper build-essential \
	&& rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime


COPY ./data/flash-plugin-11.2.202.394-0.1.el7.rf.x86_64.rpm ./flash-plugin-11.2.202.394-0.1.el7.rf.x86_64.rpm
RUN alien flash-plugin-11.2.202.394-0.1.el7.rf.x86_64.rpm \
    && dpkg -i flash-plugin_11.2.202.394-1.1_amd64.deb \
    && mkdir -p /root/.mozilla/plugins \
    && cp /usr/lib64/flash-plugin/libflashplayer.so /root/.mozilla/plugins/

ENV FF_VERS 83.0b9
ENV FF_INST=/usr/lib64/firefox/$FF_VERS
ARG FF_URL=http://releases.mozilla.org/pub/firefox/releases/$FF_VERS/linux-x86_64/fr/firefox-$FF_VERS.tar.bz2
RUN mkdir -p "$FF_INST" \
    && wget -Q0 $FF_URL \
    && tar xvjf firefox-$FF_VERS.tar.bz2 --strip 1 -C $FF_INST/ \
	# Link this install as the default FF install
	&& rm -f /usr/bin/firefox \
	&& ln -s "$FF_INST/firefox" /usr/bin/firefox

# Disable firefox automatic update by copying the distribution directory and its policies.json file
COPY ./data/firefox/distribution/ $FF_INST/distribution/



