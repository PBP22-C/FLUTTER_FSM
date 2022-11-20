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
      kodeRuang: fields[0] as String,
      namaRuang: fields[1] as String,
      kapasitas: fields[2] as int,
      gedung: fields[3] as Gedung,
    );
  }

  @override
  void write(BinaryWriter writer, Ruangan obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.kodeRuang)
      ..writeByte(1)
      ..write(obj.namaRuang)
      ..writeByte(2)
      ..write(obj.kapasitas)
      ..writeByte(3)
      ..write(obj.gedung);
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
