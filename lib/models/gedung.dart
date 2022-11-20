import 'package:hive/hive.dart';

part 'gedung.g.dart';

@HiveType(typeId: 0)
class Gedung {
  @HiveField(0)
  final String kodeGedung;
  @HiveField(1)
  final String namaGedung;

  const Gedung({required this.kodeGedung, required this.namaGedung});

  factory Gedung.fromJson(Map<String, dynamic> json) {
    return Gedung(
      kodeGedung: json['kode_gedung'],
      namaGedung: json['nama_gedung'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kodeGedung'] = kodeGedung;
    data['namaGedung'] = namaGedung;
    return data;
  }
}
