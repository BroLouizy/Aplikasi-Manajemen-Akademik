import 'nilai.dart';

class Mahasiswa {
  String nim;
  String nama;
  int semester;
  List<Nilai> daftarNilai = [];

  Mahasiswa(this.nim, this.nama, this.semester);

  void tambahNilai(Nilai nilai) {
    daftarNilai.add(nilai);
    print("Nilai untuk ${nilai.mataKuliah.nama} berhasil ditambahkan.");
  }

  void cetakTranskrip() {
    print("\n=== Transkrip Nilai ===");
    print("NIM: $nim");
    print("Nama: $nama");
    print("Semester: $semester");

    if (daftarNilai.isEmpty) {
      print("Belum ada nilai yang tercatat.");
    } else {
      for (var nilai in daftarNilai) {
        nilai.tampilkanDetail();
      }
    }
  }

  double hitungIPK() {
    if (daftarNilai.isEmpty) return 0.0;

    double totalNilai = 0;
    int totalSKS = 0;

    for (var nilai in daftarNilai) {
      totalNilai += nilai.nilai * nilai.mataKuliah.sks;
      totalSKS += nilai.mataKuliah.sks;
    }

    return totalNilai / totalSKS;
  }
}
