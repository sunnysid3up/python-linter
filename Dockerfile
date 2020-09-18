FROM python:3.8-slim

LABEL "maintainer" = "Sunny Kim <sungunkim367@gmail.com>"

COPY requirements.txt /
RUN pip install -r /requirements.txt
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]