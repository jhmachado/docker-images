FROM node:14.7.0-buster

LABEL maintainer="Jhonatan Machado <jh.machado12@gmail.com>"

COPY ./scripts/entrypoint.sh /
RUN chmod o+x /entrypoint.sh

WORKDIR /app

EXPOSE 5000

ENTRYPOINT ["/entrypoint.sh"]
