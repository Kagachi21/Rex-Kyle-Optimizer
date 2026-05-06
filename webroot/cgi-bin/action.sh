#!/system/bin/sh
echo "Content-type: text/plain"
echo ""

MODE_FILE="/data/adb/ksu_optimizer/mode"
TWEAKED="/system/bin/tweaked"
SHIELD="/system/bin/network_shield"

[ ! -x "$TWEAKED" ] && TWEAKED="/data/adb/modules/rex_andromalius/system/bin/tweaked"
[ ! -x "$SHIELD" ] && SHIELD="/data/adb/modules/rex_andromalius/system/bin/network_shield"

# Fallback in case ID was changed back
[ ! -x "$TWEAKED" ] && TWEAKED="/data/adb/modules/rk_Optimizer/system/bin/tweaked"
[ ! -x "$SHIELD" ] && SHIELD="/data/adb/modules/rk_Optimizer/system/bin/network_shield"
[ ! -x "$TWEAKED" ] && TWEAKED="/data/adb/modules/ksu_optimizer/system/bin/tweaked"
[ ! -x "$SHIELD" ] && SHIELD="/data/adb/modules/ksu_optimizer/system/bin/network_shield"

QUERY_STRING="$1"
if [ -z "$QUERY_STRING" ]; then
    QUERY_STRING="$2"
fi

if echo "$QUERY_STRING" | grep -q "get=1"; then
    if [ -f "$MODE_FILE" ]; then
        cat "$MODE_FILE"
    else
        echo "balance"
    fi
    exit 0
fi

cmd=$(echo "$QUERY_STRING" | sed -n 's/.*cmd=\([^&]*\).*/\1/p')
value=$(echo "$QUERY_STRING" | sed -n 's/.*value=\([^&]*\).*/\1/p')

if [ -n "$cmd" ]; then
    case "$cmd" in
        mode)
            "$TWEAKED" mode "$value" 2>&1
            ;;
        info) "$TWEAKED" info 2>&1;;
        adv_info) "$TWEAKED" adv_info 2>&1;;
        oc) 
            echo "oc" > /data/adb/ksu_optimizer/clock_state
            "$TWEAKED" oc 2>&1
            ;;
        uv) 
            echo "uv" > /data/adb/ksu_optimizer/clock_state
            "$TWEAKED" uv 2>&1
            ;;
        reset) 
            rm -f /data/adb/ksu_optimizer/clock_state
            "$TWEAKED" reset 2>&1
            ;;
        set_cpu_gov)
            "$TWEAKED" set_cpu_gov "$value" 2>&1
            ;;
        set_gpu_gov)
            "$TWEAKED" set_gpu_gov "$value" 2>&1
            ;;
        set_cpu_freq)
            min=$(echo "$QUERY_STRING" | sed -n 's/.*min=\([^&]*\).*/\1/p' | sed 's/&.*//')
            max=$(echo "$QUERY_STRING" | sed -n 's/.*max=\([^&]*\).*/\1/p' | sed 's/&.*//')
            echo "set_cpu_freq $min $max" > /data/adb/ksu_optimizer/clock_state
            "$TWEAKED" set_cpu_freq "$min" "$max" 2>&1
            ;;
        set_gpu_freq)
            min=$(echo "$QUERY_STRING" | sed -n 's/.*min=\([^&]*\).*/\1/p' | sed 's/&.*//')
            max=$(echo "$QUERY_STRING" | sed -n 's/.*max=\([^&]*\).*/\1/p' | sed 's/&.*//')
            echo "set_gpu_freq $min $max" > /data/adb/ksu_optimizer/clock_state
            "$TWEAKED" set_gpu_freq "$min" "$max" 2>&1
            ;;
        shield_enable)
            "$SHIELD" enable 2>&1
            ;;
        shield_disable)
            "$SHIELD" disable 2>&1
            ;;
        shield_status)
            "$SHIELD" status
            ;;
        *) echo "Perintah tidak dikenal";;
    esac
    exit 0
fi

echo "Invalid request"