class Hewan {
  int berat = 10;
}

class Mobil {
  int kapasitas = 100;
  List muatan = ['Sapi', 'Domba', 'Kambing'];

  void tambahMuatan(int totalMuatan, int kapasitas) {
    if (totalMuatan < kapasitas) {}
  }

  int totalMuatan(int berat, int muatan) {
    return berat * muatan;
  }
}

void main(List<String> args) {
  print('Berat badan hewan adalah : ');
  Hewan h1 = Hewan();
  print(h1.berat);
  print('Total berat maksimum muatan : ');
  Mobil h2 = Mobil();
  print(h2.kapasitas);
  print('List data hewan muatan : ');
  print(h2.muatan);
  print('Total Muatan : ');
  print(h1.berat * h2.kapasitas);
}
