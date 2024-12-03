import 'mahasiswa.dart';
import 'matakuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah;

  KRS(this.mahasiswa, this.daftarMataKuliah);

  void cetakKRS() {
    print('\n=== Kartu Rencana Studi ===');
    print('NIM: ${mahasiswa.nim}');
    print('Nama: ${mahasiswa.nama}');
    print('Semester: ${mahasiswa.semester}');

    if (daftarMataKuliah.isEmpty) {
      print('Belum ada mata kuliah yang dipilih.');
    } else {
      for (var mataKuliah in daftarMataKuliah) {
        print('${mataKuliah.kode}: ${mataKuliah.nama} (SKS: ${mataKuliah.sks})');
      }
    }
  }
}
