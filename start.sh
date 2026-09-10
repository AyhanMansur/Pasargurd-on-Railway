#!/bin/bash
set -e

# جایگذاری پورت رایلی در فایل کانفیگ Nginx
envsubst '$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

echo "Starting Nginx..."
nginx

echo "Starting PasarGuard Panel..."
# اجرای پنل اصلی (بسته به دستور استارت استاندارد پایتون/Uvicorn)
exec uvicorn main:app --host 0.0.0.0 --port 8000
