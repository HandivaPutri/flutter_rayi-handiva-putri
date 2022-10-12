# (25) Introduction REST API – JSON serialization/deserialization
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## REST API 
(Representational State Transfer Application Programming Interface)
> - Arsitektural yang memisahkan tampilan dengan proses bisnis
> - Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request

## HTTP
> **HTTP** merupakan protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web

### Pola Komunikasi
> - Client mengirim request
> - Server mengolah dan membalas dengan memberi response

### Struktur Request 
- URL 
    > Alamat halaman yang akan diakses
- Method (GET, POST, PUT, DELETE) 
    > Menunjukkan aksi yang diinginkan
- Header 
    > Informasi tambahan terkait request yang dikirimkan
- Body 
    > Data yang disertakan bersama request

### Struktur Response
- Status Code 
    > Kode yang mewakili keseluruhan response, baik suskses maupun gagal
- Header 
    > Informasi tambahan terkait response yang diberikan
- Body 
    > Data yang disertakan bersama response

## Dio
> **Dio** merupakan sebagai HTTP Client, dan dimanfaatkan untuk melakukan REST API

### Instalasi 
- Tambahkan dependecy pada **pubspec.yaml**
- Jalankan perintah **flutter pub get** pada terminal   

### Penggunaan 
Mengambil data menggunkan Dio dan menampilkan hasilnya pada console
```dart
import 'package:dio/dio.dart';

Dio()
    .get("https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts")
    .then((response) {
        print(response);
    });   
```
```dart
[{id: 1, name: Alex Under, phone: 0821867326725}, 
{id: 2, name: John Thor, phone: 0857676565688},
{id: 3, name: Isa Bell, phone: 0898736763736}]
```

## JSON
> - Umum digunakan pada REST API
> - Cara penulisan data
> - Javascript Object Notation

### Serialisasi JSON
- Mengubah struktur data ke bentuk JSON
- Menggunakan fungsi jsonEncode dari package dart:convert
```dart
import 'dart:convert';

void main() {
    var dataMap = { ... };
    var dataJSON = jsonEncode(dataMap);
    print(dataJSON);
}
```
```dart
{"name":"John Thor", "phone":"0857676565688"}
```

### Deserialisasi JSON
- Mengubah JSON ke struktur data
- Menggunakan fungsi jsonDecode dari package dart:convert
```dart
import 'dart:convert';

void main() {
    var dataJSON = '...';
    var dataMap = jsonDecode(dataJSON);
    print(dataMap);
}
```
```dart
{name: John Thor, phone: 0857676565688}
```