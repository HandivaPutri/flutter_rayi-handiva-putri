# (18) Form Picker (Basic Layouting)
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Row dan Column
- Row meletakkan widget children nya secara horizontal
- Column meletakkan widget children nya secara vertikal
```dart
body: Row(
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Column(
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

## MainAxisSize Properti
- Menentukan seberapa banyak space menempati main axis
- Main axis dari Row adalah horizontal
- Main axis dari Column adalah vertical
- Properti _mainAxisSize_ memiliki dua values, MainAxisSize.max dan MainAxisSize.min
- MainAxisSize.max menempati semua space dari main axis
- MainAxisSize.min tidak memiliki extra space, hanya untuk children nya saja. 

### MainAxisSize.max
```dart
body: Row(
    mainAxisSize: MainAxisSize.max,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Column(
    mainAxisSize: MainAxisSize.max,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

### MainAxisSize.min
```dart
body: Row(
    mainAxisSize: MainAxisSize.min,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Column(
    mainAxisSize: MainAxisSize.min,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

## MainAxisAlignment Properti
- Properti ini digunakan Row dan Column untuk memposisikan children di extra space yang ada
- Memiliki 6 values:
    1. MainAxisAlignment.start
    2. MainAxisAlignment.end
    3. MainAxisAlignment.center
    4. MainAxisAlignment.spaceBetween
    5. MainAxisAlignment.spaceEvenly
    6. MainAxisAlignment.spaceAround

### MainAxisAlignment
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

## CrossAxisAlignment Properti
- Properti ini digunakan Row dan Column untuk memposisikan children mereka pada cross axis
- Cross Axis dari Row adalah vertikal dan Cross Axis dari Column adalah horizontal
- Memiliki 5 values:
    1. CrossAxisAlignment.start
    2. CrossAxisAlignment.end
    3. CrossAxisAlignment.center
    4. CrossAxisAlignment.stretch
    5. CrossAxisAlignment.baseline

### CrossAxisAlignment
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ]
),
```

## Date Picker
- Widget dimana user bisa memasukkan tanggal
- Tanggal kelahiran, waktu pemesanan tiket, Waktu reservasi restoran, jadwal meeting, dll

### Cara Membuat Date Picker
- Menggunakan fungsi bawaan flutter showDatePicker
- Fungsi showDatePicker memiliki tipe data future
- Menampilkan dialog material design date picker

Basic Code:
```dart
final selectDate = await showDataPicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(1990),
    lastDate: DateTime(currentDate.year + 5),
);
```
- Menambahkan packages _intl_ di pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.17.0
```
- Mempersiapkan variabel
- Membangun UI
- Menambahkan fungsi showDataPicker di dalam onPressed
- Memanggil fungsi setState di dalam onPressed

### Hasil Akhir
- Saat select button di tekan akan muncul dialog date picker
- Tanggal yang ada di UI akan berubah sesuai dengan tanggal yang dipilih

## Color Picker
- Widget dimana user bisa memilih color
- Penggunaan color picker bisa digunakan untuk berbagai macam kondisi

### Cara Membuat Color Picker
- Menggunakan package _flutter_colorpicker_
- Menambahkan packages _flutter_colorpicker_ di pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.17.0
  flutter_colorpicker: ^1.0.3
```
- Mempersiapkan variabel
- Membangun UI
- Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog
- Import packages _flutter_colorpicker_ dalam file dart
```dart
import 'packages:flutter_colorpicker/flutter_colorpicker.dart';
```
- Membuat kode untuk penggunaan packages _flutter_colorpicker_

### Hasil Akhir
- Packages _flutter_colorpicker_ memiliki custom widget yang dapat digunakan, seperti BlockPicker, ColorPicker, dan SlidePicker.

## File Picker
- Kemampuan widget untuk mengakses storage
- Memilih dan membuka file

### Cara Membuat File Picker
- Menggunakan package _file_picker_ dan _open_file_
- Menambahkan packages _file_picker_ dan _open_file_ di pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.17.0
  flutter_colorpicker: ^1.0.3
  file_picker: ^4.3.3
  open_file: ^3.2.1
```
- Import packages _file_picker_ dan _open_file_ dalam file dart
```dart
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
```
- Membangun UI
- Membuat fungsi untuk mengexplore dan memilih files dari storage
- Memanggil fungsi _pickFile di dalam onPressed
- Membuat fungsi untuk membuka files yang telah dipilih
- Mengambil file dari object result dan Memanggil fungsi _openFile di dalam fungsi _pickFile

### Hasil Akhir
- Ketika button ditekan maka akan membuka storage device dan file yang dipilih akan terbuka