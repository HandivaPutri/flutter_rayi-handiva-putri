class Hewan {
  int berat = 10;
}

class Mobil {
  int kapasitas = 100;
  List<String> muatan = ['Sapi', 'Domba', 'Kambing'];

  void tambahMuatan(int muatan, int kapasitas) {
    if (muatan < kapasitas) {}
  }
}

void main(List<String> args) {
  print('Berat badan hewan adalah : ');
  var h1 = Hewan();
  print(h1.berat);
  print('Total berat maksimum muatan : ');
  var h2 = Mobil();
  print(h2.kapasitas);
  print('List data hewan muatan : ');
  print(h2.muatan);
}
