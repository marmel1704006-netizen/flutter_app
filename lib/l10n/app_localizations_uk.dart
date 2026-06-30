// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'GlowUp Shop';

  @override
  String get navHome => 'Головна';

  @override
  String get navCatalog => 'Каталог';

  @override
  String get navCart => 'Кошик';

  @override
  String get navMore => 'Ще';

  @override
  String get searchHint => 'Пошук товарів...';

  @override
  String get popularCategories => 'Популярні категорії';

  @override
  String get allProducts => 'Всі товари';

  @override
  String get tryAgain => 'Спробувати ще раз';

  @override
  String get errorNetwork => 'Немає підключення до мережі. Спробуй ще раз.';

  @override
  String get errorGeneric => 'Щось пішло не так. Спробуй ще раз.';

  @override
  String get emptyCategory => 'Товарів у цій категорії поки немає';

  @override
  String get emptyCart => 'Кошик порожній';

  @override
  String get clearCart => 'Очистити';

  @override
  String get orderTotal => 'Сума замовлення';

  @override
  String get checkout => 'Оформити замовлення';

  @override
  String get myData => 'Мої дані';

  @override
  String get myBonuses => 'Мої бонуси';

  @override
  String get personalCashback => 'Персональний кешбек';

  @override
  String get myPurchases => 'Мої покупки';

  @override
  String get myAddresses => 'Мої адреси доставки';

  @override
  String get myCards => 'Мої збережені картки';

  @override
  String get wishlist => 'Список бажань';

  @override
  String get stores => 'Магазини та точки видачі';

  @override
  String get projects => 'Проєкти';

  @override
  String get support => 'Сервіси та допомога';

  @override
  String get aboutCompany => 'Про компанію GLOWUP';

  @override
  String get addToCart => 'В кошик';

  @override
  String get inCart => 'В кошику';

  @override
  String get description => 'Опис';

  @override
  String get characteristics => 'Характеристики';

  @override
  String noResults(String query) {
    return 'За запитом \"$query\" нічого не знайдено';
  }

  @override
  String foundProducts(int count) {
    return 'Знайдено: $count товарів';
  }

  @override
  String get popularQueries => 'Популярні запити';
}
