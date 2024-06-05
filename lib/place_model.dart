import 'dart:ui';

class PlaceModel {
  PlaceModel({
    required this.title,
    required this.imageUri,
    required this.placeType,
    required this.description,
  });

  final String title;
  final Uri imageUri;
  final String placeType;
  final String description;
}
