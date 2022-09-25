# (17) Form Input Button
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Form
> **Form** merupakan menerima isian data dari pengguna dan Isian data dapat lebih dari satu.

### Membuat Form
- Menggunakan StatefulWidget
- Keadaan form disimpan menggunakan GlobalKey<FormState>
```dart
//property
var formkey = GlobalKey<FormState>();

//build
Form(
    key: formKey,
    child: inputWidgets,
);
```

## Input
### TextField
- Menerima isian data dari pengguna
- Isian data dapat lebih dari satu

#### Membuat TextField
- Data diambil menggunakan TextEditingController
- Isian data berupa teks
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

### Radio
- Memberi opsi pada pengguna
- Hanya dapat memilih satu opsi

#### Membuat Radio
- Data diambil menggunakan property dengan tipe data sesuai value pada radio 
```dart
//property
var radioValue = '';

//build
Radio<String> (
    value: 'Laki-laki',
    groupValue: radioValue,
    onChanged: (String? value) {
        setState((){
            radioValue = value ?? '';
        });
    },
);
```

### Checkbox
- Memberi opsi pada pengguna
- Dapat memilih beberapa opsi

#### Membuat Checkbox
- Data diambil menggunakan property bertipe bool
```dart
//property
var checkValue = false;

//build
Checkbox(
    value: checkValue,
    onchanged: (bool? value) {
        setState((){
            checkValue = value ?? false;
        });
    },
);
```

### Checkbox
- Memberi opsi pada pengguna
- Dapat memilih beberapa opsi

#### Membuat Checkbox
- Data diambil menggunakan property bertipe bool
```dart
//property
var checkValue = false;

//build
Checkbox(
    value: checkValue,
    onchanged: (bool? value) {
        setState((){
            checkValue = value ?? false;
        });
    },
);
```

### Dropdown Button
- Memberi opsi pada pengguna
- Hanya dapat memilih satu opsi
- Opsi tidak ditampilkan di awal, hanya tampil jika ditekan

#### Membuat Dropdown Button
- Data diambil menggunakan property dengan tipe data sesuai value pada DropdownMenuItem
```dart
//property
var dropdownValue = 0;

//build
DropdownButton(
    value: dropdownValue,
    onChanged: (int? value) {
        setState(() {
            dropdownValue = value ?? 0;
        });
    },
    items: const [
        DropdownMenuItem(
            value: 0,
            child: Text('Pilih ...'),
        ),
        DropdownMenuItem(
            value: 1,
            child: Text('Satu'),
        ),
        DropdownMenuItem(
            value: 2,
            child: Text('Dua'),
        ),
        DropdownMenuItem(
            value: 3,
            child: Text('Tiga'),
        ),
    ],
);
```

## Button
> - Menerima isian data dari pengguna
> - Isian data dapat lebih dari satu

### ElevatedButton
- Tombol yang timbul
- Jika ditekan, akan menjalankan onPressed
```dart
ElevatedButton (
    child: const Text('Submit'),
    onPressed: () {
        // lakukan sesuatu
    },
);
```

### IconButton
- Tombol yang hanya menampilkan icon
- Jika ditekan, akan menjalankan onPressed
```dart
IconButton (
    icon: const Icon(Icons.add),
    onPressed: () {
        // lakukan sesuatu
    },
);
```