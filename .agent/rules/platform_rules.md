# Aturan Spesifik Platform (iOS & Android)

Aplikasi Podomoro App menargetkan perangkat iOS dan Android, sehingga diperlukan perhatian pada adaptasi dan konfigurasi spesifik masing-masing platform.

## 1. Adaptasi UI (Platform-Aware UI)
- Jika diperlukan, gunakan pengecekan `Platform.isIOS` atau `Platform.isAndroid` untuk menampilkan komponen yang lebih alami (native-feeling).
- Pertimbangkan penggunaan Widget adaptif jika diperlukan (misal dialog atau switch), tetapi secara default gunakan Material Design karena biasanya lebih mudah disesuaikan untuk konsistensi di kedua platform.
- Hindari memaksakan Cupertino style (gaya iOS) di Android.

## 2. Konfigurasi Android
- Perubahan terkait *permissions* harus selalu ditulis di `android/app/src/main/AndroidManifest.xml`.
- Jika menambahkan paket yang membutuhkan dukungan `minSdkVersion`, perbarui di `android/app/build.gradle`.

## 3. Konfigurasi iOS
- Perubahan terkait *permissions* wajib ditambahkan di `ios/Runner/Info.plist` beserta deskripsi alasan mengapa izin tersebut dibutuhkan (misalnya untuk kamera, lokasi).
- Jika ada masalah instalasi pustaka, ingatlah untuk menjalankan `pod install` di dalam direktori `ios/`.
