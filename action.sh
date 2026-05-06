#!/system/bin/sh
# Script aksi untuk memunculkan WebUI atau memberikan instruksi

MODDIR=${0%/*}

# Buka WebUI di browser default (localhost:8888)
am start -a android.intent.action.VIEW -d "http://127.0.0.1:8888" >/dev/null 2>&1

echo "Membuka WebUI di Browser..."
echo "Jika tidak terbuka, buka browser secara manual ke: http://127.0.0.1:8888"
sleep 2
