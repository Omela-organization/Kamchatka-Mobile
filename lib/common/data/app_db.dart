import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:green_app/common/data/route_db_model.dart';
import 'package:green_app/common/data/route_entity.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:path/path.dart' as p;

import '../../features/route_entry/data/route_registration_entity.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [Routes, RegistrationForms])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<RegistrationFormEntry>> watchRegistrationForms() {
    return (select(registrationForms)).watch();
  }

  Future<void> insertRegistrationForm(
      RegistrationFormEntry registrationFormEntry) async {
    into(registrationForms).insert(
      RegistrationFormsCompanion.insert(
        arrivalDate: registrationFormEntry.arrivalDate,
        lastName: registrationFormEntry.lastName,
        firstName: registrationFormEntry.firstName,
        middleName: registrationFormEntry.middleName,
        birthDate: registrationFormEntry.birthDate,
        nationality: registrationFormEntry.nationality,
        gender: registrationFormEntry.gender,
        passportNumber: registrationFormEntry.passportNumber,
        email: registrationFormEntry.email,
        phone: registrationFormEntry.phone,
        visitPurpose: registrationFormEntry.visitPurpose,
        visitFormat: registrationFormEntry.visitFormat,
      ),
    );
  }

  Future<void> insertRoute(RouteEntity route) async {
    final coordsJson = jsonEncode(route.coords
        .map((coord) => [coord.longitude, coord.latitude])
        .toList());
    into(routes).insert(
      RoutesCompanion(
        name: Value(route.name),
        trackType: Value(route.trackType.name),
        territoryId: Value(route.territoryId),
        coords: Value(coordsJson),
        timePassingTrack: Value(route.timePassingTrack),
        recreationCapacity: Value(route.recreationCapacity),
      ),
    );
  }

  Future<void> loadRoutesFromBackend(
      List<Map<String, dynamic>> jsonData) async {
    for (var json in jsonData) {
      final route = RouteEntity.fromBackendJson(json);
      await insertRoute(route);
    }
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

// AppDatabase constructDb({bool logStatements = false}) {
//   return AppDatabase(_openConnection());
// }
