# Skill: generate-model

Skill ini digunakan untuk membuat Data Model di Flutter yang mendukung JSON parsing (Serialisasi/Deserialisasi) dan perbandingan nilai (Equality).

## <description>
Membuat kelas Model Dart dari struktur data tertentu atau JSON, lengkap dengan metode `fromJson`, `toJson`, dan penerapan `Equatable` untuk kemudahan penggunaan bersama arsitektur BLoC.

## <instructions>
Ketika pengguna meminta untuk membuat Model data:

1. **Analisis Data**: Pahami struktur JSON atau atribut yang diberikan oleh pengguna.
2. **Penamaan**: Pastikan nama file menggunakan `snake_case` (misal `user_model.dart`) dan nama kelas menggunakan `PascalCase` (misal `UserModel`).
3. **Ekstensi `Equatable`**: Buat kelas meng-extend `Equatable` agar mudah dibandingkan.
4. **Variabel**: Deklarasikan semua variabel dengan `final` dan tipe data yang aman (hindari dynamic sebisa mungkin).
5. **Konstruktor**: Buat konstruktor konstan (`const`).
6. **Factory dan Method JSON**: 
   - Tulis *factory method* `factory [NamaKelas].fromJson(Map<String, dynamic> json)` 
   - Tulis metode `Map<String, dynamic> toJson()`
   - (Jika proyek menggunakan `json_serializable`, gunakan anotasi `@JsonSerializable()` dan biarkan builder yang membuat logikanya, namun asumsikan parsing manual jika tidak diinstruksikan lain).
7. **Komentar**: Berikan komentar dalam **Bahasa Indonesia** mengenai kegunaan kelas tersebut.

## <available_resources>
- Aturan di `.agent/rules/file_naming_rules.md`
- Aturan di `.agent/rules/code_style_rules.md`
