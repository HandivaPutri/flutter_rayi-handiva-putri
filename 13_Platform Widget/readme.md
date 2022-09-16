# (12) Platform Widget
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## MaterialApp
> **Flutter** merupakan widget dasar yang mengemas seluruh widget dalam aplikasi, widget yang digunakan pada sistem Android dan di-import dari *package:flutter/material.dart*

### Struktur
- Widget yang pertama kali dibuka, diletakkan pada bagian home. 
```javascript
MaterialApp(
    theme: ThemeData.dark(),
    home: const HomePage(),
);
``` 

- Mengatur halaman juga dapat dilakukan dengan menggunakan routes dan initialRoute.
```javascript
MaterialApp(
    theme: ThemeData.dark(),
    initialRoute: 'home', 
    routes: {
        'home': (_) => const HomePage(),
    },
);
``` 

## Scaffold
> Widget dasar untuk membangun sebuah halaman pada MaterialApp

### Struktur
- Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti
```javascript
Scaffold(
    appBar: AppBar(...),
    drawer: Drawer(...),
    body: ...,
    bottomNavigationBar: BottomNavigationBar(...),
);
```

## CupertinoApp
> - Widget dasar yang mengemas seluruh widget dalam aplikasi
> - Widget yang digunakan pada sistem iOS
> - Di import dari package:flutter/cupertino.dart

### Struktur
- Variabel _themeDark dibuat untuk menyimpan tema
- Diperlukan karena Cupertino tidak menyediakan ThemeDart.dark() seperti pada Material
```javascript
final _themeDark = const CupertinoThemeData.raw(
    Brightness.dark,
    null,
    null,
    null,
    null,
    null,
);
```
- Widget yang pertama kali dbuka, diletakkan pada bagian home
```javascript
CupertinoApp(
    theme: _themeDark,
    home: const HomePage(),
);
```

## CupertinoPageScaffold
> **CupertinoPageScaffold** merupakan widget dasar untuk membangun sebuah halaman pada CupertinoApp

### Struktur
- Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti
```javascript
CupertinoPageScaffold(
    navigationBar: CupertinoPageScaffold(...),
    child: ...,
);
```
