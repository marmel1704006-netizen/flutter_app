import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Додав імпорт пакета провайдера
import 'providers/product_provider.dart'; // Додав імпорт нашого провайдера товарів
import 'screens/main_layout.dart';
import 'constants/colors.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider()..loadProducts(),
      child: const GlowUpApp(),
    ),
  );
}

class GlowUpApp extends StatelessWidget {
  const GlowUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlowUp Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
      ),
      home: const MainLayout(),
    );
  }
}