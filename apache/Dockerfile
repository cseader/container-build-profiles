FROM registry.suse.com/suse/sle15:latest
LABEL maintainer="Cameron Seader <cseader@suse.com>"
LABEL name="SUSE Manager apache container build profile"
LABEL version="1.0.0-20210831"

ARG repo
ARG cert

RUN echo "$cert" > /etc/pki/trust/anchors/RHN-ORG-TRUSTED-SSL-CERT.pem
RUN update-ca-certificates
RUN echo "$repo" > /etc/zypp/repos.d/susemanager:dockerbuild.repo

RUN zypper -n --gpg-auto-import-keys ref && zypper in -y -f aaa_base aaa_base-extras net-tools timezone vim less sudo tar python python-xml apache2 apache2-prefork

ADD pub.conf /etc/apache2/conf.d/pub.conf
RUN mkdir -p /srv/www/htdocs/pub/
ADD index.html /srv/www/htdocs/pub/index.html

CMD /usr/sbin/start_apache2 -DFOREGROUND -k start