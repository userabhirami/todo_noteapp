// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotemodelAdapter extends TypeAdapter<Notemodel> {
  @override
  final int typeId = 1;

  @override
  Notemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notemodel(
      title: fields[0] as String,
      date: fields[1] as String,
      description: fields[2] as String,
      color: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Notemodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
