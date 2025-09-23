# Imagen base
FROM python:3.12-slim

# Evitar archivos .pyc y forzar flush de logs
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Directorio de trabajo
WORKDIR /app

# Dependencias del sistema para MySQL y compilación
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    libmariadb-dev \
    pkg-config \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements.txt e instalar
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar proyecto
COPY . .

# Exponer puerto de Django
EXPOSE 8000

# Comando por defecto
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
