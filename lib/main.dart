import 'package:flutter/material.dart';
import 'screens/main_layout.dart';
import 'constants/colors.dart';

void main() {
  runApp(const GlowUpApp());
}

class GlowUpApp extends StatelessWidget {
  const GlowUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlowUp Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const MainLayout(),
    );
  }
}