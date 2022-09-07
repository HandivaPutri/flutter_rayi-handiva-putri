void main() {
  int angka = 10;
  int angka1 = 20;
  int angka2 = 30;
  print('Masukkan Angka Bilangan : $angka');
  print('Masukkan Angka Bilangan : $angka1');
  print('Masukkan Angka Bilangan : $angka2');
  print("hasil faktorial dari $angka adalah ${faktorial(10)}");
  print("hasil faktorial dari $angka1 adalah ${faktorial(20)}");
  print("hasil faktorial dari $angka2 adalah ${faktorial(30)}");
}

int faktorial(int a) {
  if (a == 0) {
    return 1;
  }
  return a * faktorial(a - 1);
}
