# ---- build stage ----
FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- runtime stage ----
FROM python:3.11-slim
WORKDIR /app

RUN addgroup --system appgroup && adduser --system appuser
USER appuser

COPY --from=builder /usr/local/lib/python3.11 /usr/local/lib/python3.11
COPY app.py .

EXPOSE 8080
CMD ["python", "app.py"]
