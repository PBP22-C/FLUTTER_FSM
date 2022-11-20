import 'package:hive/hive.dart';

part 'ruangan.g.dart';

@HiveType(typeId: 1)
class Ruangan {
  @HiveField(0)
  String kodeRuang;
  @HiveField(1)
  String namaRuang;
  @HiveField(2)
  int kapasitas;
  @HiveField(3)
  String kodeGedung;

  Ruangan(
      {required this.kodeRuang,
      required this.namaRuang,
      required this.kapasitas,
      required this.kodeGedung});

  factory Ruangan.fromJson(Map<String, dynamic> json) {
    return Ruangan(
      kodeRuang: json['kode_ruang'],
      namaRuang: json['nama_ruang'],
      kapasitas: json['kapasitas'],
      kodeGedung: json['kode_gedung'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kodeRuangan'] = this.kodeRuang;
    data['namaRuangan'] = this.namaRuang;
    data['kapasitasRuangan'] = this.kapasitas;
    data['kodeGedung'] = this.kodeGedung;
    return data;
  }
}
