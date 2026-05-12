# Aturan Penamaan File dan Direktori (Naming Conventions)

Proyek ini sangat ketat dalam hal penamaan file, direktori, kelas, dan variabel.

## 1. File dan Direktori
- Selalu gunakan `snake_case` (huruf kecil dengan garis bawah).
- Contoh benar: `user_profile_page.dart`, `login_bloc.dart`, `app_colors.dart`.
- Contoh salah: `UserProfilePage.dart`, `loginBloc.dart`.
- Direktori juga menggunakan `snake_case` (misal: `home_screen/`).

## 2. Kelas, Enum, dan Typedef
- Selalu gunakan `PascalCase` (Kapasitas Huruf Awal).
- Contoh: `UserProfilePage`, `LoginBloc`, `UserRole`.

## 3. Variabel dan Fungsi
- Selalu gunakan `camelCase` (huruf kecil diawal, diikuti kapital untuk kata berikutnya).
- Contoh: `userName`, `fetchUserData()`, `isLoading`.

## 4. Sufiks File BLoC (Suffixes)
- File Bloc: `[nama]_bloc.dart` -> Kelas: `[Nama]Bloc`
- File Event: `[nama]_event.dart` -> Kelas: `[Nama]Event`
- File State: `[nama]_state.dart` -> Kelas: `[Nama]State`
- Halaman UI: `[nama]_page.dart` -> Kelas: `[Nama]Page`
- Komponen Kecil/Widget: `[nama]_widget.dart` -> Kelas: `[Nama]Widget`
