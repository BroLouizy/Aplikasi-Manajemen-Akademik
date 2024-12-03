import 'matakuliah.dart';

class Nilai {
  MataKuliah mataKuliah;
  double nilai;

  Nilai(this.mataKuliah, this.nilai);

  void tampilkanDetail() {
    print('${mataKuliah.nama} (Kode: ${mataKuliah.kode}, SKS: ${mataKuliah.sks}): $nilai');
  }
}
