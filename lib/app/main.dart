import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:green_app/common/repo/camera_repo.dart';
import 'package:green_app/common/repo/route_form_notifier.dart';
import 'package:green_app/features/onboarding/ui/onboarding_page.dart';
import 'package:provider/provider.dart';

import '../common/repo/registration_form_repo.dart';
import '../common/repo/territory_repo.dart';
import '../common/ui/navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await RouteTerritoryRepo.init();

  await CameraRepoSingleton().init();

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
  runApp(const MainApp());
}

Future<String> loadJson() async {
  return await rootBundle.loadString('assets/data.json');
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<RouteRegistrationFormNotifier>(
      create: (context) => RouteRegistrationFormNotifier(
        RegistrationFormRepo(),
      ),
      child: MaterialApp(
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [Locale('ru')],
        debugShowCheckedModeBanner: false,
        home: const MyPageView(),
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
      ),
    );
  }
}
