# O11 Service Manager

## 📑 Deskripsi
O11 Service Manager adalah tool otomatisasi untuk mengelola layanan streaming O11 di sistem Linux. Tool ini memudahkan administrator sistem dalam mengelola, memantau, dan mengotomatisasi layanan O11 streaming.

## ✨ Fitur Utama
- 🚀 Auto-start saat sistem boot
- 📊 Monitoring layanan real-time
- 📝 Manajemen log otomatis
- 🔄 Auto-restart saat terjadi kegagalan
- 🎯 Kontrol layanan yang mudah
- 📱 Notifikasi status layanan

## 🔧 Persyaratan Sistem
- Ubuntu 20.04 LTS atau lebih baru
- Systemd
- O11 Streaming Server
- Bash shell
- Root/sudo access

## 📦 Instalasi
```bash
# Clone repository
git clone https://github.com/classyid/o11-service-automation.git

# Masuk ke direktori
cd o11-service-automation

## 🛠️ Tutorial Linux untuk O11

### 1. Instalasi O11
```bash
# 1. Masuk ke direktori
cd /opt/o11-OTT-v2.2b1

# 2. Jalankan O11
./o11_v22b1-DRMStuff
```

### 2. Setup Auto-start
```bash
# Buat service systemd
sudo nano /etc/systemd/system/o11.service
```

Isi dengan:
```ini
[Unit]
Description=O11 Streaming Service
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/o11-OTT-v2.2b1
ExecStart=/opt/o11-OTT-v2.2b1/o11_v22b1-DRMStuff
Restart=always

[Install]
WantedBy=multi-user.target
```

### 3. Kontrol O11
```bash
# Start O11
sudo systemctl start o11

# Stop O11
sudo systemctl stop o11

# Restart O11
sudo systemctl restart o11

# Cek status
sudo systemctl status o11
```

## 🔧 Tips & Tricks

1. **Performance**
   ```bash
   # Monitor resource usage
   top -p $(pgrep o11)
   
   # Check logs
   tail -f /var/log/o11/service.log
   ```

2. **Maintenance**
   ```bash
   # Cleanup logs
   find /var/log/o11/ -name "*.log" -mtime +30 -delete
   
   # Backup config
   cp /etc/systemd/system/o11.service /backup/
   ```

3. **Troubleshooting**
   ```bash
   # Debug mode
   ./o11_v22b1-DRMStuff -debug
   
   # Check ports
   netstat -tulpn | grep o11
   ```

## 📚 Quick Reference

```bash
# Basic Commands
start    : sudo systemctl start o11
stop     : sudo systemctl stop o11
restart  : sudo systemctl restart o11
status   : sudo systemctl status o11
logs     : journalctl -u o11 -f
```

## 📁 Struktur File
```
/etc/systemd/system/o11.service    # Service configuration
/usr/local/bin/o11-control.sh      # Control script
/var/log/o11/                      # Log directory
├── service.log                    # Service logs
└── error.log                      # Error logs
```

## 🔍 Monitoring
Service akan otomatis:
- Start saat sistem boot
- Restart jika terjadi kegagalan
- Mencatat semua aktivitas di log
- Memberikan notifikasi saat terjadi masalah

## 🛠️ Troubleshooting

### Service Gagal Start
```bash
# Cek detail error
sudo journalctl -u o11 -f

# Cek log spesifik
tail -f /var/log/o11/error.log
```

### Reset Service
```bash
sudo o11-control.sh restart
```

## 🤝 Kontribusi
Kontribusi selalu welcome! Silakan baca [CONTRIBUTING.md](CONTRIBUTING.md)

## 📝 Lisensi
Project ini dilisensikan di bawah [MIT License](LICENSE)

## 🌟 Dukungan
Jika project ini membantu, berikan ⭐️ di GitHub!
