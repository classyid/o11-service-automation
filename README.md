# 🚀 Tutorial Setup O11 Auto-start di Ubuntu
## Panduan Lengkap untuk Pemula

![O11 Tutorial Banner](banner-placeholder)

## 📋 Daftar Isi
- [Pendahuluan](#pendahuluan)
- [Persiapan Awal](#persiapan-awal)
- [Langkah-langkah Setup](#langkah-langkah-setup)
- [Monitoring dan Maintenance](#monitoring-dan-maintenance)
- [Troubleshooting](#troubleshooting)

## 🎯 Pendahuluan

Tutorial ini akan membantu Anda mengatur O11 streaming server agar bisa auto-start saat sistem reboot. Cocok untuk:
- Administrator sistem
- Pengelola streaming server
- Teknisi IT
- Pemula yang ingin belajar Linux

## ⚙️ Persiapan Awal

### Prerequisites:
- Ubuntu 20.04 LTS atau lebih baru
- Akses root/sudo
- O11 sudah terinstal di `/opt/o11-OTT-v2.2b1/`
- Terminal/SSH access

### Tools yang Dibutuhkan:
```bash
# Install tools yang diperlukan
sudo apt-get update
sudo apt-get install -y mcedit htop iptraf-ng dos2unix
```

## 📝 Langkah-langkah Setup

### 1. Buat Direktori Log
```bash
# Buat direktori untuk log
sudo mkdir -p /var/log/o11

# Set permission direktori
sudo chmod 755 /var/log/o11

# Buat file log
sudo touch /var/log/o11/service.log
sudo touch /var/log/o11/error.log

# Set permission file log
sudo chmod 644 /var/log/o11/service.log
sudo chmod 644 /var/log/o11/error.log
```

### 2. Buat Service File
```bash
# Buat/edit service file
sudo mcedit /etc/systemd/system/o11.service
```

Copy dan paste konfigurasi berikut:
```ini
[Unit]
Description=O11 Streaming Service
After=network.target
Wants=network-online.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/o11-OTT-v2.2b1
ExecStart=/opt/o11-OTT-v2.2b1/o11_v22b1-DRMStuff
Restart=always
RestartSec=3
StartLimitIntervalSec=0
StartLimitBurst=5
RemainAfterExit=yes

# Logging
StandardOutput=append:/var/log/o11/service.log
StandardError=append:/var/log/o11/error.log

[Install]
WantedBy=multi-user.target
Required=network.target
```

### 3. Buat Control Script
```bash
# Buat/edit control script
sudo mcedit /usr/local/bin/o11-control.sh
```

Copy dan paste script berikut:
```bash
#!/bin/bash

# Warna untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Log function
log() {
    echo -e "${2:-$YELLOW}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

# Status check
status_check() {
    if systemctl is-active --quiet o11; then
        log "O11 service is running" "$GREEN"
        systemctl status o11
    else
        log "O11 service is not running" "$RED"
        return 1
    fi
}

# Service setup
setup() {
    log "Setting up O11 service..."
    systemctl daemon-reload
    systemctl enable o11
    log "Service setup completed" "$GREEN"
}

# Start service
start() {
    log "Starting O11 service..."
    systemctl start o11
    sleep 2
    status_check
}

# Stop service
stop() {
    log "Stopping O11 service..."
    systemctl stop o11
    sleep 2
    status_check
}

# Restart service
restart() {
    log "Restarting O11 service..."
    systemctl restart o11
    sleep 2
    status_check
}

# Show logs
logs() {
    log "Service Log:"
    tail -n 50 /var/log/o11/service.log
    echo ""
    log "Error Log:"
    tail -n 50 /var/log/o11/error.log
}

# Main
case "$1" in
    setup)
        setup
        ;;
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status_check
        ;;
    logs)
        logs
        ;;
    *)
        echo "Usage: $0 {setup|start|stop|restart|status|logs}"
        exit 1
        ;;
esac

exit 0
```

### 4. Set Permission dan Fix Format
```bash
# Set execute permission
sudo chmod +x /usr/local/bin/o11-control.sh

# Fix format file (hapus karakter Windows)
sudo dos2unix /usr/local/bin/o11-control.sh
```

### 5. Setup dan Start Service
```bash
# Reload daemon
sudo systemctl daemon-reload

# Setup service
sudo o11-control.sh setup

# Start service
sudo o11-control.sh start
```

## 📊 Monitoring dan Maintenance

### Monitor Resource
```bash
# Monitor CPU dan Memory
htop

# Monitor Network
iptraf-ng

# Cek disk space
df -h
```

### Monitor Service
```bash
# Cek status service
sudo o11-control.sh status

# Lihat log
sudo o11-control.sh logs
```

## ❗ Troubleshooting

### Service Tidak Mau Start
```bash
# 1. Cek status detail
sudo systemctl status o11

# 2. Cek log
tail -f /var/log/o11/error.log

# 3. Coba restart
sudo o11-control.sh restart
```

### Format File Error
```bash
# Jika muncul error "bad interpreter"
sudo dos2unix /usr/local/bin/o11-control.sh
```

### Permission Error
```bash
# Fix permission
sudo chmod +x /usr/local/bin/o11-control.sh
sudo chmod 755 /opt/o11-OTT-v2.2b1/o11_v22b1-DRMStuff
```

## 📚 Command Reference

```bash
# Perintah Dasar
sudo o11-control.sh setup    # Setup awal service
sudo o11-control.sh start    # Start service
sudo o11-control.sh stop     # Stop service
sudo o11-control.sh restart  # Restart service
sudo o11-control.sh status   # Cek status
sudo o11-control.sh logs     # Lihat log
```

## 🔍 Tips dan Best Practices

1. **Monitoring Rutin**
   - Cek status service setiap hari
   - Monitor penggunaan resource
   - Review log secara berkala

2. **Maintenance**
   - Backup konfigurasi secara rutin
   - Bersihkan log lama
   - Update sistem secara berkala

3. **Keamanan**
   - Batasi akses ke file konfigurasi
   - Monitor akses jaringan
   - Review permission secara berkala

## 🤝 Kontribusi
Kontribusi selalu welcome! Silakan buat pull request atau buka issue jika menemukan masalah.

## 📝 Lisensi
MIT License - silakan gunakan dan modifikasi sesuai kebutuhan.

## 📧 Kontak
- Email: [email]
- Telegram: [telegram]
- GitHub: [github]
