FROM python:3.12-slim

# Ustaw zmienną środowiskową aby Python nie buforował stdout/stderr
ENV PYTHONUNBUFFERED=1

# Ustaw katalog roboczy
WORKDIR /app

# Skopiuj plik z zależnościami i zainstaluj je
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj całą aplikację
COPY . .

# Domyślny port Fly.io to 8080 — Flask musi nasłuchiwać na nim
ENV PORT=8080

# Uruchom aplikację przez gunicorn (lub Flask jeśli wolisz)
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
