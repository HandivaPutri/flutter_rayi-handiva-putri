# (15) Flutter Layout
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Layout
> **Layout** merupakan layout berbentuk widget yang mengatur widget di dalamnya dan untuk mengatur tata letak. 

## Single-child Layout
### Container
- Membuat sebuah box
- Membungkus widget lain
- Box memiliki margin, padding dan border

#### Penggunaan Container
```javascript
Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(),
    ),
    child: const Text('HALO'),
);
```

### Center
- Membuat sebuah box
- Membungkus widget lain
- Memenuhi lebar dan tinggi ruang di luarnya
- Meletakkan widget berada di bagian tengah
```javascript
Center(
    child: Text(teks),
);
```

### SizeBox
- Membuat sebuah box
- Membungkus widget lain
- Box dapat diatur lebar dan tingginya
- Lebih sederhana dari container
```javascript
SizeBox(
    width: 100,
    height: 150,
    child: Text(teks),
);
```

## Multi-child Layout
### Column
- Mengatur widget secara vertikal
```javascript
Column(
    children: const[
        Text(teks),
        Text(teks),
        Text(teks),
        Text(teks),
    ],
);
```

#### Penggunaan Column
```javascript
Column(
    children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('A'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('L'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('O'),
        ),
    ],
);
```

### Row
- Mengatur widget secara horizontal
```javascript
Row(
    children: const[
        Text(teks),
        Text(teks),
        Text(teks),
        Text(teks),
    ],
);
```

#### Penggunaan Row
```javascript
Row(
    children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('A'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('L'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('O'),
        ),
    ],
);
```

### ListView
- Mengatur widget dalam bentuk list
- Memiliki kemampuan scroll
```javascript
ListView(
    children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
    ],
);
```

### GridView
- Mengatur widget dalam bentuk galeri
```javascript
GridView.count(
    crossAxisCount: angka,
    children: [],
);
```

#### Penggunaan GridView
```javascript
GridView.count(
    crossAxisCount: 2,
    children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
    ],
);
```
