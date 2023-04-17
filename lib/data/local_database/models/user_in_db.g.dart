// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_in_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInformationInDatabaseAdapter
    extends TypeAdapter<UserInformationInDatabase> {
  @override
  final int typeId = 0;

  @override
  UserInformationInDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInformationInDatabase(
      user: fields[0] as UserModel,
      isBookmarked: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserInformationInDatabase obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.isBookmarked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInformationInDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
