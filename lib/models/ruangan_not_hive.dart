import 'gedung.dart';

class Ruangan {
  final String kodeRuang;
  final String namaRuang;
  final int kapasitas;
  final Gedung gedung;

  Ruangan(
      {required this.kodeRuang,
      required this.namaRuang,
      required this.kapasitas,
      required this.gedung});
}
