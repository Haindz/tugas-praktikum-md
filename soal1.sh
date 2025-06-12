#!/bin/bash

echo "Memulai pengecekan service SSH setiap 10 detik..."
echo "Tekan CTRL + C untuk menghentikan script ini."

while true; do
    STATUS=$(systemctl is-active ssh)

    if [ "$STATUS" != "active" ]; then
        echo "[$(date)] Service SSH TIDAK AKTIF!"
        notify-send "⚠️SH Service Mati!" "Service SSH mati pada $(date)"
    else
        echo "[$(date)] SSH AKTIF"
    fi

    sleep 10
done
