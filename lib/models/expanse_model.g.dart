// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expanse_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpanseModelAdapter extends TypeAdapter<ExpanseModel> {
  @override
  final int typeId = 0;

  @override
  ExpanseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpanseModel(
      transactionType: fields[3] as String,
      amount: fields[0] as int,
      type: fields[1] as String,
      doneTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ExpanseModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.doneTime)
      ..writeByte(3)
      ..write(obj.transactionType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpanseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
