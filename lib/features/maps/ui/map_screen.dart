import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:green_app/common/data/route_entity.dart';
import 'package:green_app/common/data/territory_entity.dart';
import 'package:green_app/common/repo/territory_repo.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController _mapController;

  final Map<int, Color> territorryColor = {};
  late final List<RouteEntity> routes;
  late final List<TerritoryEntity> territories;

  @override
  void initState() {
    _mapController = MapController();
    routes = RouteTerritoryRepo().routes;
    territories = RouteTerritoryRepo().territories;
    // routeEntity =
    //     RouteEntity.fromBackendJson(jsonDecode(track) as Map<String, dynamic>);
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Типа карта'),
      // ),
      body: FlutterMap(
        mapController: _mapController,
        options: const MapOptions(
          initialCenter: LatLng(53.492965, 158.714545),
          initialZoom: 5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.flutter_map_example',
          ),
          PolylineLayer(
            polylines: List.generate(routes.length, (index) {
              final route = routes[index];
              late final Color trackColor;
              if (!territorryColor.containsKey((route.territoryId))) {
                territorryColor[route.territoryId] = generateBrightColor();
                // Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                //     .withOpacity(1.0);
              }
              trackColor = territorryColor[route.territoryId]!;
              return Polyline(
                points: route.coords,
                color: getOppositeColor(trackColor),
                borderStrokeWidth: 2,
                borderColor: getOppositeColor(trackColor).withOpacity(1),
              );
            }),
          ),
          PolygonLayer(
            // hitNotifier: ,
            polygons: List.generate(territories.length, (index) {
              final territory = territories[index];
              late final Color trackColor;
              if (!territorryColor.containsKey((territory.id))) {
                territorryColor[territory.id] = generateBrightColor();
              }
              trackColor = territorryColor[territory.id]!;
              return Polygon(
                points: territory.coords!,
                color: trackColor.withOpacity(0.5),
                borderColor: Colors.blueAccent,
                borderStrokeWidth: 1,
              );
            }),
          ),
        ],
      ),
    );
  }

  Color generateBrightColor() {
    Random random = Random();
    int r = random.nextInt(256); // Красный (0-255)
    int g = 56 + random.nextInt(200); // Зеленый (0-255)
    int b = 56 + random.nextInt(200); // Синий (0-255)
    return Color.fromARGB(255, r, g, b);
  }

  Color getOppositeColor(Color color) {
    HSLColor hslColor = HSLColor.fromColor(color);
    double newHue = (hslColor.hue + 180.0) % 360.0;
    HSLColor oppositeHslColor = hslColor.withHue(newHue);
    return oppositeHslColor.toColor();
  }
}

// class TerritoryNotifiet extends LayerHitNotifier<int> {
//
// }
