#!/system/bin/sh
# Script ini akan dijalankan secara otomatis oleh Magisk/KernelSU saat modul dihapus (uninstall)

# Menghapus pengaturan lama agar kembali ke bawaan pabrik (stok) jika diinstall ulang
rm -rf /data/adb/ksu_optimizer

# Reset CPU Governor ke bawaan
for cpu in /sys/devices/system/cpu/cpu[0-9]*; do
    echo "schedutil" > "$cpu/cpufreq/scaling_governor" 2>/dev/null
done
