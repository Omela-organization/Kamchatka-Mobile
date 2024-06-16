// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $RoutesTable extends Routes with TableInfo<$RoutesTable, Route> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _trackTypeMeta =
      const VerificationMeta('trackType');
  @override
  late final GeneratedColumn<String> trackType = GeneratedColumn<String>(
      'track_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _territoryIdMeta =
      const VerificationMeta('territoryId');
  @override
  late final GeneratedColumn<int> territoryId = GeneratedColumn<int>(
      'territory_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _coordsMeta = const VerificationMeta('coords');
  @override
  late final GeneratedColumn<String> coords = GeneratedColumn<String>(
      'coords', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timePassingTrackMeta =
      const VerificationMeta('timePassingTrack');
  @override
  late final GeneratedColumn<int> timePassingTrack = GeneratedColumn<int>(
      'time_passing_track', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _recreationCapacityMeta =
      const VerificationMeta('recreationCapacity');
  @override
  late final GeneratedColumn<int> recreationCapacity = GeneratedColumn<int>(
      'recreation_capacity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        trackType,
        territoryId,
        coords,
        timePassingTrack,
        recreationCapacity
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routes';
  @override
  VerificationContext validateIntegrity(Insertable<Route> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('track_type')) {
      context.handle(_trackTypeMeta,
          trackType.isAcceptableOrUnknown(data['track_type']!, _trackTypeMeta));
    } else if (isInserting) {
      context.missing(_trackTypeMeta);
    }
    if (data.containsKey('territory_id')) {
      context.handle(
          _territoryIdMeta,
          territoryId.isAcceptableOrUnknown(
              data['territory_id']!, _territoryIdMeta));
    } else if (isInserting) {
      context.missing(_territoryIdMeta);
    }
    if (data.containsKey('coords')) {
      context.handle(_coordsMeta,
          coords.isAcceptableOrUnknown(data['coords']!, _coordsMeta));
    } else if (isInserting) {
      context.missing(_coordsMeta);
    }
    if (data.containsKey('time_passing_track')) {
      context.handle(
          _timePassingTrackMeta,
          timePassingTrack.isAcceptableOrUnknown(
              data['time_passing_track']!, _timePassingTrackMeta));
    } else if (isInserting) {
      context.missing(_timePassingTrackMeta);
    }
    if (data.containsKey('recreation_capacity')) {
      context.handle(
          _recreationCapacityMeta,
          recreationCapacity.isAcceptableOrUnknown(
              data['recreation_capacity']!, _recreationCapacityMeta));
    } else if (isInserting) {
      context.missing(_recreationCapacityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Route map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Route(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      trackType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}track_type'])!,
      territoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}territory_id'])!,
      coords: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}coords'])!,
      timePassingTrack: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_passing_track'])!,
      recreationCapacity: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}recreation_capacity'])!,
    );
  }

  @override
  $RoutesTable createAlias(String alias) {
    return $RoutesTable(attachedDatabase, alias);
  }
}

class Route extends DataClass implements Insertable<Route> {
  final int id;
  final String name;
  final String trackType;
  final int territoryId;
  final String coords;
  final int timePassingTrack;
  final int recreationCapacity;
  const Route(
      {required this.id,
      required this.name,
      required this.trackType,
      required this.territoryId,
      required this.coords,
      required this.timePassingTrack,
      required this.recreationCapacity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['track_type'] = Variable<String>(trackType);
    map['territory_id'] = Variable<int>(territoryId);
    map['coords'] = Variable<String>(coords);
    map['time_passing_track'] = Variable<int>(timePassingTrack);
    map['recreation_capacity'] = Variable<int>(recreationCapacity);
    return map;
  }

  RoutesCompanion toCompanion(bool nullToAbsent) {
    return RoutesCompanion(
      id: Value(id),
      name: Value(name),
      trackType: Value(trackType),
      territoryId: Value(territoryId),
      coords: Value(coords),
      timePassingTrack: Value(timePassingTrack),
      recreationCapacity: Value(recreationCapacity),
    );
  }

  factory Route.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Route(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      trackType: serializer.fromJson<String>(json['trackType']),
      territoryId: serializer.fromJson<int>(json['territoryId']),
      coords: serializer.fromJson<String>(json['coords']),
      timePassingTrack: serializer.fromJson<int>(json['timePassingTrack']),
      recreationCapacity: serializer.fromJson<int>(json['recreationCapacity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'trackType': serializer.toJson<String>(trackType),
      'territoryId': serializer.toJson<int>(territoryId),
      'coords': serializer.toJson<String>(coords),
      'timePassingTrack': serializer.toJson<int>(timePassingTrack),
      'recreationCapacity': serializer.toJson<int>(recreationCapacity),
    };
  }

  Route copyWith(
          {int? id,
          String? name,
          String? trackType,
          int? territoryId,
          String? coords,
          int? timePassingTrack,
          int? recreationCapacity}) =>
      Route(
        id: id ?? this.id,
        name: name ?? this.name,
        trackType: trackType ?? this.trackType,
        territoryId: territoryId ?? this.territoryId,
        coords: coords ?? this.coords,
        timePassingTrack: timePassingTrack ?? this.timePassingTrack,
        recreationCapacity: recreationCapacity ?? this.recreationCapacity,
      );
  @override
  String toString() {
    return (StringBuffer('Route(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('trackType: $trackType, ')
          ..write('territoryId: $territoryId, ')
          ..write('coords: $coords, ')
          ..write('timePassingTrack: $timePassingTrack, ')
          ..write('recreationCapacity: $recreationCapacity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, trackType, territoryId, coords,
      timePassingTrack, recreationCapacity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Route &&
          other.id == this.id &&
          other.name == this.name &&
          other.trackType == this.trackType &&
          other.territoryId == this.territoryId &&
          other.coords == this.coords &&
          other.timePassingTrack == this.timePassingTrack &&
          other.recreationCapacity == this.recreationCapacity);
}

class RoutesCompanion extends UpdateCompanion<Route> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> trackType;
  final Value<int> territoryId;
  final Value<String> coords;
  final Value<int> timePassingTrack;
  final Value<int> recreationCapacity;
  const RoutesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.trackType = const Value.absent(),
    this.territoryId = const Value.absent(),
    this.coords = const Value.absent(),
    this.timePassingTrack = const Value.absent(),
    this.recreationCapacity = const Value.absent(),
  });
  RoutesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String trackType,
    required int territoryId,
    required String coords,
    required int timePassingTrack,
    required int recreationCapacity,
  })  : name = Value(name),
        trackType = Value(trackType),
        territoryId = Value(territoryId),
        coords = Value(coords),
        timePassingTrack = Value(timePassingTrack),
        recreationCapacity = Value(recreationCapacity);
  static Insertable<Route> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? trackType,
    Expression<int>? territoryId,
    Expression<String>? coords,
    Expression<int>? timePassingTrack,
    Expression<int>? recreationCapacity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (trackType != null) 'track_type': trackType,
      if (territoryId != null) 'territory_id': territoryId,
      if (coords != null) 'coords': coords,
      if (timePassingTrack != null) 'time_passing_track': timePassingTrack,
      if (recreationCapacity != null) 'recreation_capacity': recreationCapacity,
    });
  }

  RoutesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? trackType,
      Value<int>? territoryId,
      Value<String>? coords,
      Value<int>? timePassingTrack,
      Value<int>? recreationCapacity}) {
    return RoutesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      trackType: trackType ?? this.trackType,
      territoryId: territoryId ?? this.territoryId,
      coords: coords ?? this.coords,
      timePassingTrack: timePassingTrack ?? this.timePassingTrack,
      recreationCapacity: recreationCapacity ?? this.recreationCapacity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (trackType.present) {
      map['track_type'] = Variable<String>(trackType.value);
    }
    if (territoryId.present) {
      map['territory_id'] = Variable<int>(territoryId.value);
    }
    if (coords.present) {
      map['coords'] = Variable<String>(coords.value);
    }
    if (timePassingTrack.present) {
      map['time_passing_track'] = Variable<int>(timePassingTrack.value);
    }
    if (recreationCapacity.present) {
      map['recreation_capacity'] = Variable<int>(recreationCapacity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('trackType: $trackType, ')
          ..write('territoryId: $territoryId, ')
          ..write('coords: $coords, ')
          ..write('timePassingTrack: $timePassingTrack, ')
          ..write('recreationCapacity: $recreationCapacity')
          ..write(')'))
        .toString();
  }
}

class $RegistrationFormsTable extends RegistrationForms
    with TableInfo<$RegistrationFormsTable, RegistrationFormEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegistrationFormsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _arrivalDateMeta =
      const VerificationMeta('arrivalDate');
  @override
  late final GeneratedColumn<DateTime> arrivalDate = GeneratedColumn<DateTime>(
      'arrival_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _middleNameMeta =
      const VerificationMeta('middleName');
  @override
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
      'middle_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nationalityMeta =
      const VerificationMeta('nationality');
  @override
  late final GeneratedColumn<String> nationality = GeneratedColumn<String>(
      'nationality', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passportNumberMeta =
      const VerificationMeta('passportNumber');
  @override
  late final GeneratedColumn<int> passportNumber = GeneratedColumn<int>(
      'passport_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _visitPurposeMeta =
      const VerificationMeta('visitPurpose');
  @override
  late final GeneratedColumn<String> visitPurpose = GeneratedColumn<String>(
      'visit_purpose', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _visitFormatMeta =
      const VerificationMeta('visitFormat');
  @override
  late final GeneratedColumn<String> visitFormat = GeneratedColumn<String>(
      'visit_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        arrivalDate,
        lastName,
        firstName,
        middleName,
        birthDate,
        nationality,
        gender,
        passportNumber,
        email,
        phone,
        visitPurpose,
        visitFormat
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'registration_forms';
  @override
  VerificationContext validateIntegrity(
      Insertable<RegistrationFormEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('arrival_date')) {
      context.handle(
          _arrivalDateMeta,
          arrivalDate.isAcceptableOrUnknown(
              data['arrival_date']!, _arrivalDateMeta));
    } else if (isInserting) {
      context.missing(_arrivalDateMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['middle_name']!, _middleNameMeta));
    } else if (isInserting) {
      context.missing(_middleNameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('nationality')) {
      context.handle(
          _nationalityMeta,
          nationality.isAcceptableOrUnknown(
              data['nationality']!, _nationalityMeta));
    } else if (isInserting) {
      context.missing(_nationalityMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('passport_number')) {
      context.handle(
          _passportNumberMeta,
          passportNumber.isAcceptableOrUnknown(
              data['passport_number']!, _passportNumberMeta));
    } else if (isInserting) {
      context.missing(_passportNumberMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('visit_purpose')) {
      context.handle(
          _visitPurposeMeta,
          visitPurpose.isAcceptableOrUnknown(
              data['visit_purpose']!, _visitPurposeMeta));
    } else if (isInserting) {
      context.missing(_visitPurposeMeta);
    }
    if (data.containsKey('visit_format')) {
      context.handle(
          _visitFormatMeta,
          visitFormat.isAcceptableOrUnknown(
              data['visit_format']!, _visitFormatMeta));
    } else if (isInserting) {
      context.missing(_visitFormatMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegistrationFormEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegistrationFormEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      arrivalDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}arrival_date'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      middleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}middle_name'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
      nationality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nationality'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      passportNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}passport_number'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      visitPurpose: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}visit_purpose'])!,
      visitFormat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}visit_format'])!,
    );
  }

  @override
  $RegistrationFormsTable createAlias(String alias) {
    return $RegistrationFormsTable(attachedDatabase, alias);
  }
}

class RegistrationFormEntry extends DataClass
    implements Insertable<RegistrationFormEntry> {
  final int id;
  final DateTime arrivalDate;
  final String lastName;
  final String firstName;
  final String middleName;
  final DateTime birthDate;
  final String nationality;
  final String gender;
  final int passportNumber;
  final String email;
  final String phone;
  final String visitPurpose;
  final String visitFormat;
  const RegistrationFormEntry(
      {required this.id,
      required this.arrivalDate,
      required this.lastName,
      required this.firstName,
      required this.middleName,
      required this.birthDate,
      required this.nationality,
      required this.gender,
      required this.passportNumber,
      required this.email,
      required this.phone,
      required this.visitPurpose,
      required this.visitFormat});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['arrival_date'] = Variable<DateTime>(arrivalDate);
    map['last_name'] = Variable<String>(lastName);
    map['first_name'] = Variable<String>(firstName);
    map['middle_name'] = Variable<String>(middleName);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['nationality'] = Variable<String>(nationality);
    map['gender'] = Variable<String>(gender);
    map['passport_number'] = Variable<int>(passportNumber);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['visit_purpose'] = Variable<String>(visitPurpose);
    map['visit_format'] = Variable<String>(visitFormat);
    return map;
  }

  RegistrationFormsCompanion toCompanion(bool nullToAbsent) {
    return RegistrationFormsCompanion(
      id: Value(id),
      arrivalDate: Value(arrivalDate),
      lastName: Value(lastName),
      firstName: Value(firstName),
      middleName: Value(middleName),
      birthDate: Value(birthDate),
      nationality: Value(nationality),
      gender: Value(gender),
      passportNumber: Value(passportNumber),
      email: Value(email),
      phone: Value(phone),
      visitPurpose: Value(visitPurpose),
      visitFormat: Value(visitFormat),
    );
  }

  factory RegistrationFormEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegistrationFormEntry(
      id: serializer.fromJson<int>(json['id']),
      arrivalDate: serializer.fromJson<DateTime>(json['arrivalDate']),
      lastName: serializer.fromJson<String>(json['lastName']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String>(json['middleName']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      nationality: serializer.fromJson<String>(json['nationality']),
      gender: serializer.fromJson<String>(json['gender']),
      passportNumber: serializer.fromJson<int>(json['passportNumber']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      visitPurpose: serializer.fromJson<String>(json['visitPurpose']),
      visitFormat: serializer.fromJson<String>(json['visitFormat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'arrivalDate': serializer.toJson<DateTime>(arrivalDate),
      'lastName': serializer.toJson<String>(lastName),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String>(middleName),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'nationality': serializer.toJson<String>(nationality),
      'gender': serializer.toJson<String>(gender),
      'passportNumber': serializer.toJson<int>(passportNumber),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'visitPurpose': serializer.toJson<String>(visitPurpose),
      'visitFormat': serializer.toJson<String>(visitFormat),
    };
  }

  RegistrationFormEntry copyWith(
          {int? id,
          DateTime? arrivalDate,
          String? lastName,
          String? firstName,
          String? middleName,
          DateTime? birthDate,
          String? nationality,
          String? gender,
          int? passportNumber,
          String? email,
          String? phone,
          String? visitPurpose,
          String? visitFormat}) =>
      RegistrationFormEntry(
        id: id ?? this.id,
        arrivalDate: arrivalDate ?? this.arrivalDate,
        lastName: lastName ?? this.lastName,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        birthDate: birthDate ?? this.birthDate,
        nationality: nationality ?? this.nationality,
        gender: gender ?? this.gender,
        passportNumber: passportNumber ?? this.passportNumber,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        visitPurpose: visitPurpose ?? this.visitPurpose,
        visitFormat: visitFormat ?? this.visitFormat,
      );
  @override
  String toString() {
    return (StringBuffer('RegistrationFormEntry(')
          ..write('id: $id, ')
          ..write('arrivalDate: $arrivalDate, ')
          ..write('lastName: $lastName, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('birthDate: $birthDate, ')
          ..write('nationality: $nationality, ')
          ..write('gender: $gender, ')
          ..write('passportNumber: $passportNumber, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('visitPurpose: $visitPurpose, ')
          ..write('visitFormat: $visitFormat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      arrivalDate,
      lastName,
      firstName,
      middleName,
      birthDate,
      nationality,
      gender,
      passportNumber,
      email,
      phone,
      visitPurpose,
      visitFormat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegistrationFormEntry &&
          other.id == this.id &&
          other.arrivalDate == this.arrivalDate &&
          other.lastName == this.lastName &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.birthDate == this.birthDate &&
          other.nationality == this.nationality &&
          other.gender == this.gender &&
          other.passportNumber == this.passportNumber &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.visitPurpose == this.visitPurpose &&
          other.visitFormat == this.visitFormat);
}

class RegistrationFormsCompanion
    extends UpdateCompanion<RegistrationFormEntry> {
  final Value<int> id;
  final Value<DateTime> arrivalDate;
  final Value<String> lastName;
  final Value<String> firstName;
  final Value<String> middleName;
  final Value<DateTime> birthDate;
  final Value<String> nationality;
  final Value<String> gender;
  final Value<int> passportNumber;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> visitPurpose;
  final Value<String> visitFormat;
  const RegistrationFormsCompanion({
    this.id = const Value.absent(),
    this.arrivalDate = const Value.absent(),
    this.lastName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.nationality = const Value.absent(),
    this.gender = const Value.absent(),
    this.passportNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.visitPurpose = const Value.absent(),
    this.visitFormat = const Value.absent(),
  });
  RegistrationFormsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime arrivalDate,
    required String lastName,
    required String firstName,
    required String middleName,
    required DateTime birthDate,
    required String nationality,
    required String gender,
    required int passportNumber,
    required String email,
    required String phone,
    required String visitPurpose,
    required String visitFormat,
  })  : arrivalDate = Value(arrivalDate),
        lastName = Value(lastName),
        firstName = Value(firstName),
        middleName = Value(middleName),
        birthDate = Value(birthDate),
        nationality = Value(nationality),
        gender = Value(gender),
        passportNumber = Value(passportNumber),
        email = Value(email),
        phone = Value(phone),
        visitPurpose = Value(visitPurpose),
        visitFormat = Value(visitFormat);
  static Insertable<RegistrationFormEntry> custom({
    Expression<int>? id,
    Expression<DateTime>? arrivalDate,
    Expression<String>? lastName,
    Expression<String>? firstName,
    Expression<String>? middleName,
    Expression<DateTime>? birthDate,
    Expression<String>? nationality,
    Expression<String>? gender,
    Expression<int>? passportNumber,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? visitPurpose,
    Expression<String>? visitFormat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (arrivalDate != null) 'arrival_date': arrivalDate,
      if (lastName != null) 'last_name': lastName,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (birthDate != null) 'birth_date': birthDate,
      if (nationality != null) 'nationality': nationality,
      if (gender != null) 'gender': gender,
      if (passportNumber != null) 'passport_number': passportNumber,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (visitPurpose != null) 'visit_purpose': visitPurpose,
      if (visitFormat != null) 'visit_format': visitFormat,
    });
  }

  RegistrationFormsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? arrivalDate,
      Value<String>? lastName,
      Value<String>? firstName,
      Value<String>? middleName,
      Value<DateTime>? birthDate,
      Value<String>? nationality,
      Value<String>? gender,
      Value<int>? passportNumber,
      Value<String>? email,
      Value<String>? phone,
      Value<String>? visitPurpose,
      Value<String>? visitFormat}) {
    return RegistrationFormsCompanion(
      id: id ?? this.id,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      birthDate: birthDate ?? this.birthDate,
      nationality: nationality ?? this.nationality,
      gender: gender ?? this.gender,
      passportNumber: passportNumber ?? this.passportNumber,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      visitPurpose: visitPurpose ?? this.visitPurpose,
      visitFormat: visitFormat ?? this.visitFormat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (arrivalDate.present) {
      map['arrival_date'] = Variable<DateTime>(arrivalDate.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = Variable<String>(middleName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (nationality.present) {
      map['nationality'] = Variable<String>(nationality.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (passportNumber.present) {
      map['passport_number'] = Variable<int>(passportNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (visitPurpose.present) {
      map['visit_purpose'] = Variable<String>(visitPurpose.value);
    }
    if (visitFormat.present) {
      map['visit_format'] = Variable<String>(visitFormat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistrationFormsCompanion(')
          ..write('id: $id, ')
          ..write('arrivalDate: $arrivalDate, ')
          ..write('lastName: $lastName, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('birthDate: $birthDate, ')
          ..write('nationality: $nationality, ')
          ..write('gender: $gender, ')
          ..write('passportNumber: $passportNumber, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('visitPurpose: $visitPurpose, ')
          ..write('visitFormat: $visitFormat')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $RoutesTable routes = $RoutesTable(this);
  late final $RegistrationFormsTable registrationForms =
      $RegistrationFormsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [routes, registrationForms];
}

typedef $$RoutesTableInsertCompanionBuilder = RoutesCompanion Function({
  Value<int> id,
  required String name,
  required String trackType,
  required int territoryId,
  required String coords,
  required int timePassingTrack,
  required int recreationCapacity,
});
typedef $$RoutesTableUpdateCompanionBuilder = RoutesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> trackType,
  Value<int> territoryId,
  Value<String> coords,
  Value<int> timePassingTrack,
  Value<int> recreationCapacity,
});

class $$RoutesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutesTable,
    Route,
    $$RoutesTableFilterComposer,
    $$RoutesTableOrderingComposer,
    $$RoutesTableProcessedTableManager,
    $$RoutesTableInsertCompanionBuilder,
    $$RoutesTableUpdateCompanionBuilder> {
  $$RoutesTableTableManager(_$AppDatabase db, $RoutesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RoutesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RoutesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$RoutesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> trackType = const Value.absent(),
            Value<int> territoryId = const Value.absent(),
            Value<String> coords = const Value.absent(),
            Value<int> timePassingTrack = const Value.absent(),
            Value<int> recreationCapacity = const Value.absent(),
          }) =>
              RoutesCompanion(
            id: id,
            name: name,
            trackType: trackType,
            territoryId: territoryId,
            coords: coords,
            timePassingTrack: timePassingTrack,
            recreationCapacity: recreationCapacity,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String trackType,
            required int territoryId,
            required String coords,
            required int timePassingTrack,
            required int recreationCapacity,
          }) =>
              RoutesCompanion.insert(
            id: id,
            name: name,
            trackType: trackType,
            territoryId: territoryId,
            coords: coords,
            timePassingTrack: timePassingTrack,
            recreationCapacity: recreationCapacity,
          ),
        ));
}

class $$RoutesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $RoutesTable,
    Route,
    $$RoutesTableFilterComposer,
    $$RoutesTableOrderingComposer,
    $$RoutesTableProcessedTableManager,
    $$RoutesTableInsertCompanionBuilder,
    $$RoutesTableUpdateCompanionBuilder> {
  $$RoutesTableProcessedTableManager(super.$state);
}

class $$RoutesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get trackType => $state.composableBuilder(
      column: $state.table.trackType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get territoryId => $state.composableBuilder(
      column: $state.table.territoryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get coords => $state.composableBuilder(
      column: $state.table.coords,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timePassingTrack => $state.composableBuilder(
      column: $state.table.timePassingTrack,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get recreationCapacity => $state.composableBuilder(
      column: $state.table.recreationCapacity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$RoutesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get trackType => $state.composableBuilder(
      column: $state.table.trackType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get territoryId => $state.composableBuilder(
      column: $state.table.territoryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get coords => $state.composableBuilder(
      column: $state.table.coords,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timePassingTrack => $state.composableBuilder(
      column: $state.table.timePassingTrack,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get recreationCapacity => $state.composableBuilder(
      column: $state.table.recreationCapacity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$RegistrationFormsTableInsertCompanionBuilder
    = RegistrationFormsCompanion Function({
  Value<int> id,
  required DateTime arrivalDate,
  required String lastName,
  required String firstName,
  required String middleName,
  required DateTime birthDate,
  required String nationality,
  required String gender,
  required int passportNumber,
  required String email,
  required String phone,
  required String visitPurpose,
  required String visitFormat,
});
typedef $$RegistrationFormsTableUpdateCompanionBuilder
    = RegistrationFormsCompanion Function({
  Value<int> id,
  Value<DateTime> arrivalDate,
  Value<String> lastName,
  Value<String> firstName,
  Value<String> middleName,
  Value<DateTime> birthDate,
  Value<String> nationality,
  Value<String> gender,
  Value<int> passportNumber,
  Value<String> email,
  Value<String> phone,
  Value<String> visitPurpose,
  Value<String> visitFormat,
});

class $$RegistrationFormsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RegistrationFormsTable,
    RegistrationFormEntry,
    $$RegistrationFormsTableFilterComposer,
    $$RegistrationFormsTableOrderingComposer,
    $$RegistrationFormsTableProcessedTableManager,
    $$RegistrationFormsTableInsertCompanionBuilder,
    $$RegistrationFormsTableUpdateCompanionBuilder> {
  $$RegistrationFormsTableTableManager(
      _$AppDatabase db, $RegistrationFormsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RegistrationFormsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$RegistrationFormsTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$RegistrationFormsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> arrivalDate = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> middleName = const Value.absent(),
            Value<DateTime> birthDate = const Value.absent(),
            Value<String> nationality = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<int> passportNumber = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> visitPurpose = const Value.absent(),
            Value<String> visitFormat = const Value.absent(),
          }) =>
              RegistrationFormsCompanion(
            id: id,
            arrivalDate: arrivalDate,
            lastName: lastName,
            firstName: firstName,
            middleName: middleName,
            birthDate: birthDate,
            nationality: nationality,
            gender: gender,
            passportNumber: passportNumber,
            email: email,
            phone: phone,
            visitPurpose: visitPurpose,
            visitFormat: visitFormat,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required DateTime arrivalDate,
            required String lastName,
            required String firstName,
            required String middleName,
            required DateTime birthDate,
            required String nationality,
            required String gender,
            required int passportNumber,
            required String email,
            required String phone,
            required String visitPurpose,
            required String visitFormat,
          }) =>
              RegistrationFormsCompanion.insert(
            id: id,
            arrivalDate: arrivalDate,
            lastName: lastName,
            firstName: firstName,
            middleName: middleName,
            birthDate: birthDate,
            nationality: nationality,
            gender: gender,
            passportNumber: passportNumber,
            email: email,
            phone: phone,
            visitPurpose: visitPurpose,
            visitFormat: visitFormat,
          ),
        ));
}

class $$RegistrationFormsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $RegistrationFormsTable,
        RegistrationFormEntry,
        $$RegistrationFormsTableFilterComposer,
        $$RegistrationFormsTableOrderingComposer,
        $$RegistrationFormsTableProcessedTableManager,
        $$RegistrationFormsTableInsertCompanionBuilder,
        $$RegistrationFormsTableUpdateCompanionBuilder> {
  $$RegistrationFormsTableProcessedTableManager(super.$state);
}

class $$RegistrationFormsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RegistrationFormsTable> {
  $$RegistrationFormsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get arrivalDate => $state.composableBuilder(
      column: $state.table.arrivalDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get middleName => $state.composableBuilder(
      column: $state.table.middleName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get birthDate => $state.composableBuilder(
      column: $state.table.birthDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nationality => $state.composableBuilder(
      column: $state.table.nationality,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get passportNumber => $state.composableBuilder(
      column: $state.table.passportNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get visitPurpose => $state.composableBuilder(
      column: $state.table.visitPurpose,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get visitFormat => $state.composableBuilder(
      column: $state.table.visitFormat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$RegistrationFormsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RegistrationFormsTable> {
  $$RegistrationFormsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get arrivalDate => $state.composableBuilder(
      column: $state.table.arrivalDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get middleName => $state.composableBuilder(
      column: $state.table.middleName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get birthDate => $state.composableBuilder(
      column: $state.table.birthDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nationality => $state.composableBuilder(
      column: $state.table.nationality,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get passportNumber => $state.composableBuilder(
      column: $state.table.passportNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get visitPurpose => $state.composableBuilder(
      column: $state.table.visitPurpose,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get visitFormat => $state.composableBuilder(
      column: $state.table.visitFormat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$RoutesTableTableManager get routes =>
      $$RoutesTableTableManager(_db, _db.routes);
  $$RegistrationFormsTableTableManager get registrationForms =>
      $$RegistrationFormsTableTableManager(_db, _db.registrationForms);
}
