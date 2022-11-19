// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ruangan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RuanganAdapter extends TypeAdapter<Ruangan> {
  @override
  final int typeId = 1;

  @override
  Ruangan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ruangan(
      kodeRuangan: fields[0] as String,
      namaRuangan: fields[1] as String,
      kapasitasRuangan: fields[2] as int,
      kodeGedung: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Ruangan obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.kodeRuangan)
      ..writeByte(1)
      ..write(obj.namaRuangan)
      ..writeByte(2)
      ..write(obj.kapasitasRuangan)
      ..writeByte(3)
      ..write(obj.kodeGedung);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuanganAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
