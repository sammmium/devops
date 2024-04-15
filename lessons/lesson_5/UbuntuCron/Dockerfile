FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron

WORKDIR /app

COPY crontest.sh /app/crontest.sh
COPY cronfile /etc/cron.d/cronfile
COPY cron.log /app/cron.log

RUN chmod 0644 /etc/cron.d/cronfile
RUN chmod 0777 /app/cron.log
RUN crontab /etc/cron.d/cronfile

CMD ["cron", "-f"]
