# (23) Flutter Animation
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Animation
> **Animation** adalah Widget yang bergerak menambah daya tarik, Animasi membuat aplikasi terlihat hidup, dan Pergerakan dari kondisi A ke kondisi B. 

## Implicit Animation
> **Implicit Animation** adalah Versi animasi dari widget yang sudah ada

### Tanpa Animation 
Perubahan ukuran container tampak kaku
```dart
// state
bool isBig = false;

// container berubah ukuran
// jika isBig = true, tinggi dan lebar akan menjadi 200
// jika isBig = false, tinggi dan lebar akan menjadi 100
Container(
    width: isBig ? 200 : 100,
    height: isBig ? 200 : 100,
    color: Colors.red,
);
```

### Dengan Animation 
Perubahan ukuran container menjadi lebih hidup dan nyaman dilihat
```dart
// state
bool isBig = false;

// container berubah ukuran
// jika isBig = true, tinggi dan lebar akan menjadi 200
// jika isBig = false, tinggi dan lebar akan menjadi 100
Container(
    width: isBig ? 200 : 100,
    height: isBig ? 200 : 100,
    color: Colors.red,
    duration: const Duration(miliseconds: 300),
);
```

## Transition
> **Transition** adalah Animasi yang terjadi saat perpindahan halaman, dan Dilakukan pada bagian Navigation.push()

### Melakukan Transition
```dart
Navigator.of(context).push(

    // mengatur proses Navigasi terjadi
    PageRouteBuilder(

        // proses pembuatan halaman AboutScreen
        pageBuilder: (context, animation, secondaryAnimation) {
            return const AboutScreen();
        }, 

        // proses mengatur transition
        // halaman AboutScreen muncul dari tengah halaman
        // menuju ke halaman penuh dengan transisi bergeser (slide)
        transitionBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(0, .5), end: Offset.zero);

            return SlideTransition(
                position: animation.driver(tween),
                child: child,
            );
        },
    ),
);
```

## Transition Umum

### FadeTransition
Halaman muncul dengan efek redup menuju ke tampak jelas secara penuh
```dart
final tween = Tween(begin: 0.0, end: 1.0);

return FadeTransition(
    opacity: animation.driver(tween),
    child: child,
);
```

### ScaleTransition
Halaman muncul dengan efek berubah ukuran dari tidak penuh menuju tampil keseluruhan
```dart
final tween = Tween(begin: 0.0, end: 1.0);

return ScaleTransition(
    scale: animation.driver(tween),
    child: child,
);