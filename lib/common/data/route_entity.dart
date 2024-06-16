import 'package:latlong2/latlong.dart';

class RouteEntity {
  const RouteEntity({
    // required this.id,
    required this.name,
    required this.trackType,
    required this.territoryId,
    required this.coords,
    required this.recreationCapacity,
    required this.timePassingTrack,
  });

  // final int id;
  final String name;
  final TrackType trackType;
  final int territoryId;
  final List<LatLng> coords;
  final int timePassingTrack;
  final int recreationCapacity;

  factory RouteEntity.fromBackendJson(Map<String, dynamic> json) {
    final geometry =
        (json['data']['features'][0]['geometry'] as Map<String, dynamic>);
    return RouteEntity(
      // id: json['id'] as int,
      name: json['name'],
      trackType: TrackTypeExt.trackType(json['type_track']),
      territoryId: json['territory_id'] as int,
      timePassingTrack: json['time_passing_track'] as int,
      coords: getCoords(
        geometry['coordinates'] as List,
        GeoTypeExt.geoType(
          geometry['type'],
        ),
      ),
      recreationCapacity: json['basic_recreational_capacity'] as int,
    );
  }

  static List<LatLng> getCoords(List coordsList, RouteGeoType geoType) {
    final List<LatLng> lineString = [];
    switch (geoType) {
      case RouteGeoType.lineString:
        for (final coords in coordsList) {
          lineString.add(LatLng(coords[1] as double, coords[0] as double));
        }
        break;
      case RouteGeoType.multiLineString:
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

enum RouteGeoType {
  lineString,
  multiLineString,
}

extension GeoTypeExt on RouteGeoType {
  static RouteGeoType geoType(String geoType) {
    switch (geoType) {
      case 'LineString':
        return RouteGeoType.lineString;
      default:
        return RouteGeoType.multiLineString;
    }
  }
}

enum TrackType {
  easy,
  medium,
  hard,
}

extension TrackTypeExt on TrackType {
  static TrackType trackType(String track) {
    switch (track) {
      case 'easy':
        return TrackType.easy;
      case 'medium':
        return TrackType.medium;
      default:
        return TrackType.hard;
    }
  }
  static String getString(TrackType trackType) {
    switch (trackType) {
      case TrackType.easy:
        return 'easy';
      case TrackType.medium:
        return 'medium';
      default:
        return 'hard';
    }
  }
}
