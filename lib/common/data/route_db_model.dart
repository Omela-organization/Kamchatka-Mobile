import 'package:drift/drift.dart';

class Routes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get trackType => text()();

  IntColumn get territoryId => integer()();

  TextColumn get coords =>
      text()(); // JSON serialized coordinates
  IntColumn get timePassingTrack => integer()();

  IntColumn get recreationCapacity => integer()();
}
