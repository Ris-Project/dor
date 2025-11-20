#!/bin/bash

# ============================
#  WELCOME BANNER (GOLD)
# ============================
clear
echo -e "\e[93m===============================================\e[0m"
echo -e "\e[93m     SELAMAT DATANG DI TERMUX DOR DORAN        \e[0m"
echo -e "\e[93m              🔥 RISWAN STORE 🔥               \e[0m"
echo -e "\e[93m===============================================\e[0m"
echo ""
sleep 2

# ============================
#  NOTE SEBELUM INSTALL
# ============================
echo -e "\e[93m===============================================\e[0m"
echo -e "\e[93mNOTE: Sebelum melanjutkan install, Anda harus download\e[0m"
echo -e "\e[93mfile ini terlebih dahulu kemudian ekstrak:\e[0m"
echo -e "\e[93mLink Download: \e[92mhttps://sfile.mobi/VhsrFBGRmHY\e[0m"
echo -e "\e[93m===============================================\e[0m"
echo ""
read -p "Tekan ENTER untuk melanjutkan install..." temp

clear
echo ">>> AUTO INSTALL DOR DORAN <<<"
sleep 1

# ============================
#  UPDATE & INSTALL DEPENDENSI
# ============================
apt update -y && apt full-upgrade -y
apt install -y git python python3-pip python-pillow || pkg install -y git python python-pillow

# ============================
#  CLONE REPO
# ============================
rm -rf me-cli-sunset
git clone https://github.com/purplemashu/me-cli-sunset

cd me-cli-sunset || { echo "Gagal masuk folder me-cli-sunset!"; exit 1; }

# ============================
#  INSTALL PYTHON REQUIREMENTS
# ============================
pip install -r requirements.txt

# ============================
#  BUAT FILE .env OTOMATIS
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

echo ""
echo "==========================================="
echo "File .env berhasil dibuat & sudah terisi!"
echo "==========================================="
echo ""

echo "Menjalankan tools..."
sleep 1
python main.py