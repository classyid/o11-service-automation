# Tutorial Instalasi O11 Service Automation

## 📝 Overview
Tutorial ini menjelaskan proses instalasi dan konfigurasi O11 Service Automation pada Ubuntu Server. Berdasarkan logs yang ditampilkan, service berhasil dijalankan di port 1234.

## 🚀 Langkah-langkah Instalasi

### 1. Setup Log Directory
```bash
# Buat direktori log
mkdir -p /var/log/o11
chmod 755 /var/log/o11

# Buat file log
touch /var/log/o11/service.log
touch /var/log/o11/error.log

# Set permission log files
chmod 644 /var/log/o11/service.log
chmod 644 /var/log/o11/error.log
```

### 2. Clone Repository
```bash
cd /opt
git clone https://github.com/classyid/o11-service-automation.git
```

### 3. Setup Service File
```bash
# Copy service file ke systemd
cd o11-service-automation
cp o11.service /etc/systemd/system/
```

### 4. Setup Control Script
```bash
# Copy control script
cp o11-control.sh /usr/local/bin/
chmod +x /usr/local/bin/o11-control.sh
```

### 5. Enable dan Start Service
```bash
# Reload daemon
systemctl daemon-reload

# Setup service
o11-control.sh setup

# Start service
o11-control.sh start
```

## 🔍 Verifikasi Instalasi

### 1. Cek Status Service
```bash
o11-control.sh status
```
Output yang diharapkan:
```
[DATE TIME] O11 service is running
* o11.service - O11 Streaming Service
     Loaded: loaded (/etc/systemd/system/o11.service; enabled; vendor preset: enabled)
     Active: active (running)
```

### 2. Cek Port
```bash
nmap localhost
```
Output yang diharapkan:
```
PORT     STATE SERVICE
1234/tcp open  hotline  # O11 service running
```

## ⚠️ Troubleshooting

### Warning yang Muncul
```
Unknown key name 'Required' in [Install]
```
Solusi: Edit file `/etc/systemd/system/o11.service` dan hapus line:
```ini
Required=network.target
```

### Jika Service Gagal Start
```bash
# Cek logs
tail -f /var/log/o11/error.log

# Restart service
o11-control.sh restart
```

## 📊 Monitoring

### Memory Usage
Berdasarkan log:
- Memory usage: ~20.7MB
- Tasks: 7-8 processes
- CPU usage: minimal

### Perintah Monitoring
```bash
# Cek status real-time
systemctl status o11

# Cek resource usage
htop -p $(pgrep o11)
```

## 🛠️ Maintenance

### Daily Checks
```bash
# Status service
o11-control.sh status

# Cek logs
tail -f /var/log/o11/service.log
tail -f /var/log/o11/error.log
```

### Restart Service
```bash
o11-control.sh restart
```

## 📝 Notes Penting
1. Service akan auto-start saat boot (enabled)
2. Running di port 1234
3. Memory usage stabil di ~21MB
4. Auto-restart aktif jika terjadi crash

## 🔗 Links Berguna
- Repository: https://github.com/classyid/o11-service-automation
- Issues: [GitHub Issues](https://github.com/classyid/o11-service-automation/issues)
- Wiki: [GitHub Wiki](https://github.com/classyid/o11-service-automation/wiki)
