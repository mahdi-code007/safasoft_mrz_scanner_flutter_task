// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mrz_model_solution1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MRZModelSolution1Adapter extends TypeAdapter<MRZModelSolution1> {
  @override
  final int typeId = 1;

  @override
  MRZModelSolution1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MRZModelSolution1(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MRZModelSolution1 obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.countryCode)
      ..writeByte(3)
      ..write(obj.dateOfBirth)
      ..writeByte(4)
      ..write(obj.expiryDate)
      ..writeByte(5)
      ..write(obj.docNumber)
      ..writeByte(6)
      ..write(obj.docType)
      ..writeByte(7)
      ..write(obj.personalNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MRZModelSolution1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
