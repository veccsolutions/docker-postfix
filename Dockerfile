FROM debian:10.8

RUN apt update && \
    apt upgrade -y && \
    apt install -y postfix

CMD ["postfix", "start-fg"]