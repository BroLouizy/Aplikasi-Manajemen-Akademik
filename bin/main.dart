import 'dart:io';
import '../lib/isi/krs.dart';
import '../lib/isi/mahasiswa.dart';
import '../lib/isi/matakuliah.dart';
import '../lib/isi/nilai.dart';

void main() {
  List<Mahasiswa> daftarMahasiswa = [];
  List<MataKuliah> daftarMataKuliah = [
    MataKuliah("IF101", "Pemrograman Dasar", 3),
    MataKuliah("IF102", "Matematika Komputer", 2),
    MataKuliah("IF103", "Struktur Data", 4),
  ];

  while (true) {
    print("\n=== Sistem Akademik ===");
    print("1. Tambah Mahasiswa");
    print("2. Tambah Mata Kuliah");
    print("3. Input Nilai Mahasiswa");
    print("4. Cetak KRS");
    print("5. Cetak Transkrip Nilai");
    print("6. Hitung IPK");
    print("7. Keluar");
    stdout.write("Pilih menu: ");
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case "1":
        stdout.write("Masukkan NIM: ");
        String nim = stdin.readLineSync()!;
        stdout.write("Masukkan Nama: ");
        String nama = stdin.readLineSync()!;
        stdout.write("Masukkan Semester: ");
        int semester = int.parse(stdin.readLineSync()!);
        daftarMahasiswa.add(Mahasiswa(nim, nama, semester));
        print("Mahasiswa berhasil ditambahkan!");
        break;

      case "2":
        stdout.write("Masukkan kode mata kuliah: ");
        String kode = stdin.readLineSync()!;
        stdout.write("Masukkan nama mata kuliah: ");
        String namaMataKuliah = stdin.readLineSync()!;
        stdout.write("Masukkan jumlah SKS: ");
        int sks = int.parse(stdin.readLineSync()!);
        daftarMataKuliah.add(MataKuliah(kode, namaMataKuliah, sks));
        print("Mata kuliah berhasil ditambahkan!");
        break;

      case "3":
        if (daftarMahasiswa.isEmpty) {
          print("Belum ada mahasiswa terdaftar.");
          break;
        }
        stdout.write("Masukkan NIM Mahasiswa: ");
        String nim = stdin.readLineSync()!;
        var mahasiswa = daftarMahasiswa.firstWhere(
            (m) => m.nim == nim, orElse: () => Mahasiswa("", "", 0));

        if (mahasiswa.nim.isEmpty) {
          print("Mahasiswa tidak ditemukan.");
          break;
        }

        for (int i = 0; i < daftarMataKuliah.length; i++) {
          print("${i + 1}. ${daftarMataKuliah[i].nama} (${daftarMataKuliah[i].sks} SKS)");
        }
        stdout.write("Pilih nomor mata kuliah: ");
        int index = int.parse(stdin.readLineSync()!) - 1;
        stdout.write("Masukkan nilai: ");
        double nilai = double.parse(stdin.readLineSync()!);

        mahasiswa.tambahNilai(Nilai(daftarMataKuliah[index], nilai));
        print("Nilai berhasil ditambahkan!");
        break;

      case "4":
        stdout.write("Masukkan NIM Mahasiswa: ");
        String nim = stdin.readLineSync()!;
        var mahasiswa = daftarMahasiswa.firstWhere(
            (m) => m.nim == nim, orElse: () => Mahasiswa("", "", 0));

        if (mahasiswa.nim.isEmpty) {
          print("Mahasiswa tidak ditemukan.");
          break;
        }

        var krs = KRS(mahasiswa, daftarMataKuliah);
        krs.cetakKRS();
        break;

      case "5":
        stdout.write("Masukkan NIM Mahasiswa: ");
        String nim = stdin.readLineSync()!;
        var mahasiswa = daftarMahasiswa.firstWhere(
            (m) => m.nim == nim, orElse: () => Mahasiswa("", "", 0));

        if (mahasiswa.nim.isEmpty) {
          print("Mahasiswa tidak ditemukan.");
          break;
        }

        mahasiswa.cetakTranskrip();
        break;

      case "6":
        stdout.write("Masukkan NIM Mahasiswa: ");
        String nim = stdin.readLineSync()!;
        var mahasiswa = daftarMahasiswa.firstWhere(
            (m) => m.nim == nim, orElse: () => Mahasiswa("", "", 0));

        if (mahasiswa.nim.isEmpty) {
          print("Mahasiswa tidak ditemukan.");
          break;
        }

        print("IPK: ${mahasiswa.hitungIPK()}");
        break;

      case "7":
        print("Sistem ditutup. Terima kasih!");
        exit(0);

      default:
        print("Pilihan tidak valid.");
    }
  }
}
