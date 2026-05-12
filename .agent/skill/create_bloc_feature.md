# Skill: create-bloc-feature

Skill ini dirancang untuk mempercepat pembuatan struktur fitur (boilerplate) BLoC yang sesuai dengan standar proyek.

## <description>
Membuat struktur direktori yang lengkap untuk sebuah fitur baru menggunakan arsitektur BLoC di proyek Flutter, termasuk Event, State, Bloc, dan View dasar.

## <instructions>
Ketika pengguna memanggil Anda untuk membuat fitur BLoC baru, ikuti langkah berikut:

1. **Konfirmasi Nama Fitur**: Pastikan Anda memiliki nama fitur yang jelas dalam format `snake_case` (misal: `user_profile`, `login`). Jika belum ada, tanyakan ke pengguna.
2. **Buat Direktori**: Buat struktur direktori di `lib/features/[nama_fitur]/` yang terdiri dari folder `bloc`, `models`, `repositories`, dan `views/pages`, `views/widgets`.
3. **Generate State**: Buat file `lib/features/[nama_fitur]/bloc/[nama_fitur]_state.dart`. Gunakan `sealed class` (Dart 3) dan `Equatable`. Sediakan minimal state: Initial, Loading, Loaded, dan Error.
4. **Generate Event**: Buat file `lib/features/[nama_fitur]/bloc/[nama_fitur]_event.dart`. Gunakan `sealed class` dan `Equatable`. Sediakan event inisialisasi minimal.
5. **Generate Bloc**: Buat file `lib/features/[nama_fitur]/bloc/[nama_fitur]_bloc.dart`. Hubungkan State dan Event.
6. **Generate UI**: Buat file `lib/features/[nama_fitur]/views/pages/[nama_fitur]_page.dart`. Gunakan `StatelessWidget` dan bungkus dengan `BlocProvider` serta `BlocBuilder` untuk menangani state yang dibuat di atas.
7. **Komentar**: Berikan komentar penjelasan pada setiap kelas yang di-generate menggunakan **Bahasa Indonesia**.

## <available_resources>
- Baca aturan dari: `.agent/rules/flutter_bloc_rules.md` untuk standar struktur dan koding.
