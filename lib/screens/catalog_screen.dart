import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/catalog/catalog_data.dart';
import 'subcategory_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Каталог',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textDark),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: CatalogData.categories.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final category = CatalogData.categories[index];
          return ListTile(
            tileColor: Colors.white,
            title: Text(
              category.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: AppColors.grey,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SubCategoryScreen(category: category),
              ),
            ),
          );
        },
      ),
    );
  }
}