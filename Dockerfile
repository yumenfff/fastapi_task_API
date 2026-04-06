FROM python:3.14-slim

COPY . .

RUN uv add -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
