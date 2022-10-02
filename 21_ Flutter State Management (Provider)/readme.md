# (21) Flutter State Management (Provider)
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## State
> - Data yang dapat dibaca saat pembuatan widget
> - Dapat berubah saat widget sedang aktif
> - Hanya dimiliki oleh **StatefulWidget**

### Kenapa perlu Global State
> Agar antara widget dapat memanfaatkan state yang sama dengan mudah

### Memanfaatkan State
- Dibuat sebagai property dari class
- Digunakan pada widget saat build
```dart
// property
var number = 0;

// build
Text('$number');
```

### Mengubah State
- Menggunakan method setState
```dart
ElevatedButton(
    child: const Text('Tambah'),
    onPressed: () {
        setState(() {
            number = number + 1;
        });
    },
);
```

## Global State
> State biasa yang dapat digunakan pada seluruh widget

## Provider
> - State Management
> - Perlu di install agar dapat digunakan

### Instalasi Provider
- Menambah package provider pada bagian dependencies dalam file pubspec.yaml
- Jalankan perintah **flutter pub get**
```dart
dependecies:
    provider:
```

### Membuat State Provider
- Buat file bernama contact.dart
- Definisikan state dalam bentuk class
```dart
import 'package:flutter/material.dart';

class Contact with ChangeNotifier {
    List<Map<String, String>> _contacts = [];

    List<Map<String, String>> get _contacts = _contacts;

    void add(Map<String, String> contact) {
        _contacts.add(contact);
        notifyListeners();
    }
}
```

### Mendaftarkan State Provider
- Import dalam file **main.dart**
- Daftarkan pada **runApp** dengan **MultiProvider**
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phonebookapp/stores/contact.dart' as contact_store;

void main() {
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => contact_store.Contact())
            ],
            child: MyWidget(),
        ),
    );
}
```

### Menggunakan State dari Provider
- Simpan provider dalam variabel
- Ambil data dari provider melalui getter
```dart
// build
final contactProvider = Provider.of<contact_store.Contact>(context);

// return
ListView.builder(
    itemCount: contactProvider.contacts.length,
    itemBuilder: (context, index) {
        return: ListTile(
            title: Text(contactProvider.contacts[index]['name'] ?? ''), 
            subtitle: Text(contactProvider.contacts[index]['phone'] ?? ''), 
        );
    },
);
```