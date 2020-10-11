FROM debian:10

EXPOSE 5432

ENV DBNAME="portal" DBUSER="pguser" USERPASS="666666"

RUN apt update && \ 
apt install -y postgresql postgresql-client
RUN apt install -y python3 && \
 apt install -y python3-pip && \
 apt install -y libpq-dev && \
 apt install -y python-dev
RUN pip3 install psycopg2
RUN mkdir /Python_scripts/

COPY ./postgres_conf.sh /root/
COPY ./docker_entrypoint.sh /root/
COPY ./test.py /Python_scripts/
COPY ./postgres_update.py /Python_scripts/

RUN /bin/bash /root/postgres_conf.sh
CMD ["/bin/sh", "/root/docker_entrypoint.sh"]
