#!/bin/bash

# ============================
#  WELCOME BANNER
# ============================
clear
echo -e "\e[93m===============================================\e[0m"
echo -e "\e[93m     SELAMAT DATANG DI TERMUX DOR DORAN        \e[0m"
echo -e "\e[93m              🔥 RISWAN STORE 🔥               \e[0m"
echo -e "\e[93m===============================================\e[0m"
echo ""

# ============================
#  PASSWORD PROTEKSI
# ============================
PASSWORD="Riswan1998"
read -sp "Masukkan Password Install: " userpass
echo ""
if [ "$userpass" != "$PASSWORD" ]; then
    echo -e "\e[91m❌ Password salah! Install dibatalkan.\e[0m"
    exit 1
fi
echo -e "\e[92m✔ Password benar! Melanjutkan install...\e[0m"
sleep 1
clear

# ============================
#  UPDATE & INSTALL DEPENDENSI TERMUX
# ============================
echo -e "\e[96m>>> Memperbarui sistem dan menginstal dependensi...\e[0m"
pkg update -y && pkg upgrade -y
pkg install git python -y

# Upgrade pip & install Python library
pip install --upgrade pip
pip install pillow requests

# ============================
#  CLONE REPO
# ============================
echo -e "\e[96m>>> Mengunduh repo me-cli-sunset...\e[0m"
rm -rf me-cli-sunset
git clone https://github.com/purplemashu/me-cli-sunset || { echo -e "\e[91mGagal clone repo!\e[0m"; exit 1; }

cd me-cli-sunset || { echo -e "\e[91mGagal masuk folder me-cli-sunset!\e[0m"; exit 1; }

# Install requirements
pip install -r requirements.txt

# ============================
#  BUAT FILE .ENV OTOMATIS
# ============================
cat > .env <<EOF
BASE_API_URL="https://api.myxl.xlaxiata.co.id"
BASE_CIAM_URL="https://gede.ciam.xlaxiata.co.id"
BASIC_AUTH="OWZjOTdlZDEtNmEzMC00OGQ1LTk1MTYtNjBjNTNjZTNhMTM1OllEV21GNExKajlYSUt3UW56eTJlMmxiMHRKUWIyOW8z"
AX_FP_KEY="18b4d589826af50241177961590e6693"
UA="myXL / 8.9.0(1202); com.android.vending; (samsung; SM-N935F; SDK 33; Android 13)"
API_KEY="vT8tINqHaOxXbGE7eOWAhA=="
ENCRYPTED_FIELD_KEY="5dccbf08920a5527"

XDATA_KEY="5dccbf08920a5527b99e222789c34bb7"
AX_API_SIG_KEY="18b4d589826af50241177961590e6693"
X_API_BASE_SECRET="mU1Y4n1vBjf3M7tMnRkFU08mVyUJHed8B5En3EAniu1mXLixeuASmBmKnkyzVziOye7rG5nIekMdthensbQMcOJ6SLnrkGyfXALD7mrBC6vuWv6G01pmD3XlU5rT7Tzx"
CIRCLE_MSISDN_KEY="5dccbf08920a5527"
EOF

echo -e "\e[92m✔ File .env berhasil dibuat!\e[0m"

# ============================
#  JALANKAN TOOLS
# ============================
echo -e "\e[96m>>> Menjalankan tools...\e[0m"
sleep 1
python main.py