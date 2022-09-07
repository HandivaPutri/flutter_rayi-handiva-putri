# (07) Branching, Looping, Function 
## Data Diri
Nomor Urut : 1_019FLC_34
Nama : Rayi Handiva Putri

### Pengambilan Keputusan
> Menentukan alur program pada kondisi tertentu

**1. IF**
- Memerlukan nilai bool (dari operator logical atau comparison)
- Menjalankan bagian proses jika nilai bool bernilai true

Ditulis dengan :
```
if (nilai_bool) {
    // proses jika nilai_bool adalah true
}
```
**2. IF-ELSE**
- Berjalan dengan if
- Menambah alternatif jika nilai bool adalah false

Ditulis dengan :
```
if (nilai_bool) {
    // proses jika nilai_bool adalah true
} else {
    // proses jika nilai_bool adalah false
}
```
**3. ELSE-IF**
- Berjalan dengan if
- Menambah alternatif jika nilai bool adalah false
- Menambah pengujian nilai bool lain

Ditulis dengan :
```
if (nilai_bool) {
    // proses jika nilai_bool adalah true
} else if (nilai_bool1) {
    // proses jika nilai_bool adalah false 
    // dan nilai_bool1 adalah true
}
```
## Perulangan
> Menjalankan proses berulang kali

**1. FOR**
- Diketahui berapa kali perulangan terjadi 
- Memerlukan nilai awal
- Memerlukan nilai bool, jika true maka perulangan dilanjutkan
- Memerlukan pengubah nilai

Ditulis dengan :
```
for (nilai_awal; nilai_bool; pengubah_nilai_awal) {
    // proses berulang jika nilai_bool adalah true
}
```
**2. WHILE**
- Tidak diketahui berapa kali perulangan terjadi 
- Memerlukan nilai bool, jika true maka perulangan dilanjutkan 

Ditulis dengan :
```
while (nilai_bool) {
    // proses berulang jika nilai_bool adalah true
}
```
**3. DO-WHILE**
- Mengubah bentuk while
- Proses dijalankan minimum sekali, akan diteruskan jika nilai bool adalah true

Ditulis dengan :
```
do {
    // proses berulang jika nilai_bool adalah true
} while (nilai_bool);
```

### Break dan Continue
> Cara lain menghentikan perulangan.