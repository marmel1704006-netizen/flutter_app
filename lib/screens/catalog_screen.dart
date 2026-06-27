import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Екран Каталогу (В розробці)'),
      ),
    );
  }
}