# (09) Branching, Looping, Function 
## Data Diri
Nomor Urut : 1_019FLC_34

Nama : Rayi Handiva Putri

### Collection
> **Collection** adalah kumpulan data pada satu tempat.

### List
> **List** adalah Menyimpan data (elemen) secara berbaris. 

Contoh : 
```
void main() async {
    var scores = [60, 80, 90, 70, 85]; 
    print(scores);

    for(var score in scores) {
        print(score);
    }
}
```

### Map
> **Map** adalah Menyimpan data secara key-value Key berguna selayaknya index pada list.

Contoh : 
```
void main() async {
    
    var student = {
        'name': 'Alex Under',
        'age': 16
    };
    print(student);
    
    for(var key in student.keys) {
        print(student[key]);
    }
}