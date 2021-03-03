FROM debian:10.8-slim

RUN apt update && \
    apt upgrade -y && \
    apt remove -y python3 && \
    apt autoremove -y && \
    apt install -y postfix

RUN mkdir /config && \
    mv /etc/postfix/main.cf /config/main.cf && \
    mv /etc/postfix/master.cf /config/master.cf && \
    ln -s /config/main.cf /etc/postfix/main.cf && \
    ln -s /config/master.cf /etc/postfix/master.cf

CMD ["postfix", "start-fg"]