#!/bin/bash


# Aktualizacja systemu i instalacja nginx
 apt update -y
 apt install -y nginx curl

# Włączenie i uruchomienie usługi nginx
 systemctl enable nginx
 systemctl start nginx
sudo chmod -R 755 /var/www/html

# Podstawowe informacje o instancji 
HOSTNAME=$(hostname)
INTERNAL_IP=$(hostname -I | awk '{print $1}')
EXTERNAL_IP=$(curl -s ifconfig.me || echo "Brak publicznego IP")

#Strona HTML
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Serwer: $HOSTNAME</title>
  <style>
    body { font-family: Arial; background-color: #f7f7f7; text-align: center; padding-top: 5%; }
    h1 { color: #333; }
    table { margin: 0 auto; border-collapse: collapse; background: #fff; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    td, th { padding: 10px 20px; border: 1px solid #ccc; }
    th { background-color: #f0f0f0; }
  </style>
</head>
<body>
  <h1>Grupa 6 - Automated VM Deployment with Startup Scripts </h1>
  <p>Dane tej instancji:</p>
  <table>
    <tr><th>Nazwa hosta</th><td>$HOSTNAME</td></tr>
    <tr><th>Adres wewnętrzny</th><td>$INTERNAL_IP</td></tr>
    <tr><th>Adres zewnętrzny</th><td>$EXTERNAL_IP</td></tr>
  </table>
</body>
</html>
EOF


