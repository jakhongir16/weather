// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteHistoryAdapter extends TypeAdapter<FavouriteHistory> {
  @override
  final int typeId = 0;

  @override
  FavouriteHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteHistory(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.bg)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
