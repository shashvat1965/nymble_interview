// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PetAdapter extends TypeAdapter<Pet> {
  @override
  final int typeId = 1;

  @override
  Pet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pet(
      name: fields[4] as String,
      price: fields[5] as int,
      image: fields[2] as String,
      age: fields[3] as int,
      isAdopted: fields[1] as bool,
      id: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Pet obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.isAdopted)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PetListAdapter extends TypeAdapter<PetList> {
  @override
  final int typeId = 2;

  @override
  PetList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PetList(
      petList: (fields[1] as List).cast<Pet>(),
    );
  }

  @override
  void write(BinaryWriter writer, PetList obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.petList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
