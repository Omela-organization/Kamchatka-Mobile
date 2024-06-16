import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:green_app/common/data/app_db.dart';
import 'package:green_app/common/data/route_entity.dart';
import 'package:green_app/common/data/territory_entity.dart';
import 'package:is_first_run/is_first_run.dart';

class DatabaseSingleton extends AppDatabase {
  static final DatabaseSingleton _instance = DatabaseSingleton._internal();

  factory DatabaseSingleton() {
    return _instance;
  }

  DatabaseSingleton._internal();
}


class RouteTerritoryRepo {
  static final RouteTerritoryRepo _instance = RouteTerritoryRepo._internal();

  factory RouteTerritoryRepo() => _instance;

  RouteTerritoryRepo._internal();

  final AppDatabase _database = DatabaseSingleton();
  final List<RouteEntity> _routes = [];
  final List<TerritoryEntity> _territories = [];

  List<RouteEntity> get routes => _routes;

  List<TerritoryEntity> get territories => _territories;

  static Future<RouteTerritoryRepo> init() async {
    final repo = RouteTerritoryRepo._instance;
    await repo.loadData();
    return repo;
  }

  Future<void> loadData() async {
    bool firstRun = await IsFirstRun.isFirstRun();

    await loadRoutes(firstRun);

    await loadTerritories();
  }

  Future<void> loadTerritories() async {
    final String territoriesString =
        await rootBundle.loadString('assets/territories.json');
    final territoriesJsonList = jsonDecode(territoriesString) as List;
    for (final territory in territoriesJsonList) {
      final territoryEntity = TerritoryEntity.fromBackendJson(
          territory as Map<String, dynamic>, routes);
      _territories.add(territoryEntity);
    }
  }

  Future<void> loadRoutes(bool firstRun) async {
    for (var i = 1; i < 36; i++) {
      final String? jsonString = await myLoadTrack(i);
      if (jsonString != null) {
        var jsonData = jsonDecode(jsonString);
        final routeEntity =
            RouteEntity.fromBackendJson(jsonData as Map<String, dynamic>);
        _routes.add(routeEntity);
        if (firstRun) {
          await _database.into(_database.routes).insert(
                RoutesCompanion.insert(
                  name: routeEntity.name,
                  trackType: TrackTypeExt.getString(routeEntity.trackType),
                  territoryId: routeEntity.territoryId,
                  coords: routeEntity.coords.toString(),
                  timePassingTrack: routeEntity.timePassingTrack,
                  recreationCapacity: routeEntity.recreationCapacity,
                ),
              );
        }
      }
    }
  }

  Future myLoadTrack(int number) async {
    try {
      return await rootBundle.loadString('assets/tracks/$number.geojson');
    } catch (_) {
      return null;
    }
  }
}
