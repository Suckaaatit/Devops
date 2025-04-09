FROM python:3.11-slim
WORKDIR /app
COPY backend/ ./
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY frontend/static ./static
COPY frontend/templates ./templates
EXPOSE 8080
ENV NAME World
CMD ["python", "app.py"]
# Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD ["flask", "run"]
