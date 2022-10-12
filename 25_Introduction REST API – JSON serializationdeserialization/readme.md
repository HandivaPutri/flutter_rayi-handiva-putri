# (25) Introduction REST API – JSON serialization/deserialization
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## 1. REST API 
(Representational State Transfer Application Programming Interface)
> - Arsitektural yang memisahkan tampilan dengan proses bisnis
> - Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request

## 2. HTTP
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

## 3. Dio
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

### Penggunaan Method GET
Penggunaan _dio_ dengan method GET
```dart
import 'package:dio/dio.dart';

// dio: HTTP Client
final Dio dio = Dio();

// Response: bentuk tipe data dari hasil return fungsi dio.get()
// get: HTTP method yang digunakan
final Response response = await dio.get(
    'https://reqres.in/api/users'
    //url yang digunakan
);
```

### Penggunaan Method POST
Penggunaan _dio_ dengan method POST
```dart
import 'package:dio/dio.dart';

// dio: HTTP Client
final Dio dio = Dio();

// Response: bentuk tipe data dari hasil return fungsi dio.get()
// get: HTTP method yang digunakan
final Response response = await dio.post(
    'https://reqres.in/api/users',
    //url yang digunakan
    data: {
        'name': 'morpheus',
        'job': 'leader',
    },
);
```

### Penggunaan Method PUT
Penggunaan _dio_ dengan method PUT
```dart
import 'package:dio/dio.dart';

// dio: HTTP Client
final Dio dio = Dio();

// Response: bentuk tipe data dari hasil return fungsi dio.get()
// get: HTTP method yang digunakan
final Response response = await dio.put(
    'https://reqres.in/api/users/2',
    //url yang digunakan
    data: {
        'name': 'morpheus',
        'job': 'zion resident',
    },
);
```

### Penggunaan Method DELETE
Penggunaan _dio_ dengan method DELETE
```dart
import 'package:dio/dio.dart';

// dio: HTTP Client
final Dio dio = Dio();

// Response: bentuk tipe data dari hasil return fungsi dio.get()
// get: HTTP method yang digunakan
final Response response = await dio.delete(
    'https://reqres.in/api/users/2',
    //url yang digunakan
);
```

## 4. JSON
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