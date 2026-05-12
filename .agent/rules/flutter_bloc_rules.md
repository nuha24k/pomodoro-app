# Aturan Pengembangan Flutter dengan BLoC

Aturan ini harus selalu diikuti ketika agen menulis, mengedit, atau merencanakan kode terkait fitur di aplikasi Flutter ini.

## 1. Struktur Folder (Feature-First)
Setiap fitur dalam aplikasi harus dikelompokkan ke dalam direktorinya masing-masing dengan struktur berikut:
```text
lib/
└── features/
    └── [nama_fitur]/
        ├── bloc/
        │   ├── [nama_fitur]_bloc.dart
        │   ├── [nama_fitur]_event.dart
        │   └── [nama_fitur]_state.dart
        ├── models/
        ├── repositories/
        └── views/
            ├── pages/
            └── widgets/
```

## 2. Aturan BLoC
- Wajib menggunakan paket `flutter_bloc` dan `equatable`.
- **State** harus mewarisi (extend) `Equatable` untuk memastikan perbandingan objek yang efisien. Selalu sediakan properti `props`.
- **Event** harus merepresentasikan "apa yang terjadi", misalnya: `LoginButtonPressed`, `DataRequested`. Jangan menamai event dengan nama fungsi seperti `fetchData()`.
- Hindari menaruh logika UI di dalam BLoC. BLoC hanya menerima Event, memproses logika (memanggil repository), lalu memancarkan (emit) State.
- Tangani setidaknya 3 jenis state dasar untuk operasi asinkron: `Initial/Loading`, `Success/Loaded`, dan `Error/Failure`.

## 3. Aturan Kode Dart
- Gunakan kata kunci `final` atau `const` sebisa mungkin.
- Manfaatkan `sealed class` untuk Event dan State agar penanganan di *switch case* menjadi exhaustive (lengkap).
- Pisahkan widget yang besar ke dalam folder `views/widgets/` agar `page` tetap bersih dan mudah dibaca.

## 4. Pengujian (Testing)
- Selalu pertimbangkan untuk membuat pengujian (test) setiap kali selesai membuat BLoC.
- Gunakan pustaka `bloc_test` untuk menguji alur State dalam BLoC.
- Gunakan `mocktail` atau `mockito` untuk memalsukan (mock) respons dari repository.
