import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../l10n/app_localizations.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../providers/wishlist_provider.dart';
import '../widgets/product_card.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final favorites = wishlistProvider.getFavorites(productProvider.products);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          l10n.navMore,
          style: const TextStyle(
              color: AppColors.textDark, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: const Text('Марія',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(l10n.myData),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 12),

          _buildMenuSection([
            _buildMenuItem(Icons.card_giftcard, l10n.myBonuses, null),
            _buildMenuItem(Icons.percent, l10n.personalCashback, null),
          ]),
          const SizedBox(height: 12),

          _buildMenuSection([
            _buildMenuItem(Icons.shopping_bag_outlined, l10n.myPurchases, null),
            _buildMenuItem(Icons.location_on_outlined, l10n.myAddresses, null),
            _buildMenuItem(Icons.credit_card_outlined, l10n.myCards, null),
            _buildMenuItem(
              Icons.favorite_border,
              l10n.wishlist,
              favorites.isNotEmpty ? '${favorites.length} тов.' : null,
              onTap: favorites.isNotEmpty
                  ? () => _showWishlist(context, favorites, l10n)
                  : null,
            ),
          ]),
          const SizedBox(height: 12),

          _buildMenuSection([
            _buildMenuItem(Icons.storefront, l10n.stores, null),
            _buildMenuItem(Icons.assignment_outlined, l10n.projects, null),
            _buildMenuItem(Icons.chat_bubble_outline, l10n.support, null),
            _buildMenuItem(Icons.info_outline, l10n.aboutCompany, null),
          ]),
        ],
      ),
    );
  }

  void _showWishlist(
      BuildContext context, List<Product> favorites, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Provider.of<CartProvider>(context, listen: false),
          ),
          ChangeNotifierProvider.value(
            value: Provider.of<WishlistProvider>(context, listen: false),
          ),
        ],
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          maxChildSize: 0.95,
          builder: (_, controller) => Scaffold(
            appBar: AppBar(title: Text(l10n.wishlist)),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                controller: controller,
                itemCount: favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) =>
                    ProductCard(product: favorites[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuSection(List<Widget> items) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(children: items),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String? trailingText,
      {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textDark),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(trailingText,
                style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 20, color: AppColors.grey),
        ],
      ),
      onTap: onTap ?? () {},
    );
  }
}