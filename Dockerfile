FROM ubuntu:16.04
MAINTAINER Benjamin Borbe <bborbe@rocketnews.de>
ARG VERSION

ENV HOME /root
ENV LANG en_US.UTF-8

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
	mountall \
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
RUN locale-gen en_US.UTF-8

RUN mkdir /var/run/sshd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN mkdir -p /root/.ssh
RUN chmod 700 /root /root/.ssh
COPY authorized_keys /root/.ssh/
RUN chmod 600 /root /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
