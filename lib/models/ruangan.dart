import 'package:hive/hive.dart';
import 'gedung.dart';
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
  Gedung gedung;

  Ruangan({
    required this.kodeRuang,
    required this.namaRuang,
    required this.kapasitas,
    required this.gedung,
  });

  factory Ruangan.fromJson(Map<String, dynamic> json) {
    return Ruangan(
      kodeRuang: json['kode_ruang'],
      namaRuang: json['nama_ruang'],
      kapasitas: json['kapasitas'],
      gedung: Gedung.fromJson(json['gedung']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kodeRuangan'] = kodeRuang;
    data['namaRuangan'] = namaRuang;
    data['kapasitasRuangan'] = kapasitas;
    data['gedung'] = gedung.toJson();
    return data;
  }
}
