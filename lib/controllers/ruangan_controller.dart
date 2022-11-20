import 'package:hive/hive.dart';
import 'package:my_app/models/models.dart';

class RuanganController {
  final Box<Ruangan> ruanganController;
  const RuanganController(this.ruanganController);

  // get box
  Box<Ruangan> get box => ruanganController;

  // Get All Ruangan
  List<Ruangan> getAllRuangan() {
    return ruanganController.values.toList();
  }

  // Get Ruangan by kodeRuangan
  Ruangan? getRuangan(String kodeRuangan) {
    return ruanganController.get(kodeRuangan);
  }

  // Get Ruangan by Gedung
  List<Ruangan> getRuanganByGedung(Gedung gedung) {
    if (gedung.kodeGedung == '') {
      return ruanganController.values.toList();
    }
    return ruanganController.values
        .where((ruangan) => ruangan.gedung.kodeGedung == gedung.kodeGedung)
        .toList();
  }

  // Add Ruangan
  Future<void> addRuangan(Ruangan ruangan) async {
    if (getRuangan(ruangan.kodeRuang) == null) {
      await ruanganController.put(ruangan.kodeRuang, ruangan);
    } else {
      throw Exception("Kode Ruangan sudah ada");
    }
  }

  // Update Ruangan
  Future<void> updateRuangan(Ruangan ruangan, String beforeKodeRuang) async {
    if (ruangan.kodeRuang == beforeKodeRuang) {
      await ruanganController.put(ruangan.kodeRuang, ruangan);
    } else if (getRuangan(ruangan.kodeRuang) == null) {
      await ruanganController.put(ruangan.kodeRuang, ruangan);
      await ruanganController.delete(beforeKodeRuang);
    } else {
      throw Exception("Kode Ruangan sudah ada");
    }
  }

  // Delete Ruangan
  void deleteRuangan(String kodeGedung) async {
    await ruanganController.delete(kodeGedung);
  }
}
