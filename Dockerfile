FROM python:3.8-slim

LABEL "maintainer" = "Sunny Kim <sungunkim367@gmail.com>"


# Django
RUN pip install django pylint-django mypy black isort pylint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]