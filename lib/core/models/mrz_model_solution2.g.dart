// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mrz_model_solution2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MRZModelSolution2Adapter extends TypeAdapter<MRZModelSolution2> {
  @override
  final int typeId = 2;

  @override
  MRZModelSolution2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MRZModelSolution2(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MRZModelSolution2 obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.fullExtractedText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MRZModelSolution2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
