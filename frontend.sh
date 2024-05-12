dnf install nginx -y


cp expense.conf /etc/nginx/default.d/expense.conf


rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

systemctl enable nginx
systemctl start nginx
systemctl restart nginx