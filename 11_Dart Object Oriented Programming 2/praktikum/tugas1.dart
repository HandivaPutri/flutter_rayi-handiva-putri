class BangunRuang {
  int panjang = 10;
  int lebar = 5;
  int tinggi = 2;
  int sisi = 7;
  int? v;
  int? s;
  volume() {
    v = panjang * lebar * tinggi;
    return v;
  }

  volumekubus() {
    s = sisi * sisi * sisi;
    return s;
  }
}

class Balok extends BangunRuang {
  @override
  volume() {
    // TODO: implement volume
    return super.volume();
  }
}

class Kubus extends BangunRuang {
  @override
  volumekubus() {
    // TODO: implement volumekubus
    return super.volumekubus();
  }
}

void main(List<String> args) {
  BangunRuang bangun = BangunRuang();
  print('Volume balok : ');
  print(bangun.volume());
  print('Volume kubus : ');
  print(bangun.volumekubus());
}
