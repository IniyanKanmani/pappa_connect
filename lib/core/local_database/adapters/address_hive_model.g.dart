// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/address_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressHiveModelAdapter extends TypeAdapter<AddressHiveModel> {
  @override
  final int typeId = 0;

  @override
  AddressHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressHiveModel(
      uid: fields[0] as String?,
      street: fields[1] as String?,
      flat: fields[2] as String?,
      city: fields[3] as String?,
      county: fields[4] as String?,
      postcode: fields[5] as String?,
      voterIds: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AddressHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.street)
      ..writeByte(2)
      ..write(obj.flat)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.county)
      ..writeByte(5)
      ..write(obj.postcode)
      ..writeByte(6)
      ..write(obj.voterIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
