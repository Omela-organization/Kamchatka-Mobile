import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_app/common/data/territory_entity.dart';

import '../common/data/app_db.dart';
import '../common/data/route_entity.dart';
import '../common/ui/navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  final routes = <RouteEntity>[];
  final territories = <TerritoryEntity>[];

  final String territoriesString =
      await rootBundle.loadString('assets/territories.json');
  final territoriesJsonList = jsonDecode(territoriesString) as List;
  for (final territory in territoriesJsonList) {
    final territoryEntity =
        TerritoryEntity.fromBackendJson(territory as Map<String, dynamic>);
    territories.add(territoryEntity);
  }

  for (var i = 1; i < 36; i++) {
    final String? jsonString = await myLoadTrack(i);
    if (jsonString != null) {
      var jsonData = jsonDecode(jsonString);
      final routeEntity =
          RouteEntity.fromBackendJson(jsonData as Map<String, dynamic>);
      routes.add(routeEntity);
      // print(jsonDecode(routeEntity.coords.toString()));
      // await database.into(database.routes).insert(RoutesCompanion.insert(
      //       name: routeEntity.name,
      //       trackType: TrackTypeExt.getString(routeEntity.trackType),
      //       territoryId: routeEntity.territoryId,
      //       coords: routeEntity.coords.toString(),
      //       timePassingTrack: routeEntity.timePassingTrack,
      //       recreationCapacity: routeEntity.recreationCapacity,
      //     ));
    }
  }

  // При первом открытии приложения
  // 1. Сделать запрос на получение маршрутов
  // 2. Распарсить все маршруты и сохранить в drift
  // bool firstRun = await IsFirstRun.isFirstRun();
  // if (firstRun) {
  //
  // }

  // await database.loadRoutesFromBackend(exampleData);
  // print(RouteEntity.fromBackendJson(
  //     jsonDecode(track) as Map<String, dynamic>));
  runApp(MainApp(
    routes: routes,
    territories: territories,
  ));
}

Future myLoadTrack(int number) async {
  try {
    return await rootBundle.loadString('assets/tracks/$number.geojson');
  } catch (_) {
    return null;
  }
}

Future<String> loadJson() async {
  return await rootBundle.loadString('assets/data.json');
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.routes,
    required this.territories,
  });

  final List<RouteEntity> routes;
  final List<TerritoryEntity> territories;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationScreen(
        routes: routes,
        territories: territories,
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF018456),
          primary: const Color(0xFF024C30),
          onPrimary: const Color(0xFFEEF2E3),
          secondary: const Color(0xFF018456),
          tertiary: const Color(0xFFBCEB00),
          // surface: const Color(0xFFEEF2E3),
          // onSurface: const Color(0xFFEEF2E3),
          // background: const Color(0xFFEEF2E3),
          // onBackground: const Color(0xFF024C30),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.1,
              fontSizeDelta: 2.0,
            ),
      ),
    );
  }
}
