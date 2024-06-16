import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:green_app/common/data/route_entity.dart';
import 'package:green_app/common/data/territory_entity.dart';
import 'package:green_app/common/repo/territory_repo.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/ui/modal_body.dart';

typedef HitValue = ({
  String title,
  String subtitle,
  TerritoryEntity territoryEntity,
});

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LayerHitNotifier<HitValue> _hitNotifier = ValueNotifier(null);

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
          GestureDetector(
            onTap: () => _openTouchedGonsModal(
              'Tapped',
              _hitNotifier.value!.hitValues,
              _hitNotifier.value!.coordinate,
              _hitNotifier.value!.hitValues.first.territoryEntity,
            ),
            // onLongPress: () => _openTouchedGonsModal(
            //   'Long pressed',
            //   _hitNotifier.value!.hitValues,
            //   _hitNotifier.value!.coordinate,
            // ),
            // onSecondaryTap: () => _openTouchedGonsModal(
            //   'Secondary tapped',
            //   _hitNotifier.value!.hitValues,
            //   _hitNotifier.value!.coordinate,
            // ),
            child: PolygonLayer(
              hitNotifier: _hitNotifier,
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
                  hitValue: (
                    title: 'Basic Filled Polygon',
                    subtitle: 'Nothing really special here...',
                    territoryEntity: territory,
                  ),
                );
              }),
            ),
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

  void _openTouchedGonsModal(
    String eventType,
    List<HitValue> tappedLines,
    LatLng coords,
    TerritoryEntity territory,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  territory.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.maybePop(context),
                ),
              ],
            ),
            if (territory.description != null) Text(territory.description!),
            const SizedBox(height: 8),
            const Divider(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  final route = territory.routes?[index];
                  if (route != null) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        route.name,
                        style: const TextStyle(
                          fontSize: 18,
                          // color: Theme.of(context).primaryColor,
                        ),
                      ),
                      // subtitle: Text(TrackTypeExt.getString(route.trackType)),
                      // dense: true,
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        // color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                itemCount: territory.routes!.length,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Закрыть'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
