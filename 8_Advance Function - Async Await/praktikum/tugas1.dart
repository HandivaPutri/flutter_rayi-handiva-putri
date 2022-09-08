Future<List> kali(a, b) {
  var penggali = [];
  return Future.delayed(Duration(seconds: 1), () {
    for (var i in a) {
      print(i * b);
    }
    return penggali;
  });
}

void main() async {
  var list = [1, 2, 3, 4, 5];
  var dikalikan = 3;
  print('Angka Bilangan : ');
  print(list);
  print('Hasil dari dikalikan dengan angka bilangan : ');
  var data = await kali(list, dikalikan);
  print(data);
}
