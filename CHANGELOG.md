# Changelog

Semua pembaruan pada Rex Kyle Optimizer Pro akan dicatat di file ini.

## [v1.2] - "Rex Andromalius" Update
### Ditambahkan
- **Advanced Tuning Web UI**: Menambahkan dukungan pengaturan frekuensi Minimum/Maksimum CPU & GPU secara manual langsung dari Web UI.
- **Governor Selector**: Kini Anda dapat melihat *Governor* CPU & GPU yang sedang aktif dan mengubahnya secara manual dari Web UI.
- **AOSP GPU Support**: Menambahkan deteksi *dynamic path* untuk GPU (termasuk Mali dan node gpufreq generik), membuat modul ini kini sepenuhnya kompatibel dengan Custom ROM AOSP, tidak lagi hanya terbatas pada *Stock Kernel* Snapdragon.
- **Action Button Fallback**: Menambahkan script `action.sh` di *root* modul sebagai jalur alternatif untuk membuka Web UI melalui *browser* apabila Web UI bawaan KernelSU gagal dimuat.
- **Auto Backup Settings**: Fitur deteksi penyimpanan lokal di `/data/adb/ksu_optimizer`. Pengaturan Web UI Anda kini aman dan tidak akan hilang saat melakukan *update* ke versi terbaru.
- **Clean Uninstall**: Modul ini sekarang memiliki `uninstall.sh`. Jika modul dihapus, seluruh konfigurasi akan dibersihkan dan perangkat akan otomatis kembali ke *stock clock* & *governor* bawaan pabrik.

## [v1.0] - Initial Release
- Rilis awal Rex Kyle Optimizer Pro dengan fitur *Clock Speed Controller* (OC/UV) dan *Network Shield*.
- Web UI *Dashboard* pertama dengan profil *Performance*, *Balance*, dan *Power Save*.
