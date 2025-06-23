FROM python:3.13-slim

WORKDIR /app

COPY . .

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN pip install uv && uv add flask

EXPOSE 8002

CMD ["uv", "run", "app.py", "--host", "0.0.0.0", "--port", "8002"]