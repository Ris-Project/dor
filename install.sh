#!/bin/bash

# ============================
#  WELCOME BANNER
# ============================
clear
echo "==============================================="
echo "     SELAMAT DATANG DI TERMUX DOR DORAN        "
echo "              🔥 RISWAN STORE 🔥               "
echo "==============================================="
echo ""

sleep 5

# ============================
#  PASSWORD PROTEKSI
# ============================
PASSWORD="Riswan1998"  # GANTI PASSWORD DI SINI

read -sp "Masukkan Password Install: " userpass
echo ""

if [ "$userpass" != "$PASSWORD" ]; then
    echo ""
    echo "❌ Password salah! Install dibatalkan."
    exit 1
fi

echo ""
echo "✔ Password benar! Melanjutkan install..."
sleep 1
clear

# ============================
#  MULAI PROSES INSTALL
# ============================

echo ">>> AUTO INSTALL me-cli-sunset <<<"
sleep 1

# Update sistem
apt update -y && apt full-upgrade -y

# Install dependensi
apt install -y git python python3-pip python-pillow || pkg install -y git python python-pillow

# Clone repo
rm -rf me-cli-sunset
git clone https://github.com/purplemashu/me-cli-sunset

cd me-cli-sunset || { echo "Gagal masuk folder me-cli-sunset!"; exit 1; }

# Install requirements
pip install -r requirements.txt

# Buat file .env otomatis
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

echo ""
echo "==========================================="
echo "File .env berhasil dibuat & sudah terisi!"
echo "==========================================="
echo ""

echo "Menjalankan tools..."
sleep 1
python main.py