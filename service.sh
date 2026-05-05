#!/system/bin/sh
MODDIR=${0%/*}
. "$MODDIR/common/functions.sh"

while [ "$(getprop sys.boot_completed)" != "1" ]; do sleep 5; done
sleep 10

MODE_FILE="/data/adb/ksu_optimizer/mode"
CLOCK_STATE="/data/adb/ksu_optimizer/clock_state"

# Terapkan mode tersimpan
[ -f "$MODE_FILE" ] && mode=$(cat "$MODE_FILE") || mode=balance
"$MODDIR/system/bin/tweaked" mode "$mode" &

# Terapkan lock/cap frekuensi jika ada
if [ -f "$CLOCK_STATE" ]; then
    clock_cmd=$(cat "$CLOCK_STATE")
    "$MODDIR/system/bin/tweaked" "$clock_cmd" &
fi

# Terapkan Network Shield jika aktif
SHIELD_STATE="/data/adb/ksu_optimizer/shield_state"
if [ -f "$SHIELD_STATE" ]; then
    shield_val=$(cat "$SHIELD_STATE")
    if [ "$shield_val" = "1" ]; then
        "$MODDIR/system/bin/network_shield" enable &
    fi
fi

# Web server
BUSYBOX="/data/adb/magisk/busybox"
[ ! -f "$BUSYBOX" ] && BUSYBOX="/system/xbin/busybox"
[ ! -f "$BUSYBOX" ] && BUSYBOX="/system/bin/busybox"
if [ -f "$BUSYBOX" ]; then
    killall busybox httpd 2>/dev/null
    sleep 1
    "$BUSYBOX" httpd -p 8888 -h "$MODDIR/webroot" -c "$MODDIR/webroot/cgi-bin/*" &
fi