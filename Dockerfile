FROM python:3.8-slim-buster 

LABEL mantainer="Deyvisson Eduardo deyvissoneduardo22@gmail.com"

WORKDIR /app

RUN python3 -m pip install --upgrade pip 

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY . /app/

EXPOSE 8080

CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:8080", "app:app"]