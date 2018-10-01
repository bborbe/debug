FROM ubuntu:18.04
MAINTAINER Benjamin Borbe <bborbe@rocketnews.de>

RUN set -x \
	&& DEBIAN_FRONTEND=noninteractive apt-get update --quiet \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade --quiet --yes \
	&& DEBIAN_FRONTEND=noninteractive apt-get install --quiet --yes --no-install-recommends \
	locales \
	apt-transport-https \
	ca-certificates \
	openssh-server \
	bash \
	curl \
	wget \
	screen \
	mailutils \
	postfix \
	augeas-tools \
	tmux \
	vim \
	net-tools \
	iproute2 \
	iputils-ping \
	openssh-client \
	rsync \
	nfs-common \
	telnet \
	dnsutils \
	traceroute \
	psmisc \
	sysstat \
	atop \
	iotop \
	bonnie++ \
	file \
	sudo \
	&& DEBIAN_FRONTEND=noninteractive apt-get autoremove --yes \
	&& DEBIAN_FRONTEND=noninteractive apt-get clean

ENV HOME /root
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8
