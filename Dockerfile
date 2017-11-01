FROM centos/ruby-22-centos7

USER default
#ENV SVC_IP 172.30.53.52:8080
RUN curl 172.30.156.170:8080

EXPOSE 8080
COPY . /opt/app-root/src/
RUN scl enable rh-ruby22 "bundle install"
CMD ["scl", "enable", "rh-ruby22", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
