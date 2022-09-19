# (14) Flutter Command Line Interface (CLI) and Flutter package management
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Flutter CLI
> **Flutter CLI** merupakan alat yang digunakan untuk berinteraksi dengan flutter SDK dan perintah dijalankan dalam terminal.

### Important CLI Commands
- Flutter Doctor
> Perintah untuk menampilkan informasi software yang dibutuhkan flutter
```javascript
flutter doctor
``` 

- Flutter Create
> Perintah untuk membuat project aplikasi flutter baru di directory tertentu
```javascript
flutter create <APP_NAME>
```

- Flutter Run
> Perintah untuk menjalankan project aplikasi di device yang tersedia.
```javascript
flutter run <DART_FILE>
```

- Flutter Emulator
> Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru
```javascript
flutter emulators
flutter emulators --launch <EMULATOR_ID>
flutter emulators --create [--name xyz]
```

- Flutter Channel
> Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukkan channel yang digunakan saat ini.
```javascript
flutter channel
```

- Flutter Pub
> Ada 2 syntax yang bisa digunakan, yaitu : 
> - Flutter pub add, untuk menambahkan packages ke dependencies yang ada di pubspec.yaml
```javascript
flutter pub add<package_name>
```
> - Flutter pub get, untuk mendownload semua packages atau dependencies yang ada di pubspec.yaml
```javascript
flutter pub get
```

- Flutter Build
> Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, PlayStore, dll.
```javascript
flutter build <DIRECTORY>
```

- Flutter Clean
> Perintah untuk menghapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator dan perintah ini akan memperkecil ukuran project tersebut.
```javascript
flutter clean
```

## Packages Management
### Deskripsi
> - Flutter mendukung sharing packages
> - Packages dibuat developers lain
> - Mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
> - Mendapatkan packages di website pub.dev

### Cara Menambahkan Packages
- Cari package di _pub.dev_
- Copy baris dependencies yang ada di bagian installing
- Buka _pubspec.yaml_
- Paste barisnya dibawah dependencies _pubspec.yaml_
- Run _flutter_ pub get di terminal
- Import package di flie dart agar bisa digunakan
- Stop atau restart aplikasi jika dibutuhkan

### Menggunakan Packages
> Hanya membutuhkan beberapa baris kode untuk menghasilkan UI yang kompleks