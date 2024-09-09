// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ItemMasterDBTable extends ItemMasterDB
    with TableInfo<$ItemMasterDBTable, ItemMasterDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemMasterDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _item_idMeta =
      const VerificationMeta('item_id');
  @override
  late final GeneratedColumn<int> item_id = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ItemCodeMeta =
      const VerificationMeta('ItemCode');
  @override
  late final GeneratedColumn<String> ItemCode = GeneratedColumn<String>(
      'item_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ItemNameMeta =
      const VerificationMeta('ItemName');
  @override
  late final GeneratedColumn<String> ItemName = GeneratedColumn<String>(
      'item_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ItemDescriptionMeta =
      const VerificationMeta('ItemDescription');
  @override
  late final GeneratedColumn<String> ItemDescription = GeneratedColumn<String>(
      'item_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _SerialNumberMeta =
      const VerificationMeta('SerialNumber');
  @override
  late final GeneratedColumn<String> SerialNumber = GeneratedColumn<String>(
      'serial_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _QuantityMeta =
      const VerificationMeta('Quantity');
  @override
  late final GeneratedColumn<String> Quantity = GeneratedColumn<String>(
      'quantity', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _Udf01Meta = const VerificationMeta('Udf01');
  @override
  late final GeneratedColumn<String> Udf01 = GeneratedColumn<String>(
      'udf01', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _Udf02Meta = const VerificationMeta('Udf02');
  @override
  late final GeneratedColumn<String> Udf02 = GeneratedColumn<String>(
      'udf02', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _Udf03Meta = const VerificationMeta('Udf03');
  @override
  late final GeneratedColumn<String> Udf03 = GeneratedColumn<String>(
      'udf03', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _Udf04Meta = const VerificationMeta('Udf04');
  @override
  late final GeneratedColumn<String> Udf04 = GeneratedColumn<String>(
      'udf04', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _Udf05Meta = const VerificationMeta('Udf05');
  @override
  late final GeneratedColumn<String> Udf05 = GeneratedColumn<String>(
      'udf05', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        item_id,
        ItemCode,
        ItemName,
        ItemDescription,
        SerialNumber,
        Quantity,
        Udf01,
        Udf02,
        Udf03,
        Udf04,
        Udf05
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_master_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<ItemMasterDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(_item_idMeta,
          item_id.isAcceptableOrUnknown(data['item_id']!, _item_idMeta));
    }
    if (data.containsKey('item_code')) {
      context.handle(_ItemCodeMeta,
          ItemCode.isAcceptableOrUnknown(data['item_code']!, _ItemCodeMeta));
    }
    if (data.containsKey('item_name')) {
      context.handle(_ItemNameMeta,
          ItemName.isAcceptableOrUnknown(data['item_name']!, _ItemNameMeta));
    }
    if (data.containsKey('item_description')) {
      context.handle(
          _ItemDescriptionMeta,
          ItemDescription.isAcceptableOrUnknown(
              data['item_description']!, _ItemDescriptionMeta));
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _SerialNumberMeta,
          SerialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _SerialNumberMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_QuantityMeta,
          Quantity.isAcceptableOrUnknown(data['quantity']!, _QuantityMeta));
    }
    if (data.containsKey('udf01')) {
      context.handle(
          _Udf01Meta, Udf01.isAcceptableOrUnknown(data['udf01']!, _Udf01Meta));
    }
    if (data.containsKey('udf02')) {
      context.handle(
          _Udf02Meta, Udf02.isAcceptableOrUnknown(data['udf02']!, _Udf02Meta));
    }
    if (data.containsKey('udf03')) {
      context.handle(
          _Udf03Meta, Udf03.isAcceptableOrUnknown(data['udf03']!, _Udf03Meta));
    }
    if (data.containsKey('udf04')) {
      context.handle(
          _Udf04Meta, Udf04.isAcceptableOrUnknown(data['udf04']!, _Udf04Meta));
    }
    if (data.containsKey('udf05')) {
      context.handle(
          _Udf05Meta, Udf05.isAcceptableOrUnknown(data['udf05']!, _Udf05Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {item_id};
  @override
  ItemMasterDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemMasterDBData(
      item_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      ItemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_code']),
      ItemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name']),
      ItemDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}item_description']),
      SerialNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serial_number']),
      Quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quantity']),
      Udf01: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf01']),
      Udf02: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf02']),
      Udf03: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf03']),
      Udf04: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf04']),
      Udf05: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf05']),
    );
  }

  @override
  $ItemMasterDBTable createAlias(String alias) {
    return $ItemMasterDBTable(attachedDatabase, alias);
  }
}

class ItemMasterDBData extends DataClass
    implements Insertable<ItemMasterDBData> {
  final int item_id;
  final String? ItemCode;
  final String? ItemName;
  final String? ItemDescription;
  final String? SerialNumber;
  final String? Quantity;
  final String? Udf01;
  final String? Udf02;
  final String? Udf03;
  final String? Udf04;
  final String? Udf05;
  const ItemMasterDBData(
      {required this.item_id,
      this.ItemCode,
      this.ItemName,
      this.ItemDescription,
      this.SerialNumber,
      this.Quantity,
      this.Udf01,
      this.Udf02,
      this.Udf03,
      this.Udf04,
      this.Udf05});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<int>(item_id);
    if (!nullToAbsent || ItemCode != null) {
      map['item_code'] = Variable<String>(ItemCode);
    }
    if (!nullToAbsent || ItemName != null) {
      map['item_name'] = Variable<String>(ItemName);
    }
    if (!nullToAbsent || ItemDescription != null) {
      map['item_description'] = Variable<String>(ItemDescription);
    }
    if (!nullToAbsent || SerialNumber != null) {
      map['serial_number'] = Variable<String>(SerialNumber);
    }
    if (!nullToAbsent || Quantity != null) {
      map['quantity'] = Variable<String>(Quantity);
    }
    if (!nullToAbsent || Udf01 != null) {
      map['udf01'] = Variable<String>(Udf01);
    }
    if (!nullToAbsent || Udf02 != null) {
      map['udf02'] = Variable<String>(Udf02);
    }
    if (!nullToAbsent || Udf03 != null) {
      map['udf03'] = Variable<String>(Udf03);
    }
    if (!nullToAbsent || Udf04 != null) {
      map['udf04'] = Variable<String>(Udf04);
    }
    if (!nullToAbsent || Udf05 != null) {
      map['udf05'] = Variable<String>(Udf05);
    }
    return map;
  }

  ItemMasterDBCompanion toCompanion(bool nullToAbsent) {
    return ItemMasterDBCompanion(
      item_id: Value(item_id),
      ItemCode: ItemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(ItemCode),
      ItemName: ItemName == null && nullToAbsent
          ? const Value.absent()
          : Value(ItemName),
      ItemDescription: ItemDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(ItemDescription),
      SerialNumber: SerialNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(SerialNumber),
      Quantity: Quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(Quantity),
      Udf01:
          Udf01 == null && nullToAbsent ? const Value.absent() : Value(Udf01),
      Udf02:
          Udf02 == null && nullToAbsent ? const Value.absent() : Value(Udf02),
      Udf03:
          Udf03 == null && nullToAbsent ? const Value.absent() : Value(Udf03),
      Udf04:
          Udf04 == null && nullToAbsent ? const Value.absent() : Value(Udf04),
      Udf05:
          Udf05 == null && nullToAbsent ? const Value.absent() : Value(Udf05),
    );
  }

  factory ItemMasterDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemMasterDBData(
      item_id: serializer.fromJson<int>(json['item_id']),
      ItemCode: serializer.fromJson<String?>(json['ItemCode']),
      ItemName: serializer.fromJson<String?>(json['ItemName']),
      ItemDescription: serializer.fromJson<String?>(json['ItemDescription']),
      SerialNumber: serializer.fromJson<String?>(json['SerialNumber']),
      Quantity: serializer.fromJson<String?>(json['Quantity']),
      Udf01: serializer.fromJson<String?>(json['Udf01']),
      Udf02: serializer.fromJson<String?>(json['Udf02']),
      Udf03: serializer.fromJson<String?>(json['Udf03']),
      Udf04: serializer.fromJson<String?>(json['Udf04']),
      Udf05: serializer.fromJson<String?>(json['Udf05']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'item_id': serializer.toJson<int>(item_id),
      'ItemCode': serializer.toJson<String?>(ItemCode),
      'ItemName': serializer.toJson<String?>(ItemName),
      'ItemDescription': serializer.toJson<String?>(ItemDescription),
      'SerialNumber': serializer.toJson<String?>(SerialNumber),
      'Quantity': serializer.toJson<String?>(Quantity),
      'Udf01': serializer.toJson<String?>(Udf01),
      'Udf02': serializer.toJson<String?>(Udf02),
      'Udf03': serializer.toJson<String?>(Udf03),
      'Udf04': serializer.toJson<String?>(Udf04),
      'Udf05': serializer.toJson<String?>(Udf05),
    };
  }

  ItemMasterDBData copyWith(
          {int? item_id,
          Value<String?> ItemCode = const Value.absent(),
          Value<String?> ItemName = const Value.absent(),
          Value<String?> ItemDescription = const Value.absent(),
          Value<String?> SerialNumber = const Value.absent(),
          Value<String?> Quantity = const Value.absent(),
          Value<String?> Udf01 = const Value.absent(),
          Value<String?> Udf02 = const Value.absent(),
          Value<String?> Udf03 = const Value.absent(),
          Value<String?> Udf04 = const Value.absent(),
          Value<String?> Udf05 = const Value.absent()}) =>
      ItemMasterDBData(
        item_id: item_id ?? this.item_id,
        ItemCode: ItemCode.present ? ItemCode.value : this.ItemCode,
        ItemName: ItemName.present ? ItemName.value : this.ItemName,
        ItemDescription: ItemDescription.present
            ? ItemDescription.value
            : this.ItemDescription,
        SerialNumber:
            SerialNumber.present ? SerialNumber.value : this.SerialNumber,
        Quantity: Quantity.present ? Quantity.value : this.Quantity,
        Udf01: Udf01.present ? Udf01.value : this.Udf01,
        Udf02: Udf02.present ? Udf02.value : this.Udf02,
        Udf03: Udf03.present ? Udf03.value : this.Udf03,
        Udf04: Udf04.present ? Udf04.value : this.Udf04,
        Udf05: Udf05.present ? Udf05.value : this.Udf05,
      );
  ItemMasterDBData copyWithCompanion(ItemMasterDBCompanion data) {
    return ItemMasterDBData(
      item_id: data.item_id.present ? data.item_id.value : this.item_id,
      ItemCode: data.ItemCode.present ? data.ItemCode.value : this.ItemCode,
      ItemName: data.ItemName.present ? data.ItemName.value : this.ItemName,
      ItemDescription: data.ItemDescription.present
          ? data.ItemDescription.value
          : this.ItemDescription,
      SerialNumber: data.SerialNumber.present
          ? data.SerialNumber.value
          : this.SerialNumber,
      Quantity: data.Quantity.present ? data.Quantity.value : this.Quantity,
      Udf01: data.Udf01.present ? data.Udf01.value : this.Udf01,
      Udf02: data.Udf02.present ? data.Udf02.value : this.Udf02,
      Udf03: data.Udf03.present ? data.Udf03.value : this.Udf03,
      Udf04: data.Udf04.present ? data.Udf04.value : this.Udf04,
      Udf05: data.Udf05.present ? data.Udf05.value : this.Udf05,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemMasterDBData(')
          ..write('item_id: $item_id, ')
          ..write('ItemCode: $ItemCode, ')
          ..write('ItemName: $ItemName, ')
          ..write('ItemDescription: $ItemDescription, ')
          ..write('SerialNumber: $SerialNumber, ')
          ..write('Quantity: $Quantity, ')
          ..write('Udf01: $Udf01, ')
          ..write('Udf02: $Udf02, ')
          ..write('Udf03: $Udf03, ')
          ..write('Udf04: $Udf04, ')
          ..write('Udf05: $Udf05')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(item_id, ItemCode, ItemName, ItemDescription,
      SerialNumber, Quantity, Udf01, Udf02, Udf03, Udf04, Udf05);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemMasterDBData &&
          other.item_id == this.item_id &&
          other.ItemCode == this.ItemCode &&
          other.ItemName == this.ItemName &&
          other.ItemDescription == this.ItemDescription &&
          other.SerialNumber == this.SerialNumber &&
          other.Quantity == this.Quantity &&
          other.Udf01 == this.Udf01 &&
          other.Udf02 == this.Udf02 &&
          other.Udf03 == this.Udf03 &&
          other.Udf04 == this.Udf04 &&
          other.Udf05 == this.Udf05);
}

class ItemMasterDBCompanion extends UpdateCompanion<ItemMasterDBData> {
  final Value<int> item_id;
  final Value<String?> ItemCode;
  final Value<String?> ItemName;
  final Value<String?> ItemDescription;
  final Value<String?> SerialNumber;
  final Value<String?> Quantity;
  final Value<String?> Udf01;
  final Value<String?> Udf02;
  final Value<String?> Udf03;
  final Value<String?> Udf04;
  final Value<String?> Udf05;
  const ItemMasterDBCompanion({
    this.item_id = const Value.absent(),
    this.ItemCode = const Value.absent(),
    this.ItemName = const Value.absent(),
    this.ItemDescription = const Value.absent(),
    this.SerialNumber = const Value.absent(),
    this.Quantity = const Value.absent(),
    this.Udf01 = const Value.absent(),
    this.Udf02 = const Value.absent(),
    this.Udf03 = const Value.absent(),
    this.Udf04 = const Value.absent(),
    this.Udf05 = const Value.absent(),
  });
  ItemMasterDBCompanion.insert({
    this.item_id = const Value.absent(),
    this.ItemCode = const Value.absent(),
    this.ItemName = const Value.absent(),
    this.ItemDescription = const Value.absent(),
    this.SerialNumber = const Value.absent(),
    this.Quantity = const Value.absent(),
    this.Udf01 = const Value.absent(),
    this.Udf02 = const Value.absent(),
    this.Udf03 = const Value.absent(),
    this.Udf04 = const Value.absent(),
    this.Udf05 = const Value.absent(),
  });
  static Insertable<ItemMasterDBData> custom({
    Expression<int>? item_id,
    Expression<String>? ItemCode,
    Expression<String>? ItemName,
    Expression<String>? ItemDescription,
    Expression<String>? SerialNumber,
    Expression<String>? Quantity,
    Expression<String>? Udf01,
    Expression<String>? Udf02,
    Expression<String>? Udf03,
    Expression<String>? Udf04,
    Expression<String>? Udf05,
  }) {
    return RawValuesInsertable({
      if (item_id != null) 'item_id': item_id,
      if (ItemCode != null) 'item_code': ItemCode,
      if (ItemName != null) 'item_name': ItemName,
      if (ItemDescription != null) 'item_description': ItemDescription,
      if (SerialNumber != null) 'serial_number': SerialNumber,
      if (Quantity != null) 'quantity': Quantity,
      if (Udf01 != null) 'udf01': Udf01,
      if (Udf02 != null) 'udf02': Udf02,
      if (Udf03 != null) 'udf03': Udf03,
      if (Udf04 != null) 'udf04': Udf04,
      if (Udf05 != null) 'udf05': Udf05,
    });
  }

  ItemMasterDBCompanion copyWith(
      {Value<int>? item_id,
      Value<String?>? ItemCode,
      Value<String?>? ItemName,
      Value<String?>? ItemDescription,
      Value<String?>? SerialNumber,
      Value<String?>? Quantity,
      Value<String?>? Udf01,
      Value<String?>? Udf02,
      Value<String?>? Udf03,
      Value<String?>? Udf04,
      Value<String?>? Udf05}) {
    return ItemMasterDBCompanion(
      item_id: item_id ?? this.item_id,
      ItemCode: ItemCode ?? this.ItemCode,
      ItemName: ItemName ?? this.ItemName,
      ItemDescription: ItemDescription ?? this.ItemDescription,
      SerialNumber: SerialNumber ?? this.SerialNumber,
      Quantity: Quantity ?? this.Quantity,
      Udf01: Udf01 ?? this.Udf01,
      Udf02: Udf02 ?? this.Udf02,
      Udf03: Udf03 ?? this.Udf03,
      Udf04: Udf04 ?? this.Udf04,
      Udf05: Udf05 ?? this.Udf05,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (item_id.present) {
      map['item_id'] = Variable<int>(item_id.value);
    }
    if (ItemCode.present) {
      map['item_code'] = Variable<String>(ItemCode.value);
    }
    if (ItemName.present) {
      map['item_name'] = Variable<String>(ItemName.value);
    }
    if (ItemDescription.present) {
      map['item_description'] = Variable<String>(ItemDescription.value);
    }
    if (SerialNumber.present) {
      map['serial_number'] = Variable<String>(SerialNumber.value);
    }
    if (Quantity.present) {
      map['quantity'] = Variable<String>(Quantity.value);
    }
    if (Udf01.present) {
      map['udf01'] = Variable<String>(Udf01.value);
    }
    if (Udf02.present) {
      map['udf02'] = Variable<String>(Udf02.value);
    }
    if (Udf03.present) {
      map['udf03'] = Variable<String>(Udf03.value);
    }
    if (Udf04.present) {
      map['udf04'] = Variable<String>(Udf04.value);
    }
    if (Udf05.present) {
      map['udf05'] = Variable<String>(Udf05.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemMasterDBCompanion(')
          ..write('item_id: $item_id, ')
          ..write('ItemCode: $ItemCode, ')
          ..write('ItemName: $ItemName, ')
          ..write('ItemDescription: $ItemDescription, ')
          ..write('SerialNumber: $SerialNumber, ')
          ..write('Quantity: $Quantity, ')
          ..write('Udf01: $Udf01, ')
          ..write('Udf02: $Udf02, ')
          ..write('Udf03: $Udf03, ')
          ..write('Udf04: $Udf04, ')
          ..write('Udf05: $Udf05')
          ..write(')'))
        .toString();
  }
}

class $LocationMasterDBTable extends LocationMasterDB
    with TableInfo<$LocationMasterDBTable, LocationMasterDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationMasterDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _location_idMeta =
      const VerificationMeta('location_id');
  @override
  late final GeneratedColumn<int> location_id = GeneratedColumn<int>(
      'location_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _location_codeMeta =
      const VerificationMeta('location_code');
  @override
  late final GeneratedColumn<String> location_code = GeneratedColumn<String>(
      'location_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _location_nameMeta =
      const VerificationMeta('location_name');
  @override
  late final GeneratedColumn<String> location_name = GeneratedColumn<String>(
      'location_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _location_descMeta =
      const VerificationMeta('location_desc');
  @override
  late final GeneratedColumn<String> location_desc = GeneratedColumn<String>(
      'location_desc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [location_id, location_code, location_name, location_desc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_master_d_b';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocationMasterDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('location_id')) {
      context.handle(
          _location_idMeta,
          location_id.isAcceptableOrUnknown(
              data['location_id']!, _location_idMeta));
    }
    if (data.containsKey('location_code')) {
      context.handle(
          _location_codeMeta,
          location_code.isAcceptableOrUnknown(
              data['location_code']!, _location_codeMeta));
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _location_nameMeta,
          location_name.isAcceptableOrUnknown(
              data['location_name']!, _location_nameMeta));
    }
    if (data.containsKey('location_desc')) {
      context.handle(
          _location_descMeta,
          location_desc.isAcceptableOrUnknown(
              data['location_desc']!, _location_descMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {location_id};
  @override
  LocationMasterDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationMasterDBData(
      location_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location_id'])!,
      location_code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_code']),
      location_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_name']),
      location_desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_desc']),
    );
  }

  @override
  $LocationMasterDBTable createAlias(String alias) {
    return $LocationMasterDBTable(attachedDatabase, alias);
  }
}

class LocationMasterDBData extends DataClass
    implements Insertable<LocationMasterDBData> {
  final int location_id;
  final String? location_code;
  final String? location_name;
  final String? location_desc;
  const LocationMasterDBData(
      {required this.location_id,
      this.location_code,
      this.location_name,
      this.location_desc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['location_id'] = Variable<int>(location_id);
    if (!nullToAbsent || location_code != null) {
      map['location_code'] = Variable<String>(location_code);
    }
    if (!nullToAbsent || location_name != null) {
      map['location_name'] = Variable<String>(location_name);
    }
    if (!nullToAbsent || location_desc != null) {
      map['location_desc'] = Variable<String>(location_desc);
    }
    return map;
  }

  LocationMasterDBCompanion toCompanion(bool nullToAbsent) {
    return LocationMasterDBCompanion(
      location_id: Value(location_id),
      location_code: location_code == null && nullToAbsent
          ? const Value.absent()
          : Value(location_code),
      location_name: location_name == null && nullToAbsent
          ? const Value.absent()
          : Value(location_name),
      location_desc: location_desc == null && nullToAbsent
          ? const Value.absent()
          : Value(location_desc),
    );
  }

  factory LocationMasterDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationMasterDBData(
      location_id: serializer.fromJson<int>(json['location_id']),
      location_code: serializer.fromJson<String?>(json['location_code']),
      location_name: serializer.fromJson<String?>(json['location_name']),
      location_desc: serializer.fromJson<String?>(json['location_desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'location_id': serializer.toJson<int>(location_id),
      'location_code': serializer.toJson<String?>(location_code),
      'location_name': serializer.toJson<String?>(location_name),
      'location_desc': serializer.toJson<String?>(location_desc),
    };
  }

  LocationMasterDBData copyWith(
          {int? location_id,
          Value<String?> location_code = const Value.absent(),
          Value<String?> location_name = const Value.absent(),
          Value<String?> location_desc = const Value.absent()}) =>
      LocationMasterDBData(
        location_id: location_id ?? this.location_id,
        location_code:
            location_code.present ? location_code.value : this.location_code,
        location_name:
            location_name.present ? location_name.value : this.location_name,
        location_desc:
            location_desc.present ? location_desc.value : this.location_desc,
      );
  LocationMasterDBData copyWithCompanion(LocationMasterDBCompanion data) {
    return LocationMasterDBData(
      location_id:
          data.location_id.present ? data.location_id.value : this.location_id,
      location_code: data.location_code.present
          ? data.location_code.value
          : this.location_code,
      location_name: data.location_name.present
          ? data.location_name.value
          : this.location_name,
      location_desc: data.location_desc.present
          ? data.location_desc.value
          : this.location_desc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationMasterDBData(')
          ..write('location_id: $location_id, ')
          ..write('location_code: $location_code, ')
          ..write('location_name: $location_name, ')
          ..write('location_desc: $location_desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(location_id, location_code, location_name, location_desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationMasterDBData &&
          other.location_id == this.location_id &&
          other.location_code == this.location_code &&
          other.location_name == this.location_name &&
          other.location_desc == this.location_desc);
}

class LocationMasterDBCompanion extends UpdateCompanion<LocationMasterDBData> {
  final Value<int> location_id;
  final Value<String?> location_code;
  final Value<String?> location_name;
  final Value<String?> location_desc;
  const LocationMasterDBCompanion({
    this.location_id = const Value.absent(),
    this.location_code = const Value.absent(),
    this.location_name = const Value.absent(),
    this.location_desc = const Value.absent(),
  });
  LocationMasterDBCompanion.insert({
    this.location_id = const Value.absent(),
    this.location_code = const Value.absent(),
    this.location_name = const Value.absent(),
    this.location_desc = const Value.absent(),
  });
  static Insertable<LocationMasterDBData> custom({
    Expression<int>? location_id,
    Expression<String>? location_code,
    Expression<String>? location_name,
    Expression<String>? location_desc,
  }) {
    return RawValuesInsertable({
      if (location_id != null) 'location_id': location_id,
      if (location_code != null) 'location_code': location_code,
      if (location_name != null) 'location_name': location_name,
      if (location_desc != null) 'location_desc': location_desc,
    });
  }

  LocationMasterDBCompanion copyWith(
      {Value<int>? location_id,
      Value<String?>? location_code,
      Value<String?>? location_name,
      Value<String?>? location_desc}) {
    return LocationMasterDBCompanion(
      location_id: location_id ?? this.location_id,
      location_code: location_code ?? this.location_code,
      location_name: location_name ?? this.location_name,
      location_desc: location_desc ?? this.location_desc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (location_id.present) {
      map['location_id'] = Variable<int>(location_id.value);
    }
    if (location_code.present) {
      map['location_code'] = Variable<String>(location_code.value);
    }
    if (location_name.present) {
      map['location_name'] = Variable<String>(location_name.value);
    }
    if (location_desc.present) {
      map['location_desc'] = Variable<String>(location_desc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationMasterDBCompanion(')
          ..write('location_id: $location_id, ')
          ..write('location_code: $location_code, ')
          ..write('location_name: $location_name, ')
          ..write('location_desc: $location_desc')
          ..write(')'))
        .toString();
  }
}

class $TransactionsDBTable extends TransactionsDB
    with TableInfo<$TransactionsDBTable, TransactionsDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _key_idMeta = const VerificationMeta('key_id');
  @override
  late final GeneratedColumn<int> key_id = GeneratedColumn<int>(
      'key_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _item_idMeta =
      const VerificationMeta('item_id');
  @override
  late final GeneratedColumn<int> item_id = GeneratedColumn<int>(
      'item_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _count_ItemCodeMeta =
      const VerificationMeta('count_ItemCode');
  @override
  late final GeneratedColumn<String> count_ItemCode = GeneratedColumn<String>(
      'count_item_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _count_location_idMeta =
      const VerificationMeta('count_location_id');
  @override
  late final GeneratedColumn<String> count_location_id =
      GeneratedColumn<String>('count_location_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _count_location_codeMeta =
      const VerificationMeta('count_location_code');
  @override
  late final GeneratedColumn<String> count_location_code =
      GeneratedColumn<String>('count_location_code', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _count_QuantityScanMeta =
      const VerificationMeta('count_QuantityScan');
  @override
  late final GeneratedColumn<int> count_QuantityScan = GeneratedColumn<int>(
      'count_quantity_scan', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _serial_numberMeta =
      const VerificationMeta('serial_number');
  @override
  late final GeneratedColumn<String> serial_number = GeneratedColumn<String>(
      'serial_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _status_itemMeta =
      const VerificationMeta('status_item');
  @override
  late final GeneratedColumn<String> status_item = GeneratedColumn<String>(
      'status_item', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rssiMeta = const VerificationMeta('rssi');
  @override
  late final GeneratedColumn<String> rssi = GeneratedColumn<String>(
      'rssi', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _created_dateMeta =
      const VerificationMeta('created_date');
  @override
  late final GeneratedColumn<DateTime> created_date = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updated_dateMeta =
      const VerificationMeta('updated_date');
  @override
  late final GeneratedColumn<DateTime> updated_date = GeneratedColumn<DateTime>(
      'updated_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        key_id,
        item_id,
        count_ItemCode,
        count_location_id,
        count_location_code,
        count_QuantityScan,
        serial_number,
        status_item,
        rssi,
        created_date,
        updated_date
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionsDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key_id')) {
      context.handle(_key_idMeta,
          key_id.isAcceptableOrUnknown(data['key_id']!, _key_idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_item_idMeta,
          item_id.isAcceptableOrUnknown(data['item_id']!, _item_idMeta));
    }
    if (data.containsKey('count_item_code')) {
      context.handle(
          _count_ItemCodeMeta,
          count_ItemCode.isAcceptableOrUnknown(
              data['count_item_code']!, _count_ItemCodeMeta));
    } else if (isInserting) {
      context.missing(_count_ItemCodeMeta);
    }
    if (data.containsKey('count_location_id')) {
      context.handle(
          _count_location_idMeta,
          count_location_id.isAcceptableOrUnknown(
              data['count_location_id']!, _count_location_idMeta));
    }
    if (data.containsKey('count_location_code')) {
      context.handle(
          _count_location_codeMeta,
          count_location_code.isAcceptableOrUnknown(
              data['count_location_code']!, _count_location_codeMeta));
    }
    if (data.containsKey('count_quantity_scan')) {
      context.handle(
          _count_QuantityScanMeta,
          count_QuantityScan.isAcceptableOrUnknown(
              data['count_quantity_scan']!, _count_QuantityScanMeta));
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serial_numberMeta,
          serial_number.isAcceptableOrUnknown(
              data['serial_number']!, _serial_numberMeta));
    }
    if (data.containsKey('status_item')) {
      context.handle(
          _status_itemMeta,
          status_item.isAcceptableOrUnknown(
              data['status_item']!, _status_itemMeta));
    }
    if (data.containsKey('rssi')) {
      context.handle(
          _rssiMeta, rssi.isAcceptableOrUnknown(data['rssi']!, _rssiMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _created_dateMeta,
          created_date.isAcceptableOrUnknown(
              data['created_date']!, _created_dateMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updated_dateMeta,
          updated_date.isAcceptableOrUnknown(
              data['updated_date']!, _updated_dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key_id};
  @override
  TransactionsDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionsDBData(
      key_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}key_id'])!,
      item_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id']),
      count_ItemCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}count_item_code'])!,
      count_location_id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}count_location_id']),
      count_location_code: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}count_location_code']),
      count_QuantityScan: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}count_quantity_scan']),
      serial_number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serial_number']),
      status_item: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status_item']),
      rssi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rssi']),
      created_date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      updated_date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_date']),
    );
  }

  @override
  $TransactionsDBTable createAlias(String alias) {
    return $TransactionsDBTable(attachedDatabase, alias);
  }
}

class TransactionsDBData extends DataClass
    implements Insertable<TransactionsDBData> {
  final int key_id;
  final int? item_id;
  final String count_ItemCode;
  final String? count_location_id;
  final String? count_location_code;
  final int? count_QuantityScan;
  final String? serial_number;
  final String? status_item;
  final String? rssi;
  final DateTime? created_date;
  final DateTime? updated_date;
  const TransactionsDBData(
      {required this.key_id,
      this.item_id,
      required this.count_ItemCode,
      this.count_location_id,
      this.count_location_code,
      this.count_QuantityScan,
      this.serial_number,
      this.status_item,
      this.rssi,
      this.created_date,
      this.updated_date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key_id'] = Variable<int>(key_id);
    if (!nullToAbsent || item_id != null) {
      map['item_id'] = Variable<int>(item_id);
    }
    map['count_item_code'] = Variable<String>(count_ItemCode);
    if (!nullToAbsent || count_location_id != null) {
      map['count_location_id'] = Variable<String>(count_location_id);
    }
    if (!nullToAbsent || count_location_code != null) {
      map['count_location_code'] = Variable<String>(count_location_code);
    }
    if (!nullToAbsent || count_QuantityScan != null) {
      map['count_quantity_scan'] = Variable<int>(count_QuantityScan);
    }
    if (!nullToAbsent || serial_number != null) {
      map['serial_number'] = Variable<String>(serial_number);
    }
    if (!nullToAbsent || status_item != null) {
      map['status_item'] = Variable<String>(status_item);
    }
    if (!nullToAbsent || rssi != null) {
      map['rssi'] = Variable<String>(rssi);
    }
    if (!nullToAbsent || created_date != null) {
      map['created_date'] = Variable<DateTime>(created_date);
    }
    if (!nullToAbsent || updated_date != null) {
      map['updated_date'] = Variable<DateTime>(updated_date);
    }
    return map;
  }

  TransactionsDBCompanion toCompanion(bool nullToAbsent) {
    return TransactionsDBCompanion(
      key_id: Value(key_id),
      item_id: item_id == null && nullToAbsent
          ? const Value.absent()
          : Value(item_id),
      count_ItemCode: Value(count_ItemCode),
      count_location_id: count_location_id == null && nullToAbsent
          ? const Value.absent()
          : Value(count_location_id),
      count_location_code: count_location_code == null && nullToAbsent
          ? const Value.absent()
          : Value(count_location_code),
      count_QuantityScan: count_QuantityScan == null && nullToAbsent
          ? const Value.absent()
          : Value(count_QuantityScan),
      serial_number: serial_number == null && nullToAbsent
          ? const Value.absent()
          : Value(serial_number),
      status_item: status_item == null && nullToAbsent
          ? const Value.absent()
          : Value(status_item),
      rssi: rssi == null && nullToAbsent ? const Value.absent() : Value(rssi),
      created_date: created_date == null && nullToAbsent
          ? const Value.absent()
          : Value(created_date),
      updated_date: updated_date == null && nullToAbsent
          ? const Value.absent()
          : Value(updated_date),
    );
  }

  factory TransactionsDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionsDBData(
      key_id: serializer.fromJson<int>(json['key_id']),
      item_id: serializer.fromJson<int?>(json['item_id']),
      count_ItemCode: serializer.fromJson<String>(json['count_ItemCode']),
      count_location_id:
          serializer.fromJson<String?>(json['count_location_id']),
      count_location_code:
          serializer.fromJson<String?>(json['count_location_code']),
      count_QuantityScan: serializer.fromJson<int?>(json['count_QuantityScan']),
      serial_number: serializer.fromJson<String?>(json['serial_number']),
      status_item: serializer.fromJson<String?>(json['status_item']),
      rssi: serializer.fromJson<String?>(json['rssi']),
      created_date: serializer.fromJson<DateTime?>(json['created_date']),
      updated_date: serializer.fromJson<DateTime?>(json['updated_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key_id': serializer.toJson<int>(key_id),
      'item_id': serializer.toJson<int?>(item_id),
      'count_ItemCode': serializer.toJson<String>(count_ItemCode),
      'count_location_id': serializer.toJson<String?>(count_location_id),
      'count_location_code': serializer.toJson<String?>(count_location_code),
      'count_QuantityScan': serializer.toJson<int?>(count_QuantityScan),
      'serial_number': serializer.toJson<String?>(serial_number),
      'status_item': serializer.toJson<String?>(status_item),
      'rssi': serializer.toJson<String?>(rssi),
      'created_date': serializer.toJson<DateTime?>(created_date),
      'updated_date': serializer.toJson<DateTime?>(updated_date),
    };
  }

  TransactionsDBData copyWith(
          {int? key_id,
          Value<int?> item_id = const Value.absent(),
          String? count_ItemCode,
          Value<String?> count_location_id = const Value.absent(),
          Value<String?> count_location_code = const Value.absent(),
          Value<int?> count_QuantityScan = const Value.absent(),
          Value<String?> serial_number = const Value.absent(),
          Value<String?> status_item = const Value.absent(),
          Value<String?> rssi = const Value.absent(),
          Value<DateTime?> created_date = const Value.absent(),
          Value<DateTime?> updated_date = const Value.absent()}) =>
      TransactionsDBData(
        key_id: key_id ?? this.key_id,
        item_id: item_id.present ? item_id.value : this.item_id,
        count_ItemCode: count_ItemCode ?? this.count_ItemCode,
        count_location_id: count_location_id.present
            ? count_location_id.value
            : this.count_location_id,
        count_location_code: count_location_code.present
            ? count_location_code.value
            : this.count_location_code,
        count_QuantityScan: count_QuantityScan.present
            ? count_QuantityScan.value
            : this.count_QuantityScan,
        serial_number:
            serial_number.present ? serial_number.value : this.serial_number,
        status_item: status_item.present ? status_item.value : this.status_item,
        rssi: rssi.present ? rssi.value : this.rssi,
        created_date:
            created_date.present ? created_date.value : this.created_date,
        updated_date:
            updated_date.present ? updated_date.value : this.updated_date,
      );
  TransactionsDBData copyWithCompanion(TransactionsDBCompanion data) {
    return TransactionsDBData(
      key_id: data.key_id.present ? data.key_id.value : this.key_id,
      item_id: data.item_id.present ? data.item_id.value : this.item_id,
      count_ItemCode: data.count_ItemCode.present
          ? data.count_ItemCode.value
          : this.count_ItemCode,
      count_location_id: data.count_location_id.present
          ? data.count_location_id.value
          : this.count_location_id,
      count_location_code: data.count_location_code.present
          ? data.count_location_code.value
          : this.count_location_code,
      count_QuantityScan: data.count_QuantityScan.present
          ? data.count_QuantityScan.value
          : this.count_QuantityScan,
      serial_number: data.serial_number.present
          ? data.serial_number.value
          : this.serial_number,
      status_item:
          data.status_item.present ? data.status_item.value : this.status_item,
      rssi: data.rssi.present ? data.rssi.value : this.rssi,
      created_date: data.created_date.present
          ? data.created_date.value
          : this.created_date,
      updated_date: data.updated_date.present
          ? data.updated_date.value
          : this.updated_date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsDBData(')
          ..write('key_id: $key_id, ')
          ..write('item_id: $item_id, ')
          ..write('count_ItemCode: $count_ItemCode, ')
          ..write('count_location_id: $count_location_id, ')
          ..write('count_location_code: $count_location_code, ')
          ..write('count_QuantityScan: $count_QuantityScan, ')
          ..write('serial_number: $serial_number, ')
          ..write('status_item: $status_item, ')
          ..write('rssi: $rssi, ')
          ..write('created_date: $created_date, ')
          ..write('updated_date: $updated_date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      key_id,
      item_id,
      count_ItemCode,
      count_location_id,
      count_location_code,
      count_QuantityScan,
      serial_number,
      status_item,
      rssi,
      created_date,
      updated_date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionsDBData &&
          other.key_id == this.key_id &&
          other.item_id == this.item_id &&
          other.count_ItemCode == this.count_ItemCode &&
          other.count_location_id == this.count_location_id &&
          other.count_location_code == this.count_location_code &&
          other.count_QuantityScan == this.count_QuantityScan &&
          other.serial_number == this.serial_number &&
          other.status_item == this.status_item &&
          other.rssi == this.rssi &&
          other.created_date == this.created_date &&
          other.updated_date == this.updated_date);
}

class TransactionsDBCompanion extends UpdateCompanion<TransactionsDBData> {
  final Value<int> key_id;
  final Value<int?> item_id;
  final Value<String> count_ItemCode;
  final Value<String?> count_location_id;
  final Value<String?> count_location_code;
  final Value<int?> count_QuantityScan;
  final Value<String?> serial_number;
  final Value<String?> status_item;
  final Value<String?> rssi;
  final Value<DateTime?> created_date;
  final Value<DateTime?> updated_date;
  const TransactionsDBCompanion({
    this.key_id = const Value.absent(),
    this.item_id = const Value.absent(),
    this.count_ItemCode = const Value.absent(),
    this.count_location_id = const Value.absent(),
    this.count_location_code = const Value.absent(),
    this.count_QuantityScan = const Value.absent(),
    this.serial_number = const Value.absent(),
    this.status_item = const Value.absent(),
    this.rssi = const Value.absent(),
    this.created_date = const Value.absent(),
    this.updated_date = const Value.absent(),
  });
  TransactionsDBCompanion.insert({
    this.key_id = const Value.absent(),
    this.item_id = const Value.absent(),
    required String count_ItemCode,
    this.count_location_id = const Value.absent(),
    this.count_location_code = const Value.absent(),
    this.count_QuantityScan = const Value.absent(),
    this.serial_number = const Value.absent(),
    this.status_item = const Value.absent(),
    this.rssi = const Value.absent(),
    this.created_date = const Value.absent(),
    this.updated_date = const Value.absent(),
  }) : count_ItemCode = Value(count_ItemCode);
  static Insertable<TransactionsDBData> custom({
    Expression<int>? key_id,
    Expression<int>? item_id,
    Expression<String>? count_ItemCode,
    Expression<String>? count_location_id,
    Expression<String>? count_location_code,
    Expression<int>? count_QuantityScan,
    Expression<String>? serial_number,
    Expression<String>? status_item,
    Expression<String>? rssi,
    Expression<DateTime>? created_date,
    Expression<DateTime>? updated_date,
  }) {
    return RawValuesInsertable({
      if (key_id != null) 'key_id': key_id,
      if (item_id != null) 'item_id': item_id,
      if (count_ItemCode != null) 'count_item_code': count_ItemCode,
      if (count_location_id != null) 'count_location_id': count_location_id,
      if (count_location_code != null)
        'count_location_code': count_location_code,
      if (count_QuantityScan != null) 'count_quantity_scan': count_QuantityScan,
      if (serial_number != null) 'serial_number': serial_number,
      if (status_item != null) 'status_item': status_item,
      if (rssi != null) 'rssi': rssi,
      if (created_date != null) 'created_date': created_date,
      if (updated_date != null) 'updated_date': updated_date,
    });
  }

  TransactionsDBCompanion copyWith(
      {Value<int>? key_id,
      Value<int?>? item_id,
      Value<String>? count_ItemCode,
      Value<String?>? count_location_id,
      Value<String?>? count_location_code,
      Value<int?>? count_QuantityScan,
      Value<String?>? serial_number,
      Value<String?>? status_item,
      Value<String?>? rssi,
      Value<DateTime?>? created_date,
      Value<DateTime?>? updated_date}) {
    return TransactionsDBCompanion(
      key_id: key_id ?? this.key_id,
      item_id: item_id ?? this.item_id,
      count_ItemCode: count_ItemCode ?? this.count_ItemCode,
      count_location_id: count_location_id ?? this.count_location_id,
      count_location_code: count_location_code ?? this.count_location_code,
      count_QuantityScan: count_QuantityScan ?? this.count_QuantityScan,
      serial_number: serial_number ?? this.serial_number,
      status_item: status_item ?? this.status_item,
      rssi: rssi ?? this.rssi,
      created_date: created_date ?? this.created_date,
      updated_date: updated_date ?? this.updated_date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key_id.present) {
      map['key_id'] = Variable<int>(key_id.value);
    }
    if (item_id.present) {
      map['item_id'] = Variable<int>(item_id.value);
    }
    if (count_ItemCode.present) {
      map['count_item_code'] = Variable<String>(count_ItemCode.value);
    }
    if (count_location_id.present) {
      map['count_location_id'] = Variable<String>(count_location_id.value);
    }
    if (count_location_code.present) {
      map['count_location_code'] = Variable<String>(count_location_code.value);
    }
    if (count_QuantityScan.present) {
      map['count_quantity_scan'] = Variable<int>(count_QuantityScan.value);
    }
    if (serial_number.present) {
      map['serial_number'] = Variable<String>(serial_number.value);
    }
    if (status_item.present) {
      map['status_item'] = Variable<String>(status_item.value);
    }
    if (rssi.present) {
      map['rssi'] = Variable<String>(rssi.value);
    }
    if (created_date.present) {
      map['created_date'] = Variable<DateTime>(created_date.value);
    }
    if (updated_date.present) {
      map['updated_date'] = Variable<DateTime>(updated_date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsDBCompanion(')
          ..write('key_id: $key_id, ')
          ..write('item_id: $item_id, ')
          ..write('count_ItemCode: $count_ItemCode, ')
          ..write('count_location_id: $count_location_id, ')
          ..write('count_location_code: $count_location_code, ')
          ..write('count_QuantityScan: $count_QuantityScan, ')
          ..write('serial_number: $serial_number, ')
          ..write('status_item: $status_item, ')
          ..write('rssi: $rssi, ')
          ..write('created_date: $created_date, ')
          ..write('updated_date: $updated_date')
          ..write(')'))
        .toString();
  }
}

class $AppSettingDBTable extends AppSettingDB
    with TableInfo<$AppSettingDBTable, AppSettingDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _item_idMeta =
      const VerificationMeta('item_id');
  @override
  late final GeneratedColumn<int> item_id = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _is_validateMeta =
      const VerificationMeta('is_validate');
  @override
  late final GeneratedColumn<bool> is_validate = GeneratedColumn<bool>(
      'is_validate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_validate" IN (0, 1))'));
  static const VerificationMeta _is_activeMeta =
      const VerificationMeta('is_active');
  @override
  late final GeneratedColumn<bool> is_active = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [item_id, name, is_validate, is_active];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_setting_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<AppSettingDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(_item_idMeta,
          item_id.isAcceptableOrUnknown(data['item_id']!, _item_idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('is_validate')) {
      context.handle(
          _is_validateMeta,
          is_validate.isAcceptableOrUnknown(
              data['is_validate']!, _is_validateMeta));
    } else if (isInserting) {
      context.missing(_is_validateMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_is_activeMeta,
          is_active.isAcceptableOrUnknown(data['is_active']!, _is_activeMeta));
    } else if (isInserting) {
      context.missing(_is_activeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {item_id};
  @override
  AppSettingDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingDBData(
      item_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      is_validate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_validate'])!,
      is_active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $AppSettingDBTable createAlias(String alias) {
    return $AppSettingDBTable(attachedDatabase, alias);
  }
}

class AppSettingDBData extends DataClass
    implements Insertable<AppSettingDBData> {
  final int item_id;
  final String? name;
  final bool is_validate;
  final bool is_active;
  const AppSettingDBData(
      {required this.item_id,
      this.name,
      required this.is_validate,
      required this.is_active});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<int>(item_id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['is_validate'] = Variable<bool>(is_validate);
    map['is_active'] = Variable<bool>(is_active);
    return map;
  }

  AppSettingDBCompanion toCompanion(bool nullToAbsent) {
    return AppSettingDBCompanion(
      item_id: Value(item_id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      is_validate: Value(is_validate),
      is_active: Value(is_active),
    );
  }

  factory AppSettingDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingDBData(
      item_id: serializer.fromJson<int>(json['item_id']),
      name: serializer.fromJson<String?>(json['name']),
      is_validate: serializer.fromJson<bool>(json['is_validate']),
      is_active: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'item_id': serializer.toJson<int>(item_id),
      'name': serializer.toJson<String?>(name),
      'is_validate': serializer.toJson<bool>(is_validate),
      'is_active': serializer.toJson<bool>(is_active),
    };
  }

  AppSettingDBData copyWith(
          {int? item_id,
          Value<String?> name = const Value.absent(),
          bool? is_validate,
          bool? is_active}) =>
      AppSettingDBData(
        item_id: item_id ?? this.item_id,
        name: name.present ? name.value : this.name,
        is_validate: is_validate ?? this.is_validate,
        is_active: is_active ?? this.is_active,
      );
  AppSettingDBData copyWithCompanion(AppSettingDBCompanion data) {
    return AppSettingDBData(
      item_id: data.item_id.present ? data.item_id.value : this.item_id,
      name: data.name.present ? data.name.value : this.name,
      is_validate:
          data.is_validate.present ? data.is_validate.value : this.is_validate,
      is_active: data.is_active.present ? data.is_active.value : this.is_active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingDBData(')
          ..write('item_id: $item_id, ')
          ..write('name: $name, ')
          ..write('is_validate: $is_validate, ')
          ..write('is_active: $is_active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(item_id, name, is_validate, is_active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingDBData &&
          other.item_id == this.item_id &&
          other.name == this.name &&
          other.is_validate == this.is_validate &&
          other.is_active == this.is_active);
}

class AppSettingDBCompanion extends UpdateCompanion<AppSettingDBData> {
  final Value<int> item_id;
  final Value<String?> name;
  final Value<bool> is_validate;
  final Value<bool> is_active;
  const AppSettingDBCompanion({
    this.item_id = const Value.absent(),
    this.name = const Value.absent(),
    this.is_validate = const Value.absent(),
    this.is_active = const Value.absent(),
  });
  AppSettingDBCompanion.insert({
    this.item_id = const Value.absent(),
    this.name = const Value.absent(),
    required bool is_validate,
    required bool is_active,
  })  : is_validate = Value(is_validate),
        is_active = Value(is_active);
  static Insertable<AppSettingDBData> custom({
    Expression<int>? item_id,
    Expression<String>? name,
    Expression<bool>? is_validate,
    Expression<bool>? is_active,
  }) {
    return RawValuesInsertable({
      if (item_id != null) 'item_id': item_id,
      if (name != null) 'name': name,
      if (is_validate != null) 'is_validate': is_validate,
      if (is_active != null) 'is_active': is_active,
    });
  }

  AppSettingDBCompanion copyWith(
      {Value<int>? item_id,
      Value<String?>? name,
      Value<bool>? is_validate,
      Value<bool>? is_active}) {
    return AppSettingDBCompanion(
      item_id: item_id ?? this.item_id,
      name: name ?? this.name,
      is_validate: is_validate ?? this.is_validate,
      is_active: is_active ?? this.is_active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (item_id.present) {
      map['item_id'] = Variable<int>(item_id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (is_validate.present) {
      map['is_validate'] = Variable<bool>(is_validate.value);
    }
    if (is_active.present) {
      map['is_active'] = Variable<bool>(is_active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingDBCompanion(')
          ..write('item_id: $item_id, ')
          ..write('name: $name, ')
          ..write('is_validate: $is_validate, ')
          ..write('is_active: $is_active')
          ..write(')'))
        .toString();
  }
}

class ViewItemMasterDBData extends DataClass {
  final int item_id;
  final String? ItemCode;
  final String? ItemName;
  final String? ItemDescription;
  final String? SerialNumber;
  final String? Quantity;
  final String? Udf01;
  final String? Udf02;
  final String? Udf03;
  final String? Udf04;
  final String? Udf05;
  const ViewItemMasterDBData(
      {required this.item_id,
      this.ItemCode,
      this.ItemName,
      this.ItemDescription,
      this.SerialNumber,
      this.Quantity,
      this.Udf01,
      this.Udf02,
      this.Udf03,
      this.Udf04,
      this.Udf05});
  factory ViewItemMasterDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ViewItemMasterDBData(
      item_id: serializer.fromJson<int>(json['item_id']),
      ItemCode: serializer.fromJson<String?>(json['ItemCode']),
      ItemName: serializer.fromJson<String?>(json['ItemName']),
      ItemDescription: serializer.fromJson<String?>(json['ItemDescription']),
      SerialNumber: serializer.fromJson<String?>(json['SerialNumber']),
      Quantity: serializer.fromJson<String?>(json['Quantity']),
      Udf01: serializer.fromJson<String?>(json['Udf01']),
      Udf02: serializer.fromJson<String?>(json['Udf02']),
      Udf03: serializer.fromJson<String?>(json['Udf03']),
      Udf04: serializer.fromJson<String?>(json['Udf04']),
      Udf05: serializer.fromJson<String?>(json['Udf05']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'item_id': serializer.toJson<int>(item_id),
      'ItemCode': serializer.toJson<String?>(ItemCode),
      'ItemName': serializer.toJson<String?>(ItemName),
      'ItemDescription': serializer.toJson<String?>(ItemDescription),
      'SerialNumber': serializer.toJson<String?>(SerialNumber),
      'Quantity': serializer.toJson<String?>(Quantity),
      'Udf01': serializer.toJson<String?>(Udf01),
      'Udf02': serializer.toJson<String?>(Udf02),
      'Udf03': serializer.toJson<String?>(Udf03),
      'Udf04': serializer.toJson<String?>(Udf04),
      'Udf05': serializer.toJson<String?>(Udf05),
    };
  }

  ViewItemMasterDBData copyWith(
          {int? item_id,
          Value<String?> ItemCode = const Value.absent(),
          Value<String?> ItemName = const Value.absent(),
          Value<String?> ItemDescription = const Value.absent(),
          Value<String?> SerialNumber = const Value.absent(),
          Value<String?> Quantity = const Value.absent(),
          Value<String?> Udf01 = const Value.absent(),
          Value<String?> Udf02 = const Value.absent(),
          Value<String?> Udf03 = const Value.absent(),
          Value<String?> Udf04 = const Value.absent(),
          Value<String?> Udf05 = const Value.absent()}) =>
      ViewItemMasterDBData(
        item_id: item_id ?? this.item_id,
        ItemCode: ItemCode.present ? ItemCode.value : this.ItemCode,
        ItemName: ItemName.present ? ItemName.value : this.ItemName,
        ItemDescription: ItemDescription.present
            ? ItemDescription.value
            : this.ItemDescription,
        SerialNumber:
            SerialNumber.present ? SerialNumber.value : this.SerialNumber,
        Quantity: Quantity.present ? Quantity.value : this.Quantity,
        Udf01: Udf01.present ? Udf01.value : this.Udf01,
        Udf02: Udf02.present ? Udf02.value : this.Udf02,
        Udf03: Udf03.present ? Udf03.value : this.Udf03,
        Udf04: Udf04.present ? Udf04.value : this.Udf04,
        Udf05: Udf05.present ? Udf05.value : this.Udf05,
      );
  @override
  String toString() {
    return (StringBuffer('ViewItemMasterDBData(')
          ..write('item_id: $item_id, ')
          ..write('ItemCode: $ItemCode, ')
          ..write('ItemName: $ItemName, ')
          ..write('ItemDescription: $ItemDescription, ')
          ..write('SerialNumber: $SerialNumber, ')
          ..write('Quantity: $Quantity, ')
          ..write('Udf01: $Udf01, ')
          ..write('Udf02: $Udf02, ')
          ..write('Udf03: $Udf03, ')
          ..write('Udf04: $Udf04, ')
          ..write('Udf05: $Udf05')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(item_id, ItemCode, ItemName, ItemDescription,
      SerialNumber, Quantity, Udf01, Udf02, Udf03, Udf04, Udf05);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ViewItemMasterDBData &&
          other.item_id == this.item_id &&
          other.ItemCode == this.ItemCode &&
          other.ItemName == this.ItemName &&
          other.ItemDescription == this.ItemDescription &&
          other.SerialNumber == this.SerialNumber &&
          other.Quantity == this.Quantity &&
          other.Udf01 == this.Udf01 &&
          other.Udf02 == this.Udf02 &&
          other.Udf03 == this.Udf03 &&
          other.Udf04 == this.Udf04 &&
          other.Udf05 == this.Udf05);
}

class $ViewItemMasterDBView
    extends ViewInfo<$ViewItemMasterDBView, ViewItemMasterDBData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $ViewItemMasterDBView(this.attachedDatabase, [this._alias]);
  $ItemMasterDBTable get itemMasterDB =>
      attachedDatabase.itemMasterDB.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [
        item_id,
        ItemCode,
        ItemName,
        ItemDescription,
        SerialNumber,
        Quantity,
        Udf01,
        Udf02,
        Udf03,
        Udf04,
        Udf05
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'view_item_master_d_b';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ViewItemMasterDBView get asDslTable => this;
  @override
  ViewItemMasterDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ViewItemMasterDBData(
      item_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      ItemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_code']),
      ItemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name']),
      ItemDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}item_description']),
      SerialNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serial_number']),
      Quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quantity']),
      Udf01: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf01']),
      Udf02: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf02']),
      Udf03: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf03']),
      Udf04: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf04']),
      Udf05: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}udf05']),
    );
  }

  late final GeneratedColumn<int> item_id = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      generatedAs: GeneratedAs(itemMasterDB.item_id, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> ItemCode = GeneratedColumn<String>(
      'item_code', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.ItemCode, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> ItemName = GeneratedColumn<String>(
      'item_name', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.ItemName, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> ItemDescription = GeneratedColumn<String>(
      'item_description', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.ItemDescription, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> SerialNumber = GeneratedColumn<String>(
      'serial_number', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.SerialNumber, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> Quantity = GeneratedColumn<String>(
      'quantity', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.Quantity, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> Udf01 = GeneratedColumn<String>(
      'udf01', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.Udf01, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> Udf02 = GeneratedColumn<String>(
      'udf02', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.Udf02, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> Udf03 = GeneratedColumn<String>(
      'udf03', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.Udf03, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> Udf04 = GeneratedColumn<String>(
      'udf04', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.Udf04, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> Udf05 = GeneratedColumn<String>(
      'udf05', aliasedName, true,
      generatedAs: GeneratedAs(itemMasterDB.Udf05, false),
      type: DriftSqlType.string);
  @override
  $ViewItemMasterDBView createAlias(String alias) {
    return $ViewItemMasterDBView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(itemMasterDB)..addColumns($columns));
  @override
  Set<String> get readTables => const {'item_master_d_b'};
}

class ViewLocationMasterDBData extends DataClass {
  final int location_id;
  final String? location_code;
  final String? location_name;
  final String? location_desc;
  const ViewLocationMasterDBData(
      {required this.location_id,
      this.location_code,
      this.location_name,
      this.location_desc});
  factory ViewLocationMasterDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ViewLocationMasterDBData(
      location_id: serializer.fromJson<int>(json['location_id']),
      location_code: serializer.fromJson<String?>(json['location_code']),
      location_name: serializer.fromJson<String?>(json['location_name']),
      location_desc: serializer.fromJson<String?>(json['location_desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'location_id': serializer.toJson<int>(location_id),
      'location_code': serializer.toJson<String?>(location_code),
      'location_name': serializer.toJson<String?>(location_name),
      'location_desc': serializer.toJson<String?>(location_desc),
    };
  }

  ViewLocationMasterDBData copyWith(
          {int? location_id,
          Value<String?> location_code = const Value.absent(),
          Value<String?> location_name = const Value.absent(),
          Value<String?> location_desc = const Value.absent()}) =>
      ViewLocationMasterDBData(
        location_id: location_id ?? this.location_id,
        location_code:
            location_code.present ? location_code.value : this.location_code,
        location_name:
            location_name.present ? location_name.value : this.location_name,
        location_desc:
            location_desc.present ? location_desc.value : this.location_desc,
      );
  @override
  String toString() {
    return (StringBuffer('ViewLocationMasterDBData(')
          ..write('location_id: $location_id, ')
          ..write('location_code: $location_code, ')
          ..write('location_name: $location_name, ')
          ..write('location_desc: $location_desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(location_id, location_code, location_name, location_desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ViewLocationMasterDBData &&
          other.location_id == this.location_id &&
          other.location_code == this.location_code &&
          other.location_name == this.location_name &&
          other.location_desc == this.location_desc);
}

class $ViewLocationMasterDBView
    extends ViewInfo<$ViewLocationMasterDBView, ViewLocationMasterDBData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $ViewLocationMasterDBView(this.attachedDatabase, [this._alias]);
  $LocationMasterDBTable get localtionMasterDB =>
      attachedDatabase.locationMasterDB.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns =>
      [location_id, location_code, location_name, location_desc];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'view_location_master_d_b';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ViewLocationMasterDBView get asDslTable => this;
  @override
  ViewLocationMasterDBData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ViewLocationMasterDBData(
      location_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location_id'])!,
      location_code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_code']),
      location_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_name']),
      location_desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_desc']),
    );
  }

  late final GeneratedColumn<int> location_id = GeneratedColumn<int>(
      'location_id', aliasedName, false,
      generatedAs: GeneratedAs(localtionMasterDB.location_id, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> location_code = GeneratedColumn<String>(
      'location_code', aliasedName, true,
      generatedAs: GeneratedAs(localtionMasterDB.location_code, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> location_name = GeneratedColumn<String>(
      'location_name', aliasedName, true,
      generatedAs: GeneratedAs(localtionMasterDB.location_name, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> location_desc = GeneratedColumn<String>(
      'location_desc', aliasedName, true,
      generatedAs: GeneratedAs(localtionMasterDB.location_desc, false),
      type: DriftSqlType.string);
  @override
  $ViewLocationMasterDBView createAlias(String alias) {
    return $ViewLocationMasterDBView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(localtionMasterDB)..addColumns($columns));
  @override
  Set<String> get readTables => const {'location_master_d_b'};
}

class ViewTransactionsDBData extends DataClass {
  final int key_id;
  final int? item_id;
  final String count_ItemCode;
  final String? count_location_id;
  final String? count_location_code;
  final int? count_QuantityScan;
  final String? status_item;
  final String? rssi;
  final DateTime? created_date;
  final DateTime? updated_date;
  final String? serial_number;
  const ViewTransactionsDBData(
      {required this.key_id,
      this.item_id,
      required this.count_ItemCode,
      this.count_location_id,
      this.count_location_code,
      this.count_QuantityScan,
      this.status_item,
      this.rssi,
      this.created_date,
      this.updated_date,
      this.serial_number});
  factory ViewTransactionsDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ViewTransactionsDBData(
      key_id: serializer.fromJson<int>(json['key_id']),
      item_id: serializer.fromJson<int?>(json['item_id']),
      count_ItemCode: serializer.fromJson<String>(json['count_ItemCode']),
      count_location_id:
          serializer.fromJson<String?>(json['count_location_id']),
      count_location_code:
          serializer.fromJson<String?>(json['count_location_code']),
      count_QuantityScan: serializer.fromJson<int?>(json['count_QuantityScan']),
      status_item: serializer.fromJson<String?>(json['status_item']),
      rssi: serializer.fromJson<String?>(json['rssi']),
      created_date: serializer.fromJson<DateTime?>(json['created_date']),
      updated_date: serializer.fromJson<DateTime?>(json['updated_date']),
      serial_number: serializer.fromJson<String?>(json['serial_number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key_id': serializer.toJson<int>(key_id),
      'item_id': serializer.toJson<int?>(item_id),
      'count_ItemCode': serializer.toJson<String>(count_ItemCode),
      'count_location_id': serializer.toJson<String?>(count_location_id),
      'count_location_code': serializer.toJson<String?>(count_location_code),
      'count_QuantityScan': serializer.toJson<int?>(count_QuantityScan),
      'status_item': serializer.toJson<String?>(status_item),
      'rssi': serializer.toJson<String?>(rssi),
      'created_date': serializer.toJson<DateTime?>(created_date),
      'updated_date': serializer.toJson<DateTime?>(updated_date),
      'serial_number': serializer.toJson<String?>(serial_number),
    };
  }

  ViewTransactionsDBData copyWith(
          {int? key_id,
          Value<int?> item_id = const Value.absent(),
          String? count_ItemCode,
          Value<String?> count_location_id = const Value.absent(),
          Value<String?> count_location_code = const Value.absent(),
          Value<int?> count_QuantityScan = const Value.absent(),
          Value<String?> status_item = const Value.absent(),
          Value<String?> rssi = const Value.absent(),
          Value<DateTime?> created_date = const Value.absent(),
          Value<DateTime?> updated_date = const Value.absent(),
          Value<String?> serial_number = const Value.absent()}) =>
      ViewTransactionsDBData(
        key_id: key_id ?? this.key_id,
        item_id: item_id.present ? item_id.value : this.item_id,
        count_ItemCode: count_ItemCode ?? this.count_ItemCode,
        count_location_id: count_location_id.present
            ? count_location_id.value
            : this.count_location_id,
        count_location_code: count_location_code.present
            ? count_location_code.value
            : this.count_location_code,
        count_QuantityScan: count_QuantityScan.present
            ? count_QuantityScan.value
            : this.count_QuantityScan,
        status_item: status_item.present ? status_item.value : this.status_item,
        rssi: rssi.present ? rssi.value : this.rssi,
        created_date:
            created_date.present ? created_date.value : this.created_date,
        updated_date:
            updated_date.present ? updated_date.value : this.updated_date,
        serial_number:
            serial_number.present ? serial_number.value : this.serial_number,
      );
  @override
  String toString() {
    return (StringBuffer('ViewTransactionsDBData(')
          ..write('key_id: $key_id, ')
          ..write('item_id: $item_id, ')
          ..write('count_ItemCode: $count_ItemCode, ')
          ..write('count_location_id: $count_location_id, ')
          ..write('count_location_code: $count_location_code, ')
          ..write('count_QuantityScan: $count_QuantityScan, ')
          ..write('status_item: $status_item, ')
          ..write('rssi: $rssi, ')
          ..write('created_date: $created_date, ')
          ..write('updated_date: $updated_date, ')
          ..write('serial_number: $serial_number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      key_id,
      item_id,
      count_ItemCode,
      count_location_id,
      count_location_code,
      count_QuantityScan,
      status_item,
      rssi,
      created_date,
      updated_date,
      serial_number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ViewTransactionsDBData &&
          other.key_id == this.key_id &&
          other.item_id == this.item_id &&
          other.count_ItemCode == this.count_ItemCode &&
          other.count_location_id == this.count_location_id &&
          other.count_location_code == this.count_location_code &&
          other.count_QuantityScan == this.count_QuantityScan &&
          other.status_item == this.status_item &&
          other.rssi == this.rssi &&
          other.created_date == this.created_date &&
          other.updated_date == this.updated_date &&
          other.serial_number == this.serial_number);
}

class $ViewTransactionsDBView
    extends ViewInfo<$ViewTransactionsDBView, ViewTransactionsDBData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $ViewTransactionsDBView(this.attachedDatabase, [this._alias]);
  $TransactionsDBTable get transactionsDB =>
      attachedDatabase.transactionsDB.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [
        key_id,
        item_id,
        count_ItemCode,
        count_location_id,
        count_location_code,
        count_QuantityScan,
        status_item,
        rssi,
        created_date,
        updated_date,
        serial_number
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'view_transactions_d_b';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ViewTransactionsDBView get asDslTable => this;
  @override
  ViewTransactionsDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ViewTransactionsDBData(
      key_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}key_id'])!,
      item_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id']),
      count_ItemCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}count_item_code'])!,
      count_location_id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}count_location_id']),
      count_location_code: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}count_location_code']),
      count_QuantityScan: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}count_quantity_scan']),
      status_item: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status_item']),
      rssi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rssi']),
      created_date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      updated_date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_date']),
      serial_number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serial_number']),
    );
  }

  late final GeneratedColumn<int> key_id = GeneratedColumn<int>(
      'key_id', aliasedName, false,
      generatedAs: GeneratedAs(transactionsDB.key_id, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<int> item_id = GeneratedColumn<int>(
      'item_id', aliasedName, true,
      generatedAs: GeneratedAs(transactionsDB.item_id, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> count_ItemCode = GeneratedColumn<String>(
      'count_item_code', aliasedName, false,
      generatedAs: GeneratedAs(transactionsDB.count_ItemCode, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> count_location_id =
      GeneratedColumn<String>('count_location_id', aliasedName, true,
          generatedAs: GeneratedAs(transactionsDB.count_location_id, false),
          type: DriftSqlType.string);
  late final GeneratedColumn<String> count_location_code =
      GeneratedColumn<String>('count_location_code', aliasedName, true,
          generatedAs: GeneratedAs(transactionsDB.count_location_code, false),
          type: DriftSqlType.string);
  late final GeneratedColumn<int> count_QuantityScan = GeneratedColumn<int>(
      'count_quantity_scan', aliasedName, true,
      generatedAs: GeneratedAs(transactionsDB.count_QuantityScan, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> status_item = GeneratedColumn<String>(
      'status_item', aliasedName, true,
      generatedAs: GeneratedAs(transactionsDB.status_item, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> rssi = GeneratedColumn<String>(
      'rssi', aliasedName, true,
      generatedAs: GeneratedAs(transactionsDB.rssi, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created_date = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      generatedAs: GeneratedAs(transactionsDB.created_date, false),
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated_date = GeneratedColumn<DateTime>(
      'updated_date', aliasedName, true,
      generatedAs: GeneratedAs(transactionsDB.updated_date, false),
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> serial_number = GeneratedColumn<String>(
      'serial_number', aliasedName, true,
      generatedAs: GeneratedAs(transactionsDB.serial_number, false),
      type: DriftSqlType.string);
  @override
  $ViewTransactionsDBView createAlias(String alias) {
    return $ViewTransactionsDBView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(transactionsDB)..addColumns($columns));
  @override
  Set<String> get readTables => const {'transactions_d_b'};
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $ItemMasterDBTable itemMasterDB = $ItemMasterDBTable(this);
  late final $LocationMasterDBTable locationMasterDB =
      $LocationMasterDBTable(this);
  late final $TransactionsDBTable transactionsDB = $TransactionsDBTable(this);
  late final $AppSettingDBTable appSettingDB = $AppSettingDBTable(this);
  late final $ViewItemMasterDBView viewItemMasterDB =
      $ViewItemMasterDBView(this);
  late final $ViewLocationMasterDBView viewLocationMasterDB =
      $ViewLocationMasterDBView(this);
  late final $ViewTransactionsDBView viewTransactionsDB =
      $ViewTransactionsDBView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        itemMasterDB,
        locationMasterDB,
        transactionsDB,
        appSettingDB,
        viewItemMasterDB,
        viewLocationMasterDB,
        viewTransactionsDB
      ];
}

typedef $$ItemMasterDBTableCreateCompanionBuilder = ItemMasterDBCompanion
    Function({
  Value<int> item_id,
  Value<String?> ItemCode,
  Value<String?> ItemName,
  Value<String?> ItemDescription,
  Value<String?> SerialNumber,
  Value<String?> Quantity,
  Value<String?> Udf01,
  Value<String?> Udf02,
  Value<String?> Udf03,
  Value<String?> Udf04,
  Value<String?> Udf05,
});
typedef $$ItemMasterDBTableUpdateCompanionBuilder = ItemMasterDBCompanion
    Function({
  Value<int> item_id,
  Value<String?> ItemCode,
  Value<String?> ItemName,
  Value<String?> ItemDescription,
  Value<String?> SerialNumber,
  Value<String?> Quantity,
  Value<String?> Udf01,
  Value<String?> Udf02,
  Value<String?> Udf03,
  Value<String?> Udf04,
  Value<String?> Udf05,
});

class $$ItemMasterDBTableFilterComposer
    extends FilterComposer<_$AppDb, $ItemMasterDBTable> {
  $$ItemMasterDBTableFilterComposer(super.$state);
  ColumnFilters<int> get item_id => $state.composableBuilder(
      column: $state.table.item_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ItemCode => $state.composableBuilder(
      column: $state.table.ItemCode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ItemName => $state.composableBuilder(
      column: $state.table.ItemName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ItemDescription => $state.composableBuilder(
      column: $state.table.ItemDescription,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get SerialNumber => $state.composableBuilder(
      column: $state.table.SerialNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get Quantity => $state.composableBuilder(
      column: $state.table.Quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get Udf01 => $state.composableBuilder(
      column: $state.table.Udf01,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get Udf02 => $state.composableBuilder(
      column: $state.table.Udf02,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get Udf03 => $state.composableBuilder(
      column: $state.table.Udf03,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get Udf04 => $state.composableBuilder(
      column: $state.table.Udf04,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get Udf05 => $state.composableBuilder(
      column: $state.table.Udf05,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ItemMasterDBTableOrderingComposer
    extends OrderingComposer<_$AppDb, $ItemMasterDBTable> {
  $$ItemMasterDBTableOrderingComposer(super.$state);
  ColumnOrderings<int> get item_id => $state.composableBuilder(
      column: $state.table.item_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ItemCode => $state.composableBuilder(
      column: $state.table.ItemCode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ItemName => $state.composableBuilder(
      column: $state.table.ItemName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ItemDescription => $state.composableBuilder(
      column: $state.table.ItemDescription,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get SerialNumber => $state.composableBuilder(
      column: $state.table.SerialNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get Quantity => $state.composableBuilder(
      column: $state.table.Quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get Udf01 => $state.composableBuilder(
      column: $state.table.Udf01,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get Udf02 => $state.composableBuilder(
      column: $state.table.Udf02,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get Udf03 => $state.composableBuilder(
      column: $state.table.Udf03,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get Udf04 => $state.composableBuilder(
      column: $state.table.Udf04,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get Udf05 => $state.composableBuilder(
      column: $state.table.Udf05,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ItemMasterDBTableTableManager extends RootTableManager<
    _$AppDb,
    $ItemMasterDBTable,
    ItemMasterDBData,
    $$ItemMasterDBTableFilterComposer,
    $$ItemMasterDBTableOrderingComposer,
    $$ItemMasterDBTableCreateCompanionBuilder,
    $$ItemMasterDBTableUpdateCompanionBuilder,
    (
      ItemMasterDBData,
      BaseReferences<_$AppDb, $ItemMasterDBTable, ItemMasterDBData>
    ),
    ItemMasterDBData,
    PrefetchHooks Function()> {
  $$ItemMasterDBTableTableManager(_$AppDb db, $ItemMasterDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ItemMasterDBTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ItemMasterDBTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> item_id = const Value.absent(),
            Value<String?> ItemCode = const Value.absent(),
            Value<String?> ItemName = const Value.absent(),
            Value<String?> ItemDescription = const Value.absent(),
            Value<String?> SerialNumber = const Value.absent(),
            Value<String?> Quantity = const Value.absent(),
            Value<String?> Udf01 = const Value.absent(),
            Value<String?> Udf02 = const Value.absent(),
            Value<String?> Udf03 = const Value.absent(),
            Value<String?> Udf04 = const Value.absent(),
            Value<String?> Udf05 = const Value.absent(),
          }) =>
              ItemMasterDBCompanion(
            item_id: item_id,
            ItemCode: ItemCode,
            ItemName: ItemName,
            ItemDescription: ItemDescription,
            SerialNumber: SerialNumber,
            Quantity: Quantity,
            Udf01: Udf01,
            Udf02: Udf02,
            Udf03: Udf03,
            Udf04: Udf04,
            Udf05: Udf05,
          ),
          createCompanionCallback: ({
            Value<int> item_id = const Value.absent(),
            Value<String?> ItemCode = const Value.absent(),
            Value<String?> ItemName = const Value.absent(),
            Value<String?> ItemDescription = const Value.absent(),
            Value<String?> SerialNumber = const Value.absent(),
            Value<String?> Quantity = const Value.absent(),
            Value<String?> Udf01 = const Value.absent(),
            Value<String?> Udf02 = const Value.absent(),
            Value<String?> Udf03 = const Value.absent(),
            Value<String?> Udf04 = const Value.absent(),
            Value<String?> Udf05 = const Value.absent(),
          }) =>
              ItemMasterDBCompanion.insert(
            item_id: item_id,
            ItemCode: ItemCode,
            ItemName: ItemName,
            ItemDescription: ItemDescription,
            SerialNumber: SerialNumber,
            Quantity: Quantity,
            Udf01: Udf01,
            Udf02: Udf02,
            Udf03: Udf03,
            Udf04: Udf04,
            Udf05: Udf05,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ItemMasterDBTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $ItemMasterDBTable,
    ItemMasterDBData,
    $$ItemMasterDBTableFilterComposer,
    $$ItemMasterDBTableOrderingComposer,
    $$ItemMasterDBTableCreateCompanionBuilder,
    $$ItemMasterDBTableUpdateCompanionBuilder,
    (
      ItemMasterDBData,
      BaseReferences<_$AppDb, $ItemMasterDBTable, ItemMasterDBData>
    ),
    ItemMasterDBData,
    PrefetchHooks Function()>;
typedef $$LocationMasterDBTableCreateCompanionBuilder
    = LocationMasterDBCompanion Function({
  Value<int> location_id,
  Value<String?> location_code,
  Value<String?> location_name,
  Value<String?> location_desc,
});
typedef $$LocationMasterDBTableUpdateCompanionBuilder
    = LocationMasterDBCompanion Function({
  Value<int> location_id,
  Value<String?> location_code,
  Value<String?> location_name,
  Value<String?> location_desc,
});

class $$LocationMasterDBTableFilterComposer
    extends FilterComposer<_$AppDb, $LocationMasterDBTable> {
  $$LocationMasterDBTableFilterComposer(super.$state);
  ColumnFilters<int> get location_id => $state.composableBuilder(
      column: $state.table.location_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get location_code => $state.composableBuilder(
      column: $state.table.location_code,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get location_name => $state.composableBuilder(
      column: $state.table.location_name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get location_desc => $state.composableBuilder(
      column: $state.table.location_desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$LocationMasterDBTableOrderingComposer
    extends OrderingComposer<_$AppDb, $LocationMasterDBTable> {
  $$LocationMasterDBTableOrderingComposer(super.$state);
  ColumnOrderings<int> get location_id => $state.composableBuilder(
      column: $state.table.location_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get location_code => $state.composableBuilder(
      column: $state.table.location_code,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get location_name => $state.composableBuilder(
      column: $state.table.location_name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get location_desc => $state.composableBuilder(
      column: $state.table.location_desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$LocationMasterDBTableTableManager extends RootTableManager<
    _$AppDb,
    $LocationMasterDBTable,
    LocationMasterDBData,
    $$LocationMasterDBTableFilterComposer,
    $$LocationMasterDBTableOrderingComposer,
    $$LocationMasterDBTableCreateCompanionBuilder,
    $$LocationMasterDBTableUpdateCompanionBuilder,
    (
      LocationMasterDBData,
      BaseReferences<_$AppDb, $LocationMasterDBTable, LocationMasterDBData>
    ),
    LocationMasterDBData,
    PrefetchHooks Function()> {
  $$LocationMasterDBTableTableManager(_$AppDb db, $LocationMasterDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LocationMasterDBTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LocationMasterDBTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> location_id = const Value.absent(),
            Value<String?> location_code = const Value.absent(),
            Value<String?> location_name = const Value.absent(),
            Value<String?> location_desc = const Value.absent(),
          }) =>
              LocationMasterDBCompanion(
            location_id: location_id,
            location_code: location_code,
            location_name: location_name,
            location_desc: location_desc,
          ),
          createCompanionCallback: ({
            Value<int> location_id = const Value.absent(),
            Value<String?> location_code = const Value.absent(),
            Value<String?> location_name = const Value.absent(),
            Value<String?> location_desc = const Value.absent(),
          }) =>
              LocationMasterDBCompanion.insert(
            location_id: location_id,
            location_code: location_code,
            location_name: location_name,
            location_desc: location_desc,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocationMasterDBTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $LocationMasterDBTable,
    LocationMasterDBData,
    $$LocationMasterDBTableFilterComposer,
    $$LocationMasterDBTableOrderingComposer,
    $$LocationMasterDBTableCreateCompanionBuilder,
    $$LocationMasterDBTableUpdateCompanionBuilder,
    (
      LocationMasterDBData,
      BaseReferences<_$AppDb, $LocationMasterDBTable, LocationMasterDBData>
    ),
    LocationMasterDBData,
    PrefetchHooks Function()>;
typedef $$TransactionsDBTableCreateCompanionBuilder = TransactionsDBCompanion
    Function({
  Value<int> key_id,
  Value<int?> item_id,
  required String count_ItemCode,
  Value<String?> count_location_id,
  Value<String?> count_location_code,
  Value<int?> count_QuantityScan,
  Value<String?> serial_number,
  Value<String?> status_item,
  Value<String?> rssi,
  Value<DateTime?> created_date,
  Value<DateTime?> updated_date,
});
typedef $$TransactionsDBTableUpdateCompanionBuilder = TransactionsDBCompanion
    Function({
  Value<int> key_id,
  Value<int?> item_id,
  Value<String> count_ItemCode,
  Value<String?> count_location_id,
  Value<String?> count_location_code,
  Value<int?> count_QuantityScan,
  Value<String?> serial_number,
  Value<String?> status_item,
  Value<String?> rssi,
  Value<DateTime?> created_date,
  Value<DateTime?> updated_date,
});

class $$TransactionsDBTableFilterComposer
    extends FilterComposer<_$AppDb, $TransactionsDBTable> {
  $$TransactionsDBTableFilterComposer(super.$state);
  ColumnFilters<int> get key_id => $state.composableBuilder(
      column: $state.table.key_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get item_id => $state.composableBuilder(
      column: $state.table.item_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get count_ItemCode => $state.composableBuilder(
      column: $state.table.count_ItemCode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get count_location_id => $state.composableBuilder(
      column: $state.table.count_location_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get count_location_code => $state.composableBuilder(
      column: $state.table.count_location_code,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get count_QuantityScan => $state.composableBuilder(
      column: $state.table.count_QuantityScan,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get serial_number => $state.composableBuilder(
      column: $state.table.serial_number,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status_item => $state.composableBuilder(
      column: $state.table.status_item,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get rssi => $state.composableBuilder(
      column: $state.table.rssi,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get created_date => $state.composableBuilder(
      column: $state.table.created_date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updated_date => $state.composableBuilder(
      column: $state.table.updated_date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TransactionsDBTableOrderingComposer
    extends OrderingComposer<_$AppDb, $TransactionsDBTable> {
  $$TransactionsDBTableOrderingComposer(super.$state);
  ColumnOrderings<int> get key_id => $state.composableBuilder(
      column: $state.table.key_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get item_id => $state.composableBuilder(
      column: $state.table.item_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get count_ItemCode => $state.composableBuilder(
      column: $state.table.count_ItemCode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get count_location_id => $state.composableBuilder(
      column: $state.table.count_location_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get count_location_code => $state.composableBuilder(
      column: $state.table.count_location_code,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get count_QuantityScan => $state.composableBuilder(
      column: $state.table.count_QuantityScan,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get serial_number => $state.composableBuilder(
      column: $state.table.serial_number,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status_item => $state.composableBuilder(
      column: $state.table.status_item,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get rssi => $state.composableBuilder(
      column: $state.table.rssi,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get created_date => $state.composableBuilder(
      column: $state.table.created_date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updated_date => $state.composableBuilder(
      column: $state.table.updated_date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TransactionsDBTableTableManager extends RootTableManager<
    _$AppDb,
    $TransactionsDBTable,
    TransactionsDBData,
    $$TransactionsDBTableFilterComposer,
    $$TransactionsDBTableOrderingComposer,
    $$TransactionsDBTableCreateCompanionBuilder,
    $$TransactionsDBTableUpdateCompanionBuilder,
    (
      TransactionsDBData,
      BaseReferences<_$AppDb, $TransactionsDBTable, TransactionsDBData>
    ),
    TransactionsDBData,
    PrefetchHooks Function()> {
  $$TransactionsDBTableTableManager(_$AppDb db, $TransactionsDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransactionsDBTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransactionsDBTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> key_id = const Value.absent(),
            Value<int?> item_id = const Value.absent(),
            Value<String> count_ItemCode = const Value.absent(),
            Value<String?> count_location_id = const Value.absent(),
            Value<String?> count_location_code = const Value.absent(),
            Value<int?> count_QuantityScan = const Value.absent(),
            Value<String?> serial_number = const Value.absent(),
            Value<String?> status_item = const Value.absent(),
            Value<String?> rssi = const Value.absent(),
            Value<DateTime?> created_date = const Value.absent(),
            Value<DateTime?> updated_date = const Value.absent(),
          }) =>
              TransactionsDBCompanion(
            key_id: key_id,
            item_id: item_id,
            count_ItemCode: count_ItemCode,
            count_location_id: count_location_id,
            count_location_code: count_location_code,
            count_QuantityScan: count_QuantityScan,
            serial_number: serial_number,
            status_item: status_item,
            rssi: rssi,
            created_date: created_date,
            updated_date: updated_date,
          ),
          createCompanionCallback: ({
            Value<int> key_id = const Value.absent(),
            Value<int?> item_id = const Value.absent(),
            required String count_ItemCode,
            Value<String?> count_location_id = const Value.absent(),
            Value<String?> count_location_code = const Value.absent(),
            Value<int?> count_QuantityScan = const Value.absent(),
            Value<String?> serial_number = const Value.absent(),
            Value<String?> status_item = const Value.absent(),
            Value<String?> rssi = const Value.absent(),
            Value<DateTime?> created_date = const Value.absent(),
            Value<DateTime?> updated_date = const Value.absent(),
          }) =>
              TransactionsDBCompanion.insert(
            key_id: key_id,
            item_id: item_id,
            count_ItemCode: count_ItemCode,
            count_location_id: count_location_id,
            count_location_code: count_location_code,
            count_QuantityScan: count_QuantityScan,
            serial_number: serial_number,
            status_item: status_item,
            rssi: rssi,
            created_date: created_date,
            updated_date: updated_date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionsDBTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $TransactionsDBTable,
    TransactionsDBData,
    $$TransactionsDBTableFilterComposer,
    $$TransactionsDBTableOrderingComposer,
    $$TransactionsDBTableCreateCompanionBuilder,
    $$TransactionsDBTableUpdateCompanionBuilder,
    (
      TransactionsDBData,
      BaseReferences<_$AppDb, $TransactionsDBTable, TransactionsDBData>
    ),
    TransactionsDBData,
    PrefetchHooks Function()>;
typedef $$AppSettingDBTableCreateCompanionBuilder = AppSettingDBCompanion
    Function({
  Value<int> item_id,
  Value<String?> name,
  required bool is_validate,
  required bool is_active,
});
typedef $$AppSettingDBTableUpdateCompanionBuilder = AppSettingDBCompanion
    Function({
  Value<int> item_id,
  Value<String?> name,
  Value<bool> is_validate,
  Value<bool> is_active,
});

class $$AppSettingDBTableFilterComposer
    extends FilterComposer<_$AppDb, $AppSettingDBTable> {
  $$AppSettingDBTableFilterComposer(super.$state);
  ColumnFilters<int> get item_id => $state.composableBuilder(
      column: $state.table.item_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get is_validate => $state.composableBuilder(
      column: $state.table.is_validate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get is_active => $state.composableBuilder(
      column: $state.table.is_active,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AppSettingDBTableOrderingComposer
    extends OrderingComposer<_$AppDb, $AppSettingDBTable> {
  $$AppSettingDBTableOrderingComposer(super.$state);
  ColumnOrderings<int> get item_id => $state.composableBuilder(
      column: $state.table.item_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get is_validate => $state.composableBuilder(
      column: $state.table.is_validate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get is_active => $state.composableBuilder(
      column: $state.table.is_active,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$AppSettingDBTableTableManager extends RootTableManager<
    _$AppDb,
    $AppSettingDBTable,
    AppSettingDBData,
    $$AppSettingDBTableFilterComposer,
    $$AppSettingDBTableOrderingComposer,
    $$AppSettingDBTableCreateCompanionBuilder,
    $$AppSettingDBTableUpdateCompanionBuilder,
    (
      AppSettingDBData,
      BaseReferences<_$AppDb, $AppSettingDBTable, AppSettingDBData>
    ),
    AppSettingDBData,
    PrefetchHooks Function()> {
  $$AppSettingDBTableTableManager(_$AppDb db, $AppSettingDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AppSettingDBTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AppSettingDBTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> item_id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<bool> is_validate = const Value.absent(),
            Value<bool> is_active = const Value.absent(),
          }) =>
              AppSettingDBCompanion(
            item_id: item_id,
            name: name,
            is_validate: is_validate,
            is_active: is_active,
          ),
          createCompanionCallback: ({
            Value<int> item_id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            required bool is_validate,
            required bool is_active,
          }) =>
              AppSettingDBCompanion.insert(
            item_id: item_id,
            name: name,
            is_validate: is_validate,
            is_active: is_active,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingDBTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $AppSettingDBTable,
    AppSettingDBData,
    $$AppSettingDBTableFilterComposer,
    $$AppSettingDBTableOrderingComposer,
    $$AppSettingDBTableCreateCompanionBuilder,
    $$AppSettingDBTableUpdateCompanionBuilder,
    (
      AppSettingDBData,
      BaseReferences<_$AppDb, $AppSettingDBTable, AppSettingDBData>
    ),
    AppSettingDBData,
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$ItemMasterDBTableTableManager get itemMasterDB =>
      $$ItemMasterDBTableTableManager(_db, _db.itemMasterDB);
  $$LocationMasterDBTableTableManager get locationMasterDB =>
      $$LocationMasterDBTableTableManager(_db, _db.locationMasterDB);
  $$TransactionsDBTableTableManager get transactionsDB =>
      $$TransactionsDBTableTableManager(_db, _db.transactionsDB);
  $$AppSettingDBTableTableManager get appSettingDB =>
      $$AppSettingDBTableTableManager(_db, _db.appSettingDB);
}
