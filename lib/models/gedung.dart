class Gedung {
  int kodeGedung;
  String namaGedung;

  Gedung({required this.kodeGedung, required this.namaGedung});

  factory Gedung.fromJson(Map<String, dynamic> json) {
    return Gedung(
      kodeGedung: json['kode_gedung'],
      namaGedung: json['nama_gedung'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kodeGedung'] = this.kodeGedung;
    data['namaGedung'] = this.namaGedung;
    return data;
  }
}
