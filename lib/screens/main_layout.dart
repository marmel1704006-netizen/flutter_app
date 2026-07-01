import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';
import 'home_screen.dart';
import 'catalog_screen.dart';
import 'cart_screen.dart';
import 'more_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const CatalogScreen(),
      const CartScreen(),
      const MoreScreen(),
    ];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider()..loadProducts(),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: Builder(
        builder: (context) {
          // провайдери всередині
          final cartCount = context.watch<CartProvider>().totalCount;

          return Scaffold(
            body: screens[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.grey,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Головна',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Каталог',
                ),
                BottomNavigationBarItem(
                  icon: _buildCartIcon(cartCount, isActive: false),
                  activeIcon: _buildCartIcon(cartCount, isActive: true),
                  label: 'Кошик',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: 'Ще',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCartIcon(int count, {required bool isActive}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          isActive ? Icons.shopping_bag : Icons.shopping_bag_outlined,
        ),
        if (count > 0)
          Positioned(
            top: -6,
            right: -8,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                count > 99 ? '99+' : '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}