// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentUserModelAdapter extends TypeAdapter<CurrentUserModel> {
  @override
  final int typeId = 1;

  @override
  CurrentUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentUserModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      tokenId: fields[3] as String?,
      userType: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.tokenId)
      ..writeByte(4)
      ..write(obj.userType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
