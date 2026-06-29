import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../providers/wishlist_provider.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';
import 'search_screen.dart';

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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider.value(
                      value: Provider.of<ProductProvider>(context, listen: false),
                    ),
                    ChangeNotifierProvider.value(
                      value: Provider.of<CartProvider>(context, listen: false),
                    ),
                    ChangeNotifierProvider.value(
                      value: Provider.of<WishlistProvider>(context, listen: false),
                    ),
                  ],
                  child: const SearchScreen(),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.textDark),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(context, productProvider),
    );
  }

  Widget _buildBody(BuildContext context, ProductProvider productProvider) {
    switch (productProvider.status) {
      case LoadingStatus.loading:
      case LoadingStatus.initial:
        return const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        );

      case LoadingStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off_outlined, size: 56, color: AppColors.grey),
              const SizedBox(height: 16),
              Text(
                productProvider.errorMessage ?? 'Щось пішло не так',
                style: const TextStyle(color: AppColors.grey, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => productProvider.loadProducts(),
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text(
                  'Спробувати ще раз',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );

      case LoadingStatus.loaded:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Популярні категорії',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              _buildCategories(productProvider),
              const SizedBox(height: 12),
              ...productProvider.sections.map(
                    (section) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        section.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                    _buildSectionGrid(section.products),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=800&q=80',
          ),
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
            'Б\'ЮТІ СЕЗОН\nЗнижки до -30%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories(ProductProvider productProvider) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: productProvider.categories.length,
        itemBuilder: (context, index) {
          final category = productProvider.categories[index];
          return CategoryChip(
            label: category.name,
            isSelected: productProvider.selectedCategoryId == category.id,
            onTap: () => productProvider.selectCategory(category.id),
          );
        },
      ),
    );
  }

  Widget _buildSectionGrid(List<Product> products) {
    if (products.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text('Товарів поки немає'),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) => ProductCard(product: products[index]),
      ),
    );
  }
}