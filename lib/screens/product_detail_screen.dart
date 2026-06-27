import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final isFavorite = productProvider.isFavorite(product.id);
    final isInCart = productProvider.isInCart(product.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : AppColors.textDark,
            ),
            onPressed: () => productProvider.toggleFavorite(product.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.categoryName.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    product.name,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price.toStringAsFixed(0)} ₴',
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isInCart ? Colors.green : AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),

                        onPressed: () => productProvider.toggleCart(product.id),
                        icon: Icon(
                          isInCart ? Icons.check : Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          isInCart ? 'В кошику' : 'В кошик',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),

                  const Text(
                    'Опис',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Професійний засіб преміум-сегменту для щоденного використання. Забезпечує стійкий ефект, глибоке живлення та бездоганний вигляд протягом усього дня. Підходить для всіх типів шкіри.',
                    style: TextStyle(color: AppColors.grey, fontSize: 14, height: 1.4),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Характеристики',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
                  ),
                  const SizedBox(height: 8),
                  _buildCharacteristicRow('Об\'єм', '50 мл'),
                  _buildCharacteristicRow('Країна виробник', 'Франція'),
                  _buildCharacteristicRow('Клас косметики', 'Елітнa'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacteristicRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: AppColors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark)),
        ],
      ),
    );
  }
}