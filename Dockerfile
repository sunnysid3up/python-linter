FROM python:3.8-slim

LABEL "maintainer" = "Sunny Kim <sungunkim367@gmail.com>"

RUN pip install black
RUN pip install yapf

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
