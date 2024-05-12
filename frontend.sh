echo -e "\e[34mINSTALLING NGINX\e[0m"
dnf install nginx -y

echo -e "\e[34mCOPY EXPENSE CONFIG FILE\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "\e[34mCLEAN OLD CONTENT\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[34mDOWNLOAD FRONTEND CONTENT\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html


echo -e "\e[34m EXTRACT CONTENT\e[0m"
unzip /tmp/frontend.zip

echo -e "\e[34m RESTART SERVICE\e[0m"
systemctl enable nginx
systemctl restart nginx