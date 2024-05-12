dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
cp backend.service /etc/systemd/system/backend.service
useradd expense
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
cd /app
unzip /tmp/backend.zip
cd /app
npm install

dnf install mysql -y
mysql -h 172.31.44.40 -uroot -pExpenseApp@1 < /app/schema/backend.sql

systemctl daemon-reload
systemctl enable backend
systemctl start backend
systemctl restart backend