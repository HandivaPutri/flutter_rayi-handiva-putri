# (17) Form Picker (Basic Layouting)
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Row dan Column
- Row meletakkan widget children nya secara horizontal
- Column meletakkan widget children nya secara vertikal
```dart
body: Row(
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Column(
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

## MainAxisSize Properti
- Menentukan seberapa banyak space menempati main axis
- Main axis dari Row adalah horizontal
- Main axis dari Column adalah vertical
- Properti _mainAxisSize_ memiliki dua values, MainAxisSize.max dan MainAxisSize.min
- MainAxisSize.max menempati semua space dari main axis
- MainAxisSize.min tidak memiliki extra space, hanya untuk children nya saja. 

#### MainAxisSize.max
```dart
body: Row(
    mainAxisSize: MainAxisSize.max,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Column(
    mainAxisSize: MainAxisSize.max,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

### MainAxisSize.min
```dart
body: Row(
    mainAxisSize: MainAxisSize.min,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Column(
    mainAxisSize: MainAxisSize.min,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

## MainAxisAlignment Properti
- Properti ini digunakan Row dan Column untuk memposisikan children di extra space yang ada
- Memiliki 6 values:
    1. MainAxisAlignment.start
    2. MainAxisAlignment.end
    3. MainAxisAlignment.center
    4. MainAxisAlignment.spaceBetween
    5. MainAxisAlignment.spaceEvenly
    6. MainAxisAlignment.spaceAround

### MainAxisAlignment
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

## CrossAxisAlignment Properti
- Properti ini digunakan Row dan Column untuk memposisikan children mereka pada cross axis
- Cross Axis dari Row adalah vertikal dan Cross Axis dari Column adalah horizontal
- Memiliki 5 values:
    1. CrossAxisAlignment.start
    2. CrossAxisAlignment.end
    3. CrossAxisAlignment.center
    4. CrossAxisAlignment.stretch
    5. CrossAxisAlignment.baseline

### CrossAxisAlignment
```dart
body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center
    children: const[
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ]
),
```

## Flexible Widget
- Membungkus widget lain sehingga child dari Flexible Widget menjadi flexible atau resizable
- Sangat berguna untuk membuat aplikasi yang responsif 
- Harus berada dalam turunan parent widget Row atau Column
- Perubahan ukuran ditentukan dengan properti _fit_ dan *flex*

### Fit Properti
- Menentukan apakah flexible widget memenuhi extra space yang tersedia di main axis nya
- Menerima nilai values berupa FlexFit.loose atau FlexFit.tight
- FlexFit.loose akan memiliki ukuran minimum
- FlexFit.tight akan memiliki ukuran maximum

#### Penggunaan Fit Properti
```dart
Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        alignment: Aligment.center,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(),
        ),
        child: Text(
            text, 
            style: const TextStyle(color: Colors.white),
        ),
    );
}
```
```dart
body: Row(
    children: const[
        BlueBox(text: 'A'),
        Flexible(
            fit: FlexFit.tight,
            child: BlueBox(text: 'B'),
        ),
        Flexible(
            fit: FlexFit.loose,
            child: BlueBox(text: 'C'),
        ),
    ],
),
```

### Flex Properti
- Menentukan perbandingan ukuran dari child widget nya
- Menerima nilai values berupa integer
- Membandingkan nilainya dengan flex properti lain

#### Penggunaan Flex Properti
```dart
body: Row(
    children: const[
        BlueBox(text: 'A'),
        Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: BlueBox(text: 'B'),
        ),
        Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: BlueBox(text: 'C'),
        ),
    ],
),
```

#### Penggunaan Flexible
- Flexible tanpa fixed height dan width
```dart
Widget build(BuildContext context) {
    return Container(
        alignment: Aligment.center,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(),
        ),
        child: Text(
            text, 
            style: const TextStyle(color: Colors.white),
        ),
    );
}
```
```dart
body: Row(
    children: const[
        Flexible(
            child: BlueBox(text: 'A'),
        ),
        Flexible(
            child: BlueBox(text: 'B'),
        ),
        Flexible(
            child: BlueBox(text: 'C'),
        ),
    ],
),
```
