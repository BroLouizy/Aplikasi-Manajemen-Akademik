class MataKuliah {
  String kode;
  String nama;
  int sks;

  MataKuliah(this.kode, this.nama, this.sks);

  void tampilkanInfo() {
    print('Mata Kuliah: $nama, Kode: $kode, SKS: $sks');
  }
}
