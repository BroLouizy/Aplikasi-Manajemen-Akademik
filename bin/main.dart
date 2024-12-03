import 'dart:io'; // Mengimpor library untuk input dan output
import '../lib/isi/krs.dart'; // Mengimpor file krs.dart yang berisi kelas KRS
import '../lib/isi/mahasiswa.dart'; // Mengimpor file mahasiswa.dart yang berisi kelas Mahasiswa
import '../lib/isi/matakuliah.dart'; // Mengimpor file matakuliah.dart yang berisi kelas MataKuliah
import '../lib/isi/nilai.dart'; // Mengimpor file nilai.dart yang berisi kelas Nilai

void main() {
  // Deklarasi daftar mahasiswa dan mata kuliah yang terdaftar
  List<Mahasiswa> daftarMahasiswa = []; 
  List<MataKuliah> daftarMataKuliah = [
    MataKuliah("IF101", "Pemrograman Dasar", 3), // Menambahkan mata kuliah dengan kode, nama dan SKS
    MataKuliah("IF102", "Matematika Komputer", 2),
    MataKuliah("IF103", "Struktur Data", 4),
  ];

  // Loop utama untuk menampilkan menu dan menerima pilihan dari pengguna
  while (true) {
    // Menampilkan pilihan menu
    print("\n=== Sistem Akademik ===");
    print("1. Tambah Mahasiswa");
    print("2. Tambah Mata Kuliah");
    print("3. Input Nilai Mahasiswa");
    print("4. Cetak KRS");
    print("5. Cetak Transkrip Nilai");
    print("6. Hitung IPK");
    print("7. Keluar");
    stdout.write("Pilih menu: "); // Menampilkan prompt untuk memilih menu
    String? pilihan = stdin.readLineSync(); // Membaca input pilihan menu dari pengguna

    // Switch untuk menangani pilihan menu
    switch (pilihan) {
      case "1": // Case 1: Menambahkan Mahasiswa
        stdout.write("Masukkan NIM: "); // Input NIM mahasiswa
        String nim = stdin.readLineSync()!;
        stdout.write("Masukkan Nama: "); // Input nama mahasiswa
        String nama = stdin.readLineSync()!;
        stdout.write("Masukkan Semester: "); // Input semester mahasiswa
        int semester = int.parse(stdin.readLineSync()!);
        daftarMahasiswa.add(Mahasiswa(nim, nama, semester)); // Menambahkan mahasiswa ke daftar
        print("Mahasiswa berhasil ditambahkan!"); // Menampilkan pesan berhasil
        break;

      case "2": // Case 2: Menambahkan Mata Kuliah
        stdout.write("Masukkan kode mata kuliah: "); // Input kode mata kuliah
        String kode = stdin.readLineSync()!;
        stdout.write("Masukkan nama mata kuliah: "); // Input nama mata kuliah
        String namaMataKuliah = stdin.readLineSync()!;
        stdout.write("Masukkan jumlah SKS: "); // Input jumlah SKS
        int sks = int.parse(stdin.readLineSync()!);
        daftarMataKuliah.add(MataKuliah(kode, namaMataKuliah, sks)); // Menambahkan mata kuliah ke daftar
        print("Mata kuliah berhasil ditambahkan!"); // Menampilkan pesan berhasil
        break;

      case "3": // Case 3: Input Nilai Mahasiswa
        if (daftarMahasiswa.isEmpty) { // Mengecek apakah daftar mahasiswa kosong
          print("Belum ada mahasiswa terdaftar."); // Menampilkan pesan jika tidak ada mahasiswa
          break;
        }
        stdout.write("Masukkan NIM Mahasiswa: "); // Input NIM mahasiswa
        String nim = stdin.readLineSync()!;
        var mahasiswa = daftarMahasiswa.firstWhere( // Mencari mahasiswa berdasarkan NIM
          (m) => m.nim == nim, orElse: () => Mahasiswa("", "", 0)
        );

        if (mahasiswa.nim.isEmpty) { // Mengecek apakah mahasiswa ditemukan
          print("Mahasiswa tidak ditemukan."); // Menampilkan pesan jika mahasiswa tidak ditemukan
          break;
        }

        // Menampilkan daftar mata kuliah yang tersedia
        for (int i = 0; i < daftarMataKuliah.length; i++) {
          print("${i + 1}. ${daftarMataKuliah[i].nama} (${daftarMataKuliah[i].sks} SKS)");
        }
        stdout.write("Pilih nomor mata kuliah: "); // Input nomor mata kuliah yang dipilih
        int index = int.parse(stdin.readLineSync()!) - 1;
        stdout.write("Masukkan nilai: "); // Input nilai mahasiswa untuk mata kuliah
        double nilai = double.parse(stdin.readLineSync()!);

        mahasiswa.tambahNilai(Nilai(daftarMataKuliah[index], nilai)); // Menambahkan nilai pada mahasiswa
        print("Nilai berhasil ditambahkan!"); // Menampilkan pesan berhasil
        break;

      case "4": // Case 4: Cetak KRS Mahasiswa
        stdout.write("Masukkan NIM Mahasiswa: "); // Input NIM mahasiswa
        String nim = stdin.readLineSync()!;
        var mahasiswa = daftarMahasiswa.firstWhere( // Mencari mahasiswa berdasarkan NIM
          (m) => m.nim == nim, orElse: () => Mahasiswa("", "", 0)
        );

        if (mahasiswa.nim.isEmpty) { // Mengecek apakah mahasiswa ditemukan
          print("Mahasiswa tidak ditemukan."); // Menampilkan pesan jika mahasiswa tidak ditemukan
          break;
        }

        var krs = KRS(mahasiswa, daftarMataKuliah); // Membuat objek KRS
        krs.cetakKRS(); // Menampilkan KRS mahasiswa
        break;

      case "5": // Case 5: Cetak Transkrip Nilai Mahasiswa
        stdout.write("Masukkan NIM Mahasiswa: "); // Input NIM mahasiswa
        String nim = stdin.readLineSync()!;
        var mahasiswa = daftarMahasiswa.firstWhere( // Mencari mahasiswa berdasarkan NIM
          (m) => m.nim == nim, orElse: () => Mahasiswa("", "", 0)
        );

        if (mahasiswa.nim.isEmpty) { // Mengecek apakah mahasiswa ditemukan
          print("Mahasiswa tidak ditemukan."); // Menampilkan pesan jika mahasiswa tidak ditemukan
          break;
        }

        mahasiswa.cetakTranskrip(); // Menampilkan transkrip nilai mahasiswa
        break;

      case "6": // Case 6: Hitung IPK Mahasiswa
        stdout.write("Masukkan NIM Mahasiswa: "); // Input NIM mahasiswa
        String nim = stdin.readLineSync()!;
        var mahasiswa = daftarMahasiswa.firstWhere( // Mencari mahasiswa berdasarkan NIM
          (m) => m.nim == nim, orElse: () => Mahasiswa("", "", 0)
        );

        if (mahasiswa.nim.isEmpty) { // Mengecek apakah mahasiswa ditemukan
          print("Mahasiswa tidak ditemukan."); // Menampilkan pesan jika mahasiswa tidak ditemukan
          break;
        }

        print("IPK: ${mahasiswa.hitungIPK()}"); // Menampilkan hasil perhitungan IPK mahasiswa
        break;

      case "7": // Case 7: Keluar dari Program
        print("Sistem ditutup. Terima kasih!"); // Menampilkan pesan penutupan
        exit(0); // Keluar dari program

      default: // Default case untuk pilihan yang tidak valid
        print("Pilihan tidak valid."); // Menampilkan pesan jika pilihan menu tidak valid
    }
  }
}