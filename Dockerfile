FROM python:3.8
LABEL version="1.0.0.0"

ENV PYTHONDONTWRITEBYTECODE 1
ENV FLASK_APP "src/run.py"
ENV FLASK_ENV "development"
ENV FLASK_DEBUG True


RUN mkdir /app
WORKDIR /app


COPY Pip* /app/

RUN pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install --dev --system --deploy --ignore-pipfile


ADD . /app
EXPOSE 5000

CMD ["flask", "run"]