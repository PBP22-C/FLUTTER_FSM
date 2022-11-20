import 'package:hive/hive.dart';
import 'package:my_app/models/models.dart';

class GedungController {
  final Box<Gedung> gedungController;
  const GedungController(this.gedungController);

  // Get box
  Box<Gedung> get box => gedungController;

  // Get All Gedung
  List<Gedung> getAllGedung() {
    return gedungController.values.toList();
  }

  // Get Gedung by kodeGedung
  Gedung? getGedung(String kodeGedung) {
    return gedungController.get(kodeGedung);
  }

  // Add Gedung
  Future<void> addGedung(Gedung gedung) async {
    if (getGedung(gedung.kodeGedung) == null) {
      await gedungController.put(gedung.kodeGedung, gedung);
    } else {
      throw Exception("Kode Gedung sudah ada");
    }
  }

  // Update Gedung
  void updateGedung(Gedung gedung) async {
    await gedungController.put(gedung.kodeGedung, gedung);
  }

  // Delete Gedung
  void deleteGedung(String kodeGedung) async {
    await gedungController.delete(kodeGedung);
  }
}
