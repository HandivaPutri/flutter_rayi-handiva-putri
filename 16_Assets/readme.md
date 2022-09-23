# (16) Assets
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Assets
> **Assets** merupakan file yang di bundled dan di deployed bersamaan dengan aplikasi. Tipe-tipe assets, seperti: static_data (JSON files), icons, images, dan font file (ttf).

### Menentukan Assets
- Flutter menggunakan _pubspec.yaml_
- _pubspec.yaml_ terletak pada root project,untuk mengidentifikasi assets yang dibutuhkan aplikasi
- Gunakan karakter "/" untuk memasukkan semua assets dibawah satu directory name
```
assets: 
- assets/my_icon.png
- assets/background.jpg
```

## Image
> - Image atau gambar akan membuat tampilan aplikasi menjadi lebih menarik
> - Flutter mendukung format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, PNG, BMP dan WBMP.
> - Menampilkan gambar dari project asset dan internet

### Loading Image
- Gunakan widget image
- Membutuhkan properti image dengan nilai class AssetImage()
- Menggunakan method Image.asset mendapatkan image yang sudah ditambahkan dalam project
- Menggunakan method Image.network, mendapatkan data image melalui internet dengan menggunakan string url nya

```dart
body: Column(
    children: const [
        Image(
            image: AssetImage('asstes/background.jpg'),
        ),
        Image(
            image: AssetImage('asstes/my_icon.png'),
        ),
    ]
)
```

```dart
body: Column(
    children: [
        Image.asset('assets/background.jpg'),
        Image.network('https://picsum.photo/id/1/200/300'),
    ]
)
```

## Font
> - Penggunaan font dengan style tertentu akan menjadi keunikan pada aplikasi
> - Penentuan font yang mau dipakai biasanya oleh UI designer
> - Penerapan font menggunakan custom font atau dari package

### Custom Font
Cara menggunakan custom font:

Step 1 : Cari dan download font (Ex, https://fonts.google.com/)
Step 2 : Import file .ttf
Step 3 : Daftarkan font di pubspec.yaml 
Step 4 : Mengatur font sebagai default
Step 5 : Gunakan font di spesifik widget

### Font dari Package
Cara menggunakan font dari package:

Step 1 : Tambahkan package _google_fonts_ di dependencies   
Step 2 : Import package di file dart
Step 3 : Gunakan font dengan memanggil GoogleFonts.namaFont()
Step 4 : Mengatur font sebagai default
Step 5 : Gunakan font di spesifik widget