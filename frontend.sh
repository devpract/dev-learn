echo -e "\e[31mINSTALLING NGINX\e[0m"
dnf install nginx -y
echo exit status- $?

echo -e "\e[31mCOPY EXPENSE CONFIG FILE\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf
echo exit status- $?

echo -e "\e[31mCLEAN OLD CONTENT\e[0m"
rm -rf /usr/share/nginx/html/*
echo exit status- $?

echo -e "\e[31mDOWNLOAD FRONTEND CONTENT\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
echo exit status- $?
cd /usr/share/nginx/html


echo -e "\e[31mEXTRACT CONTENT\e[0m"
unzip /tmp/frontend.zip
echo exit status- $?

echo -e "\e[31mRESTART SERVICE\e[0m"
systemctl enable nginx
systemctl restart nginx
echo exit status- $?

