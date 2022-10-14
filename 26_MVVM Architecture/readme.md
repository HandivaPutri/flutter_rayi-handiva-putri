# (26) MVVM Architecture
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## MVVM Architecture (Model-View ViewModel)
>**MVVM Architecture** adalah Memisahkan logic dengan tampilan (view) ke dalam ViewModel.

## Keuntungan
- Reusability 
> Jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama. 
- Maintainability
> Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
- Testability
> Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian 

## Melakukan MVVM 
### Struktur Direktori
- Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut
- Tiap screen diletakkan dalam sebuah direktori yang didalamnya terdapat View dan ViewModel

### Model
- Bentuk data yang akan digunakan, dibuat dalam bentuk class
- Data-data yang dimuat, diletakkan pada property
```dart
class Contact {
    final int id;
    final String name;
    final String phone;

    Contact ({required this.id, required this.name, required this.phone});
}
```

### Model API
```dart
class ContactAPI {
    // getContacts digunakan untuk mengambil data dari server
    // dengan metode REST API
    // dan mengubah data tersebut ke dalam bentuk class Contact
    static Future<List<Contact>> getContacts() async {

        final response = await Dio().get('');

        List<Contact> contacts = (response.data as List).map((e) => Contact(id: e['id'], name: e['name'], phone: e['phone'])).toList();

        return contacts;
    }
} 
```

### ViewModel
- Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
- Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

### Mendaftarkan ViewModel
- Menggunakan **MultiProvider** agar dapat menggunakan banyak ViewModel
- **MaterialApp** sebagai child utama
```dart
runApp(
    MultiProvider(
        providers: [
            ChangeNotifierProvider(
                create: (_) => ContactViewModel(),
            )
        ],
        child: const MaterialApp(
            debugshowCheckedModeBanner: false,
            home: ContactScreen(),
        ),
    ),
);
```

### View
Menggunakan StatefulWidget
```dart
// menjalankan getAllContacts
// setelah halaman ditampilkan dan siap berinteraksi dengan pengguna
@override 
void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp){
        Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
}
```
### Menampilkan data di view
- Letakkan pada bagian build
- Menggunakan getters yang ada pada ViewModel
- Data dapat langsung ditampilkan pada widgets
```dart
// pada bagian build
// gunakan ViewModel
// ambil data contacts
// tampilkan pada ListView
final modelView = Provider.of<ContactViewModel>(context);

return Scaffold(
    appbar: AppBar(
        title: const Text('Contacts'),
    ),
    body: ListView.builder(
        itemCount: modelView.contacts.length,
        itemBuilder: (context, index) {
            final contact = modelView.contacts[index];
            return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
            ); 
        },
    ),
);