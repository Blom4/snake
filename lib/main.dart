import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/snake_screen.dart';

void main() {
  runApp(const ProviderScope(child: SnakeApp()));
}

class SnakeApp extends StatelessWidget {
  const SnakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snake',
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: const SnakeScreen(),
    );
  }
}
