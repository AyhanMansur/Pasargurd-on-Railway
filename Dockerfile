FROM python:3.10-slim

# نصب وابستگی‌های سیستمی و Nginx
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libpq-dev \
    nginx \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# کلون کردن مخزن رسمی پاسارگارد
RUN git clone https://github.com/PasarGuard/panel.git .

# نصب پکیج‌های پایتون
RUN pip install --no-cache-dir -r requirements.txt

# کپی کردن کانفیگ Nginx و اسکریپت راه‌اندازی
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# پورت پیش‌فرض رایلی
ENV PORT=3000

CMD ["/app/start.sh"]
