class Kamus {
  String judul, isi, id;

  Kamus(this.judul, this.isi, this.id);

  Kamus.fromJson(Map<String, dynamic> json) {
    judul = json['judul'];
    isi = json['isi'];
    id = json['id'];
  }
}
