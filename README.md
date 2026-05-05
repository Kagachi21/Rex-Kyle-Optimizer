# KSU Optimizer Pro & Network Shield 🚀🛡️

KSU Optimizer Pro adalah modul KernelSU/Magisk tingkat lanjut yang dirancang khusus untuk memaksimalkan performa Android, menghemat baterai secara ekstrem, sekaligus melindungi perangkat Anda dari Iklan dan *Malware* langsung dari level Kernel.

Modul ini sepenuhnya menggunakan *Native Shell Script* sehingga sangat ringan, instan, dan mendukung semua jenis *Stock Kernel* maupun *Custom Kernel* tanpa perlu kompilasi ulang kode C/C++.

## ✨ Fitur Utama

### 1. 🎛️ Clock Speed Controller (OC/UV)
Tidak seperti modul lain yang mencoba memanipulasi *voltage table* (yang sering gagal di Stock Kernel), modul ini menggunakan teknik penguncian (*Lock/Cap*) frekuensi sysfs perangkat keras:
- **Force High Clock (OC Mode)**: Mengunci CPU dan GPU ke frekuensi maksimal yang didukung oleh perangkat. Menjamin performa rata kanan tanpa limitasi (anti-*throttling*) untuk *gaming* dan *multitasking* berat.
- **Limit Low Clock (UV/Power Save)**: Melimitasi batas atas frekuensi CPU/GPU ke tingkat terendah yang fungsional. Sangat efektif untuk mendinginkan suhu ekstrem dan menghemat baterai saat ponsel sedang dalam penggunaan ringan atau siaga.

### 2. 🛡️ Network Shield (DNS Interception)
Modul ini dilengkapi dengan pelindung internet tingkat kernel (*Kernel-level internet protection*) berbasis `iptables`.
- Secara instan membelokkan lalu lintas port 53 (DNS) ke **AdGuard DNS**.
- Memblokir *Ads*, *Trackers*, dan *Malware* secara efisien tanpa harus menggunakan file `hosts` raksasa yang memakan RAM/Storage.
- Ringan di sistem dan mendukung pengalihan secara dinamis tanpa perlu *reboot*.

### 3. 🎨 Premium Web UI
Tidak perlu menggunakan terminal emulator yang membosankan. KSU Optimizer Pro menyertakan Antarmuka Pengguna berbasis Web yang dapat diakses langsung.
- Desain *Glassmorphism* modern dengan *Dark Mode* eksklusif yang sangat memanjakan mata.
- **Sangat Ringan**: Dibangun menggunakan 100% Native HTML & CSS tanpa dependensi *framework* eksternal.
- **Satu Ketukan**: Ubah *CPU governor*, *Force OC*, aktifkan *UV*, atau hidupkan *Network Shield* hanya dengan satu ketukan (Toggle iOS-style).

---

## ⚙️ Persyaratan
- Perangkat Android yang sudah di-*root* menggunakan **KernelSU** atau **Magisk**.
- Versi Android 9.0 (Pie) ke atas.

## 🚀 Instalasi & Cara Penggunaan

1. Buka halaman [Releases](../../releases) dan unduh file ZIP terbaru (misal: `KSU_Optimizer_Pro_v1.0.zip`).
2. Buka aplikasi **KernelSU** atau **Magisk Manager**.
3. Buka tab **Modules** ➜ ketuk **Install from storage**.
4. Pilih file `.zip` yang telah diunduh, tunggu proses instalasi selesai.
5. Lakukan **Reboot** pada perangkat Anda.

### Mengakses Kontrol Panel (Web UI)
Setelah perangkat menyala ulang, Web UI *Optimizer* dapat langsung diakses melalui aplikasi *browser* favorit Anda (Chrome, Firefox, Brave, dll):
1. Buka aplikasi *Browser*.
2. Kunjungi alamat lokal berikut: **`http://127.0.0.1:8888`**
3. Anda kini memiliki kontrol penuh atas performa dan keamanan perangkat Anda!

## 🔧 Konfigurasi Lanjutan
Seluruh konfigurasi Anda secara otomatis disimpan secara aman (*survive reboot*) di memori lokal:
- `/data/adb/ksu_optimizer/mode` (Profil Governor)
- `/data/adb/ksu_optimizer/clock_state` (Status High/Low Clock)
- `/data/adb/ksu_optimizer/shield_state` (Status aktif/matinya Network Shield)

Jika Anda ingin melakukan eksekusi perintah manual atau integrasi via skrip lain melalui Terminal (contoh Termux/Tasker):
```bash
su
/data/adb/modules/ksu_optimizer/system/bin/tweaked oc        # Menyalakan OC
/data/adb/modules/ksu_optimizer/system/bin/tweaked uv        # Menyalakan UV
/data/adb/modules/ksu_optimizer/system/bin/network_shield enable  # Menghidupkan Shield
```

## 📝 Lisensi
Proyek ini dilisensikan di bawah **MIT License**. Silakan lihat file `LICENSE` untuk detail ketentuan lisensi. Bebas untuk dimodifikasi dan didistribusikan ulang.
