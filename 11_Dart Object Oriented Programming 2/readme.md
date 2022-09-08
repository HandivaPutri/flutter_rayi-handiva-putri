# (11) Dart Object Oriented Programming 2
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## 1. Method Overriding
> **Method Overriding** bertujuan agar class memiliki method yang sama dengan proses yang berbeda dan menulis ulang method yang ada pada superclass.

### Melakukan Overriding
- Dilakukan pada class yang melakukan inheritance
- Method sudah ada pada class induk
- Method ditulis ulang seperti membuat method baru pada class anak
- Ditambahkan tanda @override dibaris sebelum method dibuat

### Penggunaan Class
Proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya. 
```
void main() {
    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

    var h1 = Hewan();
    h1.reproduksi();
    h1.bernapas();
    
}
```

## 2. Interface
> - Berupa class
> - Menunjukkan method apa saja yang ada pada suatu class
> - Seluruh method wajib di-override
> - Digunakan dengan menggunakan implements

### Menggunakan Interface
- Sekilas mirip inheritance
- Pada class yang melakukan implements, wajib melakukan override semua method yang ada pada class induk

### Penggunaan Class
Proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya. 
```
void main() {
    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

    var h1 = Hewan();
    h1.reproduksi();
    h1.bernapas();
    
}
```

## 3. Polymorphism
> - Kemampuan data berubah menjadi bentuk lain
> - Tipe data yang dapat digunakan adalah super class
> - Dapat dilakukan pada class dengan extends atau implements

### Melakukan Polymorphism
Object dari class Kambing dengan tipe data class Hewan  
```
void main() {

    Hewan k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();
}
```
