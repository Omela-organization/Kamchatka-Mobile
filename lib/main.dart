import 'package:flutter/material.dart';

import 'navigation_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavigationScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF018456),
          primary: const Color(0xFF024C30),
          onPrimary: const Color(0xFFEEF2E3),
          secondary: const Color(0xFF018456),
          tertiary: const Color(0xFFBCEB00),

        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.1,
              fontSizeDelta: 2.0,
            ),
      ),
    );
  }
}
