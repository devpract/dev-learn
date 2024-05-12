echo INSTALLING NGINX
dnf install nginx -y

echo COPY EXPENSE CONFIG FILE
cp expense.conf /etc/nginx/default.d/expense.conf

echo CLEAN OLD CONTENT
rm -rf /usr/share/nginx/html/*

echo DOWNLOAD FRONTEND CONTENT
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html


echo EXTRACT CONTENT
unzip /tmp/frontend.zip

echo RESTART SERVICE
systemctl enable nginx
systemctl restart nginx