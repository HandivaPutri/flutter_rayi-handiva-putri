# (19) Dialog Bottom Sheet
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

## Aplikasi Task Management
> **Aplikasi Task Management** merupakan Menambahkan dan menghapus kegiatan.

### Aplikasi Task Management
- TODO 1: Membuat model untuk informasi yang mau disimpan, buat folder models dan di dalamnya buat file dart baru task_model.dart
```dart
class TaskModel {
    final String id;
    final String taskName;

    TaskModel({
        required this.id,
        required this.taskName,
    });
}
``` 
- TODO 2: Membuat Task Screen, buat folder screens di dalamnya buat file dart baru task_screen.dart
```dart
class TaskScreen extends StatelessWidget {
    const TaskScreen({Key? key}) :super(key: key);

    @override 
    Widget build(BuildContext context) {
        return Scaffold(
            appbar: AppBar(
                title: const Text('Task Management'),
                centerTitle: true,
            ),
        );
    }
}
```
-  TODO 3: Membuat Empty Screen, buat file dart baru empty_task_screen.dart di folder screens
- TODO 4: Tambahkan package provider di pubspec.yaml
```dart
dependencies: 
    flutter: 
        sdk: flutter
    provider: ^6.0.2
```
- TODO 5: Membuat Task Manager, buat file dart baru task_manager.dart di dalam folder models. Tambahkan method deleteTask dan addTask
- TODO 6: (main.dart) menambahkan TaskManager sebagai provider
- TODO 7: (task_screen.dart) membuat fungsi buildTaskScreen, akan me-return antara Task Screen yang ada data nya atau yang kosong dan panggil fungsi nya di body
```dart
body: buildTaskScreen(),

Widget buildTaskScreen() {
    return Consumer<TaskManager>(
        builder: (context, manager, child) {
            if(manager.taskModels.isNotEmpty) {
                return Container();
            } else{
                return const EmptyTaskScreen();
            }
        }
    );  
}
```
- TODO 8: Membuat Task Item Screen, buat file dart baru task_item_screen.dart di dalam folder screens dan tambahkan properti onCreate
- TODO 9: (task_screen.dart) buat FloatingActionButton, untuk navigasi ke TaskItemScreen 
- TODO 10: (task_item_screen.dart) menambahkan state properti, initState dan dispose
- TODO 11: (task_item_screen.dart) membuat buildNameField dan panggil fungsi nya di dalam ListView
- TODO 12: (task_item_screen.dart) membuat buildButton dan panggil fungsi nya di dalam ListView
- TODO 13: Membuat Task Item Card, buat folder baru components lalu didalamnya buat file dart baru task_item_card.dart
- TODO 14: (task_item_screen.dart) menambahkan call back handler di ElevatedButton pada buildButton, dan menambahkan package uuid.
- TODO 15: Membuat Task List Screen, dalam folder screens buat file dart baru task_list_screen.dart. Dan tambahkan di buildTaskScreen (task_screen.dart)
- TODO 16: (task_list_screen.dart) menambahkan properti yang dibutuhkan pada TaskItemCard untuk melihat task yang sudah dibuat.

## Alert Dialog
- Untuk tampilan android, dari material design
- Menginformasikan pengguna tentang situasi tertentu
- Bisa digunakan untuk mendapatkan input dari user
- Membutuhkan helper method showDialog

###  Cara Membuat AlertDialog
- TODO 17: (task_item_card.dart) menambahkan Alert Dialog
- Memanggil fungsi showDialog di dalam fungsi onPressed pada IconButton
- showDialog membutuhkan context dan builder
- Di buildernya akan me-return AlertDialog
```dart
onPressed: (){
    showDialog(
        context: context, 
        builder: (context) => AlertDialog(
            content: const Text('Are you sure?'),
            actions: [
                TextButton(
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    child: const Text('NO'),
                ),
                TextButton(
                    onPressed: onPressed,
                    child: const Text('YES'),
                ),
            ],
        ),
    );
}
```
- AlertDialog menyediakan properti seperti content dan actions
- Content bisa dimasukkan widget text, gambar dan animasi gambar
- Actions bisa ditambahkan button untuk menerima respon dari user
- TODO 18: (task_item_card.dart) membuat properti onPressed
- TODO 19: (task_list_screen.dart) menambahkan fungsi onPressed pada TaskItemCard, pada body fungsinya tambahkan method delete Task, Navigator.pop(context) dan ScaffoldMesseger

### Hasil Akhir
- Ketika icon delete nya ditekan maka akan menampilkan alert dialog seperti gambar disamping ini

## Bottom Sheet
- Seperti dialog tetapi muncul dari bawah layar aplikasi
- Menggunakan fungsi bawaan flutter showModalBottomSheet
- Membutuhkan 2 properti, yaitu context dan builder

###  Cara Membuat Bottom Sheet
- TODO 20: (task_screen.dart) membuat Bottom Sheet
- TODO 21: buat file dart baru profile_sheet.dart di dalam folder components dan buat konten-konten nya
- TODO 22: (task_screen.dart) mengganti Container pada builder showModalBottomSheet menjadi ProfileSheet()
```dart 
builder: (context) => ProfileSheet(),
```