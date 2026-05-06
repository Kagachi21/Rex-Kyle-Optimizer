chmod 755 "$MODPATH/system/bin/tweaked"
chmod 755 "$MODPATH/system/bin/optimizer"
chmod 755 "$MODPATH/system/bin/network_shield"
chmod -R 755 "$MODPATH/webroot/cgi-bin"
[ -f "$MODPATH/action.sh" ] && chmod 755 "$MODPATH/action.sh"

if [ -d "/data/adb/ksu_optimizer" ]; then
    ui_print "- Pengaturan lama ditemukan, melakukan backup dan mempertahankan pengaturan..."
else
    mkdir -p "/data/adb/ksu_optimizer"
    ui_print "- Menginisialisasi pengaturan baru..."
fi