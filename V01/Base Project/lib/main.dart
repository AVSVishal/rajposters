import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(BaseApp());
}

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Color(0xFF2196F3),           // Blue primary
          onPrimary: Color(0xFFFFFFFF),         // White on primary
          secondary: Color(0xFF03DAC6),         // Teal secondary
          onSecondary: Color(0xFF000000),       // Black on secondary
          surface: Color(0xFFFFFFFF),           // White surface
          onSurface: Color(0xFF000000),         // Black on surface
          background: Color(0xFFFFFFFF),        // White background
          onBackground: Color(0xFF000000),      // Black on background
          error: Color(0xFFFF5722),             // Orange error
          onError: Color(0xFFFFFFFF),           // White on error
        ),
        cardTheme: CardThemeData(
          color: Color(0xFFFFFFFF),             // White cards
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          foregroundColor: Color(0xFF000000),
          elevation: 1,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Color(0xFFFFFFFF), // White background
      ),
      home: SplashScreen(),
    );
  }
}