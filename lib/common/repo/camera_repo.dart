import 'package:camera/camera.dart';

class CameraRepoSingleton {
  static final CameraRepoSingleton _instance = CameraRepoSingleton._internal();

  factory CameraRepoSingleton() => _instance;

  CameraRepoSingleton._internal();

  late final List<CameraDescription> cameras;

  Future<CameraRepoSingleton> init() async {
    final repo = CameraRepoSingleton._instance;
    cameras = await availableCameras();
    return repo;
  }
}
