# Python rasmidan foydalanamiz
FROM python:3.12.6-slim 

# Ishchi katalogni belgilaymiz
WORKDIR /app

# Kerakli fayllarni ko'chiramiz
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Boshqa fayllarni ham ko'chiramiz
COPY . .

# Static fayllarni yig'ib qo'yamiz
RUN python manage.py collectstatic --noinput

# Port ochamiz
EXPOSE 8000

# Django serverni ishga tushiramiz
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
