// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gedung.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GedungAdapter extends TypeAdapter<Gedung> {
  @override
  final int typeId = 0;

  @override
  Gedung read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Gedung(
      kodeGedung: fields[0] as String,
      namaGedung: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Gedung obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.kodeGedung)
      ..writeByte(1)
      ..write(obj.namaGedung);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GedungAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
