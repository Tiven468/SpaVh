#!/bin/bash

# Ejecuta migraciones automáticamente (opcional)
python manage.py migrate

# Inicia el servidor de Django
python manage.py runserver 0.0.0.0:8000
