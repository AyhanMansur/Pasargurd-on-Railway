FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libpq-dev \
    nginx \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/PasarGuard/panel.git .

# نصب پکیج‌های پیش‌فرض مورد نیاز (در صورت عدم وجود requirements.txt)
RUN pip install --no-cache-dir fastapi uvicorn gunicorn requests

EXPOSE 80

CMD ["bash"]
