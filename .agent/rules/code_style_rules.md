# Aturan Gaya Kode (Code Style Rules)

Panduan gaya penulisan kode untuk memastikan konsistensi dan kualitas kode Dart/Flutter di proyek ini.

## 1. Konstanta dan Keabadian (Immutability)
- Gunakan kata kunci `const` untuk konstruktor widget dan variabel sebisa mungkin. Hal ini sangat mengoptimalkan kinerja Flutter.
- Gunakan `final` untuk semua variabel di dalam kelas, terutama pada BLoC, State, dan Model. Jangan gunakan `var` kecuali untuk variabel lokal di dalam fungsi yang akan berubah nilainya.

## 2. Pemformatan Kode
- Selalu tambahkan koma di akhir (trailing commas) pada setiap argumen fungsi, array, atau konstruktor widget yang lebih dari satu baris agar *formatter* Dart bekerja optimal.
- Pastikan tidak ada peringatan (warnings) dari linter (seperti `flutter_lints` atau linter khusus lainnya) di dalam file.

## 3. Tipe Data Secara Eksplisit
- Hindari penggunaan tipe data `dynamic`. Selalu nyatakan tipe data secara eksplisit (seperti `String`, `int`, `List<String>`) untuk menghindari error tak terduga saat runtime.
- Gunakan pengetikan yang kuat pada koleksi (`Map<String, dynamic>`, jangan hanya `Map`).

## 4. UI Clean Code
- Jangan membuat pohon widget yang terlalu dalam (nested) di dalam satu fungsi `build()`.
- Ekstrak widget ke dalam kelas terpisah (kelas `StatelessWidget` baru) daripada memisahkannya ke dalam metode yang mengembalikan `Widget` di kelas yang sama.
