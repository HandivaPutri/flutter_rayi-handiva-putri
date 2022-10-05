# (22) Flutter State Management (BLoC)
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Declarative UI
> **Declarative UI** merupakan sifat declarative yang artinya flutter membangun UI nya pada screen untuk menecerminkan keadaan state saat ini. 

### State
> **State** adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori. Flutter akan membangun ulang UI nya ketika ada state atau data yang berubah. Ada 2 jenis state dalam flutter, yaitu ephemeral state dan app state. 

#### Ephemeral State
- Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widget nya, contohnya: 
    - PageView
    - BottomNavigationBar
    - Switch Button
- Tidak perlu state management yang kompleks
- Hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState()

#### App State
- Digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget, contohnya: 
    - Login info
    - Pengaturan preferensi pengguna
    - Keranjang belanja, dimana informasi yang pengguna pilih di suatu screen yang man informasi itu akan muncul di screen yang berbeda

#### Pendekatan State Management
- setState
    > Lebih cocok penggunaan nya pada ephemeral state
- Provider
    > Pengunaan untuk state management yang lebih kompleks seperti app state
- Bloc
    > Menggunakan pola stream/observable, untuk memisahkan UI dengan bisnis logic nya. 

## Provider
> **Provider** merupakan class yang perlu diperhatikan dalam penggunaan provider, yaitu:
> - Dari Package Provider
>   - ChangeNotifierProvider
>   - MultiProvider
>   - Consumer
> - Built in class dari Flutter SDK
>   - ChangeNotifier

### ChangeNotifier
- Class yang menambah dan menghapus listeners
- Digunakan dengan cara meng-extends
- Memanggil notifyListeners(), fungsi yang memberitahu widget yang menggunakan state bahwa terjadi perubahan data sehingga UI nya harus dibangun ulang
```dart
import 'package:flutter/foundation.dart';

class CartManager extends ChangeNotifier {}
```

### ChangeNotifierProvider
- Widget yang membungkus sebuah class
- Mengimplementasikan ChangeNotifier dan menggunakan child untuk widget UI nya
- Menggunakan create, provider yang akan menyimpan model yang telah dibuat
``` dart
ChangeNotifierProvider(
    create: (context) => MyModel(),
    child: <widget>,
);
```

### MultiProvider
- Jika kita membutuhkan lebih dari satu provider
``` dart
MultiProvider(
    providers: [
        Provider<MyModel>(create: (_) => Something()),
        Provider<MyDatabase>(create: (_) => SomethingMore()),
    ],
    child: <widget>
);
```

### Consumer
- Widget yang mendengarkan perubahan kelas yang mengimplementasikan ChangeNotifier
- Membangun ulang widget yang dibungkus Consumer saja
- Penting untuk meletakkan Consumer pada lingkup sekecil mungkin
- Membutuhkan properti builder yang berisi context, model dan child

``` dart
Consumer<MyModel>(
    builder: (context, model, child) {
        return Text('Hello ${model.value}');
    }
);
```

## BLoC
> - BLoC (Business Logic Component)
> - Memisahkan antara business logic dengan UI

### Kenapa BLoC
- Simple
- Powerful
- Testable

### Cara Kerja BLoC
- Menerima event sebagai input
- Dianalisa dan Dikelola di dalam BLoC
- Menghasil state sebagai output

### Stream
- Rangkaian proses secara asynchronous
- Actor utama di dalam BLoC