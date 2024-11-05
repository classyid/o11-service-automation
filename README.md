# O11 Service Manager

![O11 Service Manager](banner.png)

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

# Jalankan installer
sudo ./install.sh
```

## 🚀 Cara Penggunaan

### Setup Awal
```bash
# Setup service
sudo o11-control.sh setup
```

### Kontrol Layanan
```bash
# Start service
sudo o11-control.sh start

# Stop service
sudo o11-control.sh stop

# Restart service
sudo o11-control.sh restart

# Cek status
sudo o11-control.sh status

# Lihat log
sudo o11-control.sh logs
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

# 📺 Panduan O11 Streaming & Tutorial Linux
## Edisi 2024

![O11 Banner](image-placeholder)

## 🎯 Apa itu O11?
O11 adalah software streaming server yang powerful untuk:
- Mengubah siaran LIVE menjadi format yang lebih friendly (HLS)
- Mengelola siaran VOD (Video on Demand)
- Mendukung berbagai format input seperti DASH, HLS, dan Microsoft Smooth Streaming

Bayangkan O11 seperti "penerjemah universal" untuk konten streaming. Dia bisa mengambil berbagai format video streaming dan mengubahnya menjadi format yang mudah diputar di berbagai perangkat.

## 💡 Apa itu DASH?
DASH (Dynamic Adaptive Streaming over HTTP) adalah teknologi streaming modern yang:
- Menyesuaikan kualitas video secara otomatis berdasarkan koneksi internet
- Seperti YouTube yang bisa otomatis ubah kualitas 144p-4K
- Hemat bandwidth dan lancar diputar

Analoginya seperti air yang mengalir:
- Pipa besar (koneksi cepat) = air mengalir deras (kualitas tinggi)
- Pipa kecil (koneksi lambat) = air mengalir pelan (kualitas lebih rendah)

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

## 📊 Fitur Utama O11

### 1. Provider Management
- Kelola multiple provider
- Custom logo per provider
- Konfigurasi jaringan terpisah

### 2. Stream Control
- Start/Stop stream
- Monitor status
- Auto-restart jika error
- Log management

### 3. Format Support
```plaintext
Input:
✓ DASH
✓ HLS
✓ Microsoft Smooth

Output:
✓ HLS
✓ Direct HTTP
✓ Multi-TS
```

## 💪 Keunggulan O11

1. **Mudah Digunakan**
   - Interface web friendly
   - Kontrol via command line
   - Auto-configuration

2. **Powerful**
   - Multi-provider support
   - Format converter
   - DRM support
   - Monitoring tools

3. **Reliable**
   - Auto-restart
   - Error handling
   - Log rotation
   - Health check

## 🎯 Use Cases

1. **Streaming Provider**
   - Distribusi konten live
   - VOD service
   - Multi-channel broadcasting

2. **Corporate**
   - Internal streaming
   - Event broadcast
   - Training materials

3. **Education**
   - E-learning platform
   - Live lecture
   - Recorded sessions

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

## 🎓 Kesimpulan
O11 adalah solusi streaming yang powerful dan fleksibel. Dengan dokumentasi ini, Anda bisa:
- Setup O11 dengan mudah
- Mengelola streaming secara efisien
- Troubleshoot masalah umum
- Optimalkan performa sistem

## 🔗 Link Berguna
- [O11 Official Documentation](#)
- [Community Forum](#)
- [Video Tutorials](#)
- [GitHub Repository](#)

## 🤝 Need Help?
- Join Telegram Group: @O11Community
- Email Support: support@o11.example.com
- GitHub Issues: [Link]

Remember: "Streaming lancar, hidup tentram! 🎬"
