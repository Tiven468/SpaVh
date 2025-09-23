# Imagen base de Python
FROM python:3.12-slim

# Evitar que Python genere archivos pyc
ENV PYTHONDONTWRITEBYTECODE 1
# Forzar que el output de Python se muestre inmediatamente
ENV PYTHONUNBUFFERED 1

# Crear directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema necesarias para Django y MySQL
RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    build-essential \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*


# Copiar requirements.txt e instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del proyecto
COPY . .

# Exponer puerto de Django
EXPOSE 8000

# Comando por defecto (modo desarrollo)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
