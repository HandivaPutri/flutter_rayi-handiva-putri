# (24) Storage
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Penyimpanan Lokal
> - Diperlukan untuk efisiensi penggunaan data internet
> - Ada beberapa cara implementasi penyimpanan local, contohnya seperti : 
>   - Shared Preferences
>   - Local Database

## Shared Preference
> - Menyimpan data yang sederhana
> - Penyimpanan dengan format key-value
> - Menyimpan tipe data dasar seperti teks, angka dan boolean
> - Contoh penggunaan shared preference seperti menyimpan data login dan menyimpan riwayat pencarian 

### Implementasi Shared Preference
- Menambahkan shared preference pada fitur login
- STEP 1: Tambahkan package shared_preference
```dart
dependencies: 
    flutter: 
        sdk: flutter
    email_validator: ^2.0.1
    shared_preferences: ^2.0.12
```
- STEP 2: Buat properti baru untuk TextEditingController dan tambahkan di setiap TextFormField
- STEP 3: Buat method dispose(), untuk menghindari kebocoran memori 
- STEP 4: Buat variabel baru untuk menyimpan SharedPreference dan nilai bool newUser
- STEP 5: Buat method baru dengan nama checkLogin()
- STEP 6: Panggil method checkLogin() di method initState()
- STEP 7: Di dalam onPressed ElevatedButton, buat variabel baru username untuk menampung input dari user 
- STEP 8: Buat setBool dan setString baru didalam blok kode if, dan buat navigasi untuk ke halaman HomePage
- STEP 9: Buat file dart baru home_page.dart dan tambahkan UI nya
- SETP 10: (home_page.dart) Buat variabel baru untuk menyimpan SharedPreference dan username
- STEP 11: (home_page.dart) Buat variabel baru initial(), dan panggil di method initState()
- STEP 12: (home_page.dart) mengganti text 'username' menjadi variabel username
- SETP 13: (home_page.dart) tambahkan method setBool dan remove pada ElevatedButton

## Local Database (SQLite)
> - Menyimpan dan meminta data dalam jumlah besar pada local device
> - Bersifat privat
> - Menggunakan SQLite database melalui package sqflite
> - SQLite adalah database open source yang mendukung insert, read, update dan remove data

## Aplikasi Task Management (Continue)
### Menambahkan Fitur Login
- TODO 28: Menambahkan login screen pada aplikasi Task Management dan menambahkan shared_preference package, dan email_validator package
```dart
dependencies: 
    flutter: 
        sdk: flutter
    provider: ^6.0.2
    uuid: ^3.0.5
    google_fonts: ^2.2.0
    email_validator: ^2.0.1
    shared_preferences: ^2.0.12
```
- TODO 29: (main.dart) mengganti home menjadi routes
```dart
child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Task Management'
    routes: {
        '/': (context) => const LoginScreen(),
        '/taskScreen': (context) => const TeaskScreen(),
    },
),
- TODO 30: (profile_sheet.dart) menambahkan kode untuk shared preference di profile sheet