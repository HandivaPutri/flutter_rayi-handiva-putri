# (20) Flutter Navigation
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Navigation
> **Navigation** merupakan Berpindah dari halaman satu ke halaman lain

## Navigation Dasar
> - Perpindahan halaman menggunakan `Navigator.push()`
> - Kembali ke halaman sebelumnya menggunakan `Navigator.pop()` 

### Perpindahan Halaman
```dart
class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) :super(key: key);

    @override 
    Widget build(BuildContext context) {
        return Scaffold(
            appbar: AppBar(
                title: const Text('Home Screen'),
            ),
        body: Center(
            child: ElevatedButton(
                child: const Text('Go to about Page'),  
                onPressed: () {

                    // saat tombol di tekan
                    // pindah ke halaman berikutnya
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
                },
            ),
        ),
        );
    }
}
```
```dart
class AboutScreen extends StatelessWidget {
    const AboutScreen({Key? key}) :super(key: key);

    @override 
    Widget build(BuildContext context) {
        return Scaffold(
            appbar: AppBar(
                title: const Text('About Screen'),
            ),
        );
    }
}
```

### Mengirimkan Data ke Halaman Baru
Menggunakan parameter pada constructor baru
```dart
ElevatedButton(
    child: const Text('Go to about Page'),  
    onPressed: () {

        // saat tombol di tekan
        // pindah ke halaman AboutScreen dengan parameter
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AboutScreen(parameter: 'Hore'),
            ),
        );
    },
);
```
```dart
class AboutScreen extends StatelessWidget {

    // property yang akan menerima parameter
    final String parameter;
    const AboutScreen({Key? key}) :super(key: key);

    @override 
    Widget build(BuildContext context) {
        return ...;
    }
}
```

## Navigation dengan Named Routes
> - Perpindahan halaman menggunakan `Navigator.pushNamed()`
> - Kembali ke halaman sebelumnya menggunakan `Navigator.pop()` 

### Mendaftarkan Route
- Tambahkan initialRoute dan routes pada MaterialApp
- Tiap route adalah fungsi yang membentuk halaman
```dart
MaterialApp(
    debugShowCheckedModeBanner: false,

    // menentukan halaman yang pertama kali dibuka
    initialRoute: '/',

    // daftar halaman yang dapat dibuka
    routes: {
        '/': (_) => const HomeScreen(),
        '/about': (_) => const AboutScreen(), 
    },
);
```

### Perpindahan Halaman
```dart
ElevatedButton(
    child: const Text('Go to about Page'),  
    onPressed: () {

        // saat tombol di tekan
        // pindah ke halaman dengan nama about
        Navigator.of(context).pushNamed('/about');
    },
);
```

### Mengirimkan Data ke Halaman Baru
Menggunakan arguments saat melakukan pushNamed
```dart
ElevatedButton(
    child: const Text('Go to about Page'),  
    onPressed: () {

        // saat tombol di tekan
        // pindah ke halaman AboutScreen dengan parameter
        Navigator.of(context).pushNamed(
            '/about', 
            arguments: 'Hore',
        );
    },
);
```
```dart
class AboutScreen extends StatelessWidget {

    // ...

    @override 
    Widget build(BuildContext context) {

        // mengambil parameter yang dikirim melalui arguments
        final parameter = ModalRoute.of(context)!.settings.arguments as String;

        return ...;
    }
}
```