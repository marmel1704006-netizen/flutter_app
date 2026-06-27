import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Підключаємо провайдер
import '../constants/colors.dart';
import '../providers/product_provider.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'GLOWUP SHOP',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textDark),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.textDark),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=800&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.black.withValues(alpha: 0.4), Colors.transparent],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Б’ЮТІ СЕЗОН\nЗнижки до -30%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Популярні категорії',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
            ),

            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children: [
                  CategoryChip(
                    label: 'Всі товари',
                    isSelected: productProvider.selectedCategoryId == 0,
                    onTap: () => productProvider.selectCategory(0),
                  ),
                  CategoryChip(
                    label: 'Догляд за шкірою',
                    isSelected: productProvider.selectedCategoryId == 1,
                    onTap: () => productProvider.selectCategory(1),
                  ),
                  CategoryChip(
                    label: 'Макіяж',
                    isSelected: productProvider.selectedCategoryId == 2,
                    onTap: () => productProvider.selectCategory(2),
                  ),
                  CategoryChip(
                    label: 'Парфуми',
                    isSelected: productProvider.selectedCategoryId == 3,
                    onTap: () => productProvider.selectCategory(3),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Тренди тижня',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
            ),

            productProvider.filteredProducts.isEmpty
                ? const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('Товарів у цій категорії поки немає'),
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productProvider.filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = productProvider.filteredProducts[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}