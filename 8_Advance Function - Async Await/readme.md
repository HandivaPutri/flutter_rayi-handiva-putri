# (08) Advance Function, Async-Await
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Fungsi
### Anonymous Function
> - Tidak memiliki data
> - Fungsi sebagai data 

Ditulis dengan :
```
() {
    // perintah yang dijalankan saat fungsi dipanggil 
}
```

### Arrow Function
> - Data memiliki nama atau tidak
> - Berisi 1 data (dari proses maupun data statis)
> - Nilai return fungsi ini diambil dari data tersebut

Ditulis dengan :
```
() => proses_yang_dijalankan_saat_fungsi_dipanggil();
```

### Async-Await
> **Async-Await** merupakan menjalankan beberapa proses tanpa perlu menunggu, proses ditulis dalam bentuk fungsi, dan Await akan menunggu hingga proses async selesai. 

Contoh :
```
Future<void> P1 () async {
    await Future.delayed(Duration(seconds: 1), () {
        print('hello dari P1');
    })
}
```

### Tipe Data Future
> **Tipe Data Future** merupakan data yang dapat ditunggu dan membawa data return dari fungsi async. 

Penggunaan Future :
```
Future<String> P1 () {
    return Future.delayed(Duration(seconds: 1), () {
        return 'hello dari P1';
    });
}

void main() async {
    var data = await P1();
    print(data);
}
```