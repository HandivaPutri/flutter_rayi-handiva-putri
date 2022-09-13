void main(List<String> args) {
  Matematika operation = Matematika();
  print('FPB : ');
  print(operation.hasilfpb(12, 16));
  print('KPK : ');
  print(operation.hasilkpk(12, 16));
}

class Matematika {
  hasilfpb(int x, int y) {
    int i;
    if (x > y) {
      i = x;
      x = y;
      y = i;
    }
    while (x > 0) {
      i = y % x;
      y = x;
      x = i;
    }
    return y;
  }

  hasilkpk(int x, int y) {
    int i;
    if (x > y) {
      i = x;
      x = y;
      y = i;
    }
    for (i = y; i % x != 0 || i % y != 0; i++);
    return i;
  }
}

class FPB extends Matematika {
  @override
  hasilfpb(int x, int y) {
    // TODO: implement hasilfpb
    return super.hasilfpb(x, y);
  }
}

class KPK extends Matematika {
  @override
  hasilkpk(int x, int y) {
    // TODO: implement hasilkpk
    return super.hasilkpk(x, y);
  }
}
