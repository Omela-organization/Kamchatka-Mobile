import 'package:latlong2/latlong.dart';

class TerritoryEntity {
  const TerritoryEntity({
    required this.id,
    required this.name,
    required this.description,
    // required this.territoryGeoType,
     this.coords,
  });

  final int id;
  final String name;

  // final TerritoryGeoType territoryGeoType;
  final List<LatLng>? coords;
  final String? description;

  factory TerritoryEntity.fromBackendJson(Map<String, dynamic> json) {

    return TerritoryEntity(
      id: json['id'] as int,
      name: json['name'],
      description: json['description'],
      // territoryGeoType: TerritoryGeoTypeExt.geoType(json['data']['type']),
      coords: getCoords(
        json['data']['coordinates'][0] as List,
        TerritoryGeoTypeExt.geoType(
          json['data']['type'],
        ),
      ),
    );
  }

  static List<LatLng> getCoords(List coordsList, TerritoryGeoType geoType) {
    final List<LatLng> lineString = [];
    switch (geoType) {
      case TerritoryGeoType.polygon:
        for (final coords in coordsList) {
          lineString.add(LatLng(coords[1] as double, coords[0] as double));
        }
        break;
      case TerritoryGeoType.multiPolygon:
        for (final line in coordsList) {
          for (final coords in line) {
            lineString.add(LatLng(coords[1] as double, coords[0] as double));
          }
        }

        break;
    }

    return lineString;
  }
}

enum TerritoryGeoType {
  polygon,
  multiPolygon,
}

extension TerritoryGeoTypeExt on TerritoryGeoType {
  static TerritoryGeoType geoType(String geoType) {
    switch (geoType) {
      case 'MultiPolygon':
        return TerritoryGeoType.multiPolygon;
      default:
        return TerritoryGeoType.polygon;
    }
  }
}
