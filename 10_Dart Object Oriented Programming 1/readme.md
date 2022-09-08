# (10) Dart Object Oriented Programming
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## 1. Deskripsi
> **Dart Object Oriented Programming** merupakan program disusun dalam bentuk abtsraksi object, data dan proses diletakkan pada abstraksi tersebut dan biasa disebut dengan OOP.

### Keuntungan
Berikut adalah keuntungan dalam Dart Object Oriented Programming :
- Mudah di troubleshoot
- Mudah digunakan ulang

### Penggunaan
Dart dan berbagai bahasa pemrograman lainnya, seperti : C++, Java, Javascript, Python

### Komponen
OOP memiliki beberapa bagian, diantaranya : Class, Object, Property, Method, Inheritance, Generics.

## 2. Class
> - Abstraksi dari sebuah benda (object)
> - Memiliki ciri-ciri yang disebut property
> - Memiliki sifat dan kemampuan yang disebut method

### Membuat Class
- Menggunakan kata kunci _class_
- Memiliki nama
- Detail class diletakkan dalam kurawal 
```
class Hewan {
    // property
    // method
}
```

### Membuat Object 
- Bentuk sebenarnya dari class
- Disebut juga instance of class
- Diperlakukan seperti data
```
void main () {
    var h1 = Hewan();
    var h2 = Hewan();
    var h3 = Hewan();
}
```

## 3. Method
> - Sifat suatu class
> - Aktivitas yang dapat dikerjakan suatu class
> - Memiliki sifat seperti fungsi

### Membuat Method
> Seperti fungsi tetapi terletak dalam sebuah class
```
class Hewan {
    void bersuara() {
        print('');
    }
}
```

### Menjalankan Method
> Seperti menggunakan fungsi tetapi melalui sebuah object
```
void main () {
    var h1 = Hewan();
    h1.bersuara();
}
```