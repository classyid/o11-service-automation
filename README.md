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
