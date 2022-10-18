# (28) UI Testing
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## UI Testing
> **UI Testing** merupakan Pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna. 

> **UI Testing** disebut juga widget testing sehingga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis. 

## Keuntungan 
- Memastikan seluruh widget memberi tampilan yang sesuai
- Memastikan seluruh interaksi dapat diterima dengan baik
- Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

## Melakukan UI Testing
1. **Instalasi Package Testing**
    Pada umumnya, package testing sudah ter-install sejak project pertama kali dibuat. Tetapi, cara ini dapat dilakukan jika ingin meng-install secara manual

2. **Penulisan Script Testing**
    - Dilakukan pada folder test
    - Nama file harus diikuti _test.dart. Contoh : contact_test.dart
    - Tiap file berisi fungsi main() yang didalamnya dapat dituliskan script testing
    - Tiap skenario pengujian disebut **test case**
```dart
void main() {
    testWidgets('Judul halaman harus ...', (WidgetTester tester) async {
        });
    testWidgets('Tombol harus ...', (WidgetTester tester) async {
    });
} 
```

3. **Script Testing**
    - Test Case diawali dengan **testWidgets** dan diberi judul
    - Simulasi proses mengaktifkan halaman AboutScreen
    - Memeriksa apakah di halaman tersebut teks "About Screen"
```dart
// 1
testWidgets('Judul halaman harus About Screen', (WidgetTester tester) async {

    // 2
    await tester.pumpWidget(
    const MaterialApp(
        home: AboutScreen(),
    ),
);

    // 3
    expect(find.text('About Screen'), findsOneWidgets);
});

```

4. **Menjalankan Testing**
    - Perintah flutter test akan menjalankan seluruh file test yang dibuat
    - Hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan dan pesan bahwa pengujian berhasil 
