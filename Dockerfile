  
FROM python:3.8-slim

LABEL "maintainer" = "Sunny Kim <sungunkim367@gmail.com>"

RUN pip install pylint

# Django
RUN pip install pylint-django

RUN pip install black
RUN pip install mypy
RUN pip install isort

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]