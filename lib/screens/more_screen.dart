import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Ще',
          style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: const Text('Марія', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Мої дані'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 12),

          _buildMenuSection([
            _buildMenuItem(Icons.card_giftcard, 'Мої бонуси', null),
            _buildMenuItem(Icons.percent, 'Персональний кешбек', null),
          ]),
          const SizedBox(height: 12),

          _buildMenuSection([
            _buildMenuItem(Icons.shopping_bag_outlined, 'Мої покупки', null),
            _buildMenuItem(Icons.location_on_outlined, 'Мої адреси доставки', null),
            _buildMenuItem(Icons.credit_card_outlined, 'Мої збережені картки', null),

            // список бажань
            _buildMenuItem(
                Icons.favorite_border,
                'Список бажань',
                productProvider.favoriteProductIds.isNotEmpty
                    ? '${productProvider.favoriteProductIds.length} тов.'
                    : null,
                onTap: () {
                  if (productProvider.favoriteProducts.isNotEmpty) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Scaffold(
                        appBar: AppBar(title: const Text('Список бажань')),
                        body: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.builder(
                            itemCount: productProvider.favoriteProducts.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) => ProductCard(product: productProvider.favoriteProducts[index]),
                          ),
                        ),
                      ),
                    );
                  }
                }
            ),
          ]),
          const SizedBox(height: 12),

          _buildMenuSection([
            _buildMenuItem(Icons.storefront, 'Магазини та точки видачі', null),
            _buildMenuItem(Icons.assignment_outlined, 'Проєкти', null),
            _buildMenuItem(Icons.chat_bubble_outline, 'Сервіси та допомога', null),
            _buildMenuItem(Icons.info_outline, 'Про компанію GLOWUP', null),
          ]),
        ],
      ),
    );
  }

  Widget _buildMenuSection(List<Widget> items) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(children: items),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String? trailingText, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textDark),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(trailingText, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 20, color: AppColors.grey),
        ],
      ),
      onTap: onTap ?? () {},
    );
  }
}