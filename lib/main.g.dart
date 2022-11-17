part of 'main.dart';

class GedungAdapter extends TypeAdapter<Gedung> {
  @override
  final int typeId = 0;

  @override
  Gedung read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Gedung(
          kodeGedung: reader.readString(),
          namaGedung: reader.readString(),
        );
      default:
        return Gedung(
          kodeGedung: '',
          namaGedung: '',
        );
    }
  }

  @override
  void write(BinaryWriter writer, Gedung obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..writeString(obj.kodeGedung)
      ..writeByte(1)
      ..writeString(obj.namaGedung);
  }
}
