# Skill: write-bloc-test

Skill ini digunakan untuk menulis unit test yang solid dan terstruktur untuk BLoC menggunakan paket `bloc_test`.

## <description>
Membuat struktur kode pengujian (unit testing) untuk file BLoC tertentu untuk memastikan logika pergantian State berjalan sempurna berdasarkan Event yang di-*trigger*.

## <instructions>
Ketika pengguna meminta untuk membuat pengujian (test) untuk sebuah BLoC:

1. **Setup File Test**: Buat file di direktori `test/features/[nama_fitur]/bloc/[nama_fitur]_bloc_test.dart`.
2. **Mocking Dependencies**: Gunakan paket `mocktail` atau `mockito` (sesuai proyek) untuk me-mock Repository atau use cases yang digunakan oleh BLoC.
3. **Struktur Pengujian**: 
   - Mulai fungsi `main()`.
   - Lakukan `setUp()` untuk menginisiasi bloc dan mocks.
   - Buat pengujian *initial state* menggunakan `test()`.
4. **Gunakan `blocTest`**: Gunakan paket `bloc_test` untuk menguji alur logika.
   - `build`: Kembalikan instance BLoC yang diuji.
   - `setUp`: Atur respons dari *mock* (misal: `when(() => mockRepo.getData()).thenAnswer(...)`).
   - `act`: Tambahkan (*add*) event ke BLoC.
   - `expect`: Definisikan daftar State yang diharapkan (expected states) dipancarkan secara berurutan.
5. **Komentar**: Jelaskan skenario *success* dan *failure* di setiap blok tes menggunakan **Bahasa Indonesia**.

## <available_resources>
- Aturan di `.agent/rules/flutter_bloc_rules.md` untuk mengetahui pola arsitektur.
