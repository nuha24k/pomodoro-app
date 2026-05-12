# Aturan Inti (Core Architecture Rules)

Aturan ini mendefinisikan struktur arsitektur inti dari proyek Podomoro App yang berada di luar fitur-fitur spesifik.

## 1. Struktur Folder `lib/core/`
Semua kode yang dibagikan dan digunakan di berbagai fitur harus ditempatkan di dalam `lib/core/`.
Strukturnya meliputi:
- `core/network/`: Konfigurasi Dio/HTTP, interceptors, dan penanganan koneksi.
- `core/errors/`: Kelas untuk Exception dan Failure (untuk penanganan error yang konsisten).
- `core/theme/`: Definisi warna, tipografi, dan tema aplikasi secara keseluruhan.
- `core/utils/`: Fungsi-fungsi bantuan (helpers), ekstensi, dan konstanta global.
- `core/widgets/`: Widget UI yang dapat digunakan kembali (reusable) di berbagai halaman (seperti tombol kustom, dialog, dll).

## 2. Manajemen Dependensi (Dependency Injection)
- Gunakan pendekatan yang terpusat untuk mendaftarkan dependensi (misal menggunakan paket `get_it` atau mendaftarkan provider di root aplikasi dengan `MultiRepositoryProvider` dan `MultiBlocProvider`).
- Repository hanya boleh diakses melalui antarmuka (interface) atau abstract class jika memungkinkan, agar mudah diuji (mocking).

## 3. Penanganan Kesalahan (Error Handling)
- Jangan melempar (throw) Exception langsung ke lapisan UI.
- Tangkap exception di layer Repository, ubah menjadi objek `Failure` (atau hasil sejenis), lalu kembalikan menggunakan paket seperti `fpdart` atau `dartz` (pendekatan fungsional `Either<Failure, T>`), atau kembalikan model respon kustom.
