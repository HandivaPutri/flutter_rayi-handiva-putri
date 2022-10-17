# (26) Finite State Machine
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Finite State Machine
> **Finite State Machine** adalah mesin yang memiliki sejumlah state dan tiap state menunjukkan apa yang terjadi sebelumnya.

### Contoh 
Terdapat 3 state yang menunjukkan kejadian dalam suatu proses. 
- IDDLE saat tidak terjadi proses
- RUNNING saat proses sedang berjalan
- ERROR saat proses gagal diselesaikan 

#### Contoh Sukses 
- IDDLE berubah menjadi RUNNING saat proses berjalan
- RUNNING kembali menjadi IDDLE saat proses selesai

#### Contoh Gagal 
- IDDLE berubah menjadi RUNNING saat proses berjalan
- RUNNING menjadi ERROR saat terjadi kegagalan
- ERROR kembali menjadi IDDLE

## Widget with Finite State 
### Implementasi pada Widget
Informasi finite state dapat berguna untuk menentukan seperti apa tampilan yang dimunculkan
```dart
Widget body(ContactViewModel viewModel) {
    final isLoading = viewModel.state == ContactViewState.loading;
    final isError = viewModel.state == ContactViewState.error;

    if (isLoading) {
        return const Center(child: CircularProgressIndicator());
    }

    if (isError) {
        return const Center(child: Text('Gagagl mengambil data'));
    }
    return listView(viewModel);
}
```
- Saat state menunjukkan RUNNING, maka ditampilkan progress indicator.
- Saat state menujukkan IDDLE setelah RUNNING, maka ditampilkan data yang didapatkan.
- Saat state menujukkan ERROR, maka ditampilkan pesan yang menunjukkan bahwa proses tidak dapat diselesaikan.


## Unit Test
> **Unit Test** merupakan Salah satu jenis pengujian pada perangkat lunak. Pengujian dilakukan pada unit dalam perangkat lunak. Unit yang dimaksud umumnya adalah fungsi atau method. 

### Tujuan Unit Test
- Memastikan fungsi dapat mengolah berbagai jenis input
- Memastikan hasil dari suatu fungsi atau method sudah sesuai
- Menjadi dokumentasi

### Bagaimana Melakukan Unit Test?
- Manual 
    Unit dijalankan dan dicek hasilnya secara manual
- Automated
    Menulis script yang dapat dijalankan berkali-kali menggunakan test runner

### Menambah Dependencies
- Tambahkan **test**, pada bagian **dev_dependencies** dalam file **pubspec.yaml**
- Jalankan **flutter pub get** pada terminal

### Membuat File Test
- Pada folder **test**, Tambahkan folder baru **model/api** 
- Dalam folder tersebut, tambahkan file baru **contact_api_test.dart** 

### Menulis Test Script
- Import package test
- Membuat test case
- Menjalankan fungsi
- Cek hasil dengan expect
```dart
import 'package:test/test.dart';

void main(){

    test('get all contacts return data', () async {
        var contacts = await ContactAPI.getAllContacts();
        expect(contacts.isNotEmpty, true);
    });
}
```

### Menjalankan Test
Menggunakan perintah flutter test

### Mengelompokkan Test
- Beberapa test dengan subjek yang sama diletakkan dalam sebuah kelompok
- Dilakukan dengan menggunakan Group
```dart
import 'package:test/test.dart';

void main(){

    group('ContactAPI', () {

        test('get all contacts return data', () async {
            var contacts = await ContactAPI.getAllContacts();
            expect(contacts.isNotEmpty, true);
        });
    });
}
```

## Mocking
### Apa itu Mocking?
- Proses yang terikat dengan sistem eksternal dapat mempengaruhi berjalannya pengujian
- Pengaruh tersebut dapat menggangu proses pengujian
- Dilakukan mocking untuk menghindari masalah-masalah tersebut

### Bagaimana Cara Kerja Mocking?
- Suatu object dibuat bentuk tiruannya
- Bentuk tiruan tersebut memiliki input dan output yang sama dengan yang asli
- Bentuk tiruan menghilangkan ketergantungan pada sistem eksternal

### Menambah Dependencies
- Tambahkan **mockito** dan **build_runner**, pada bagian **dev_dependencies** dalam file **pubspec.yaml**
- Jalankan **flutter pub get** pada terminal

### Melakukan Mocking
- Mengubah kode agar dapat dilakukan mocking
- Memasang annotation untuk membuat mock
```dart
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ContactAPI])
void main(){

    group('ContactAPI', () {

        test('get all contacts return data', () async {
            var contacts = await ContactAPI.getAllContacts();
            expect(contacts.isNotEmpty, true);
        });
    });
}
```
- Membuat file mock dengan menjalankan perintah **flutter pub run build_runner build**
- Menggunakan mock yang telah dibuat

### Menjalankan Test
Dengan mocking, test berjalan lebih cepat

