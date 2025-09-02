# COVID Dashboard App

Aplikasi pelacakan data COVID yang terdiri dari backend (Node.js), frontend (React.js), dan database (MySQL).

---

## 🔧 Tools & Framework

- **Backend**: Node.js  
- **Frontend**: React.js  
- **Database**: MySQL

---

## 🧭 Alur Aplikasi

1. Scheduler melakukan fetch data ke API COVID.
2. Data disimpan ke dalam database.
3. Backend menyediakan API untuk:
   - List region
   - Total kasus
   - Timeline
   - Potensi penyebaran
4. Frontend mengonsumsi API untuk menampilkan data ke pengguna.

---

## 🔄 Sync Data

Sync data dilakukan secara otomatis oleh scheduler sesuai jadwal yang ditentukan setiap hari.

### Struktur Tabel:
- `regions` — menyimpan daftar wilayah.
- `covid_daily_stats` — menyimpan statistik harian COVID per region.
![DB digram](./assets/db-diagram.png)
---

## ⚠️ Masalah / Tantangan & Solusi

- **Masalah**: Terjadi error `connect ETIMEDOUT 68.183.253.139:443` saat mengakses API COVID, terutama ketika melakukan request per region.
- **Solusi**: Mengatasi dengan membatasi jumlah request (menggunakan limit atau batching) agar tidak melebihi batas koneksi.

---

## 🚀 Getting Started

```bash
# Setup environment
cp .env.example .env

# Pilih versi Node.js
nvm use 16.16.0

# Install dependencies
npm install

# Jalankan server dengan hot reload di localhost:8080
npm run dev

## 🚀 Docker Run
docker build --no-cache --platform=linux/amd64 -t covid-dashboard-service:v1.0.0 .
docker run -d -p 9000:9000 --name covid-dashboard-service covid-dashboard-service:v1.0.0