import 'package:hive/hive.dart';

part 'ruangan.g.dart';

@HiveType(typeId: 1)
class Ruangan {
  @HiveField(0)
  String kodeRuangan;
  @HiveField(1)
  String namaRuangan;
  @HiveField(2)
  int kapasitasRuangan;
  @HiveField(3)
  String kodeGedung;

  Ruangan(
      {required this.kodeRuangan,
      required this.namaRuangan,
      required this.kapasitasRuangan,
      required this.kodeGedung});

  factory Ruangan.fromJson(Map<String, dynamic> json) {
    return Ruangan(
      kodeRuangan: json['kode_ruangan'],
      namaRuangan: json['nama_ruangan'],
      kapasitasRuangan: json['kapasitas_ruangan'],
      kodeGedung: json['kode_gedung'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kodeRuangan'] = this.kodeRuangan;
    data['namaRuangan'] = this.namaRuangan;
    data['kapasitasRuangan'] = this.kapasitasRuangan;
    data['kodeGedung'] = this.kodeGedung;
    return data;
  }
}
