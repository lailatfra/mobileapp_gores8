import 'package:flutter/material.dart';
import 'splash_screen.dart'; // pastikan path-nya benar
import 'main_screen.dart';   // pastikan file ini ada, dan MainScreen tidak error

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(), // SplashScreen akan navigasi ke MainScreen
    );
  }
}
