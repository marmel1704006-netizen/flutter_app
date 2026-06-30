// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'GlowUp Shop';

  @override
  String get navHome => 'Home';

  @override
  String get navCatalog => 'Catalog';

  @override
  String get navCart => 'Cart';

  @override
  String get navMore => 'More';

  @override
  String get searchHint => 'Search products...';

  @override
  String get popularCategories => 'Popular Categories';

  @override
  String get allProducts => 'All Products';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get errorNetwork => 'No network connection. Please try again.';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get emptyCategory => 'No products in this category yet';

  @override
  String get emptyCart => 'Cart is empty';

  @override
  String get clearCart => 'Clear';

  @override
  String get orderTotal => 'Order Total';

  @override
  String get checkout => 'Checkout';

  @override
  String get myData => 'My Data';

  @override
  String get myBonuses => 'My Bonuses';

  @override
  String get personalCashback => 'Personal Cashback';

  @override
  String get myPurchases => 'My Purchases';

  @override
  String get myAddresses => 'My Delivery Addresses';

  @override
  String get myCards => 'My Saved Cards';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get stores => 'Stores and Pickup Points';

  @override
  String get projects => 'Projects';

  @override
  String get support => 'Services and Support';

  @override
  String get aboutCompany => 'About GLOWUP';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get inCart => 'In Cart';

  @override
  String get description => 'Description';

  @override
  String get characteristics => 'Characteristics';

  @override
  String noResults(String query) {
    return 'No results found for \"$query\"';
  }

  @override
  String foundProducts(int count) {
    return 'Found: $count products';
  }

  @override
  String get popularQueries => 'Popular Queries';
}
