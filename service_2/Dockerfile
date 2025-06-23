FROM python:3.13-slim

WORKDIR /app

COPY . .

RUN pip install uv && uv add flask

EXPOSE 8002

CMD [ "uv", "run", "app.py" ]