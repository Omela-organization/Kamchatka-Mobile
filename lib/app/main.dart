import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';

import '../common/ui/navigation_screen.dart';

void main() async {
  // При первом открытии приложения
  // 1. Сделать запрос на получение маршрутов
  // 2. Распарсить все маршруты и сохранить в drift
  bool firstRun = await IsFirstRun.isFirstRun();
  if (firstRun) {

  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavigationScreen(),
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
