# (12) Introduction Flutter Widget
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Flutter 
> **Flutter** merupakan alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, desktop, dan web.

### Keunggulan Flutter
- Mudah digunakan dan dipelajari
- Produktivitas tinggi
- Dokumentasi lengkap
- Komunitas yang berkembang

### Bagian dari Flutter
- **SDK (Software Development Kit)**
    > Alat-alat untuk membantu proses pengembangan aplikasi
- **Framework**
    > Perlengkapan untuk membentuk aplikasi yang dapat dikustomisasi     

### Membuat Project
Dilakukan dengan menjalankan perintah : 

_flutter create <nama_project>_

```
flutter create phonebookapp
```

### Menjalankan Project
- Masuk ke direktori project
- Jalankan perintah : 
    *flutter run*

### Struktur Direktori
1. direktori platform :
    - android
    - ios
    - web
2. direktori project :
    - lib = ruang kerja utama
    - test = aktivitas pengujian 

### File Utama
- Pertama kali dibaca dan dijalankan
- Dalam direktori lib
```
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
```

## Widget
> - Digunakan untuk membentuk antarmuka (UI)
> - Berupa class
> - Dapat terdiri dari beberapa widget lainnya

### Jenis Widget
- Stateless
- Sateful

#### 1. Stateless Widget
> - Tidak bergantung pada perubahan data
> - Hanya fokus pada tampilan
> - Dibuat dengan extends pada class StatelessWidget

#### Membuat Stateless Widget
```
class MyWidget extends StatelessWidget {
    const MyWidget({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            home: Scaffold(
                body: Text('Selamat datang di flutter'),
            ),
        );
    }
}
```

#### 2. Stateful Widget
> - Mementingkan pada perubahan data 
> - 1 widget menggunakan 2 class (widget dan state)
> - Dibuat dengan extends pada class StatefulWidget

#### Membuat Stateful Widget
```
class MyWidget extends StatefulWidget {
    const MyWidget({Key? key}) : super(key: key);

    @override
    createState() => MyWidgetState();
}
```
```
class MyWidget extends State<MyWidget> {
    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            home: Scaffold(
                body: Text('Selamat datang di flutter'),
            ),
        );
    }
}
```
### Build in Widget
> - Widget yang dapat langsung digunakan
> - Sudah ter-install bersama flutter

#### MaterialApp
Membangun aplikasi dengan desain material
```
const MaterialApp();
```
```
const MaterialApp(
    home: Text('Selamat datang di flutter.'),
);
```

#### Scaffold
Membentuk sebuah halaman
```
const Scaffold();
```
```
const Scaffold(
    body: Text('Selamat datang di flutter.'),
);
```

#### AppBar
Membentuk application bar yang terletak pada bagian atas halaman
```
AppBar();
```
```
AppBar(
    tittle: const Text('Home'),
);
```

#### Text
Menampilkan teks
```
const Text(teks);
```
```
const Text('halooo...');
```

#### Hasil
```
@override
Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appbar: AppBar (
                tittle: const Text('Home'),
            )
            body: const Text('Selamat datang di flutter'),
        ),
    );
}