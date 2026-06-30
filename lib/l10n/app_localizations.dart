import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In uk, this message translates to:
  /// **'GlowUp Shop'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In uk, this message translates to:
  /// **'Головна'**
  String get navHome;

  /// No description provided for @navCatalog.
  ///
  /// In uk, this message translates to:
  /// **'Каталог'**
  String get navCatalog;

  /// No description provided for @navCart.
  ///
  /// In uk, this message translates to:
  /// **'Кошик'**
  String get navCart;

  /// No description provided for @navMore.
  ///
  /// In uk, this message translates to:
  /// **'Ще'**
  String get navMore;

  /// No description provided for @searchHint.
  ///
  /// In uk, this message translates to:
  /// **'Пошук товарів...'**
  String get searchHint;

  /// No description provided for @popularCategories.
  ///
  /// In uk, this message translates to:
  /// **'Популярні категорії'**
  String get popularCategories;

  /// No description provided for @allProducts.
  ///
  /// In uk, this message translates to:
  /// **'Всі товари'**
  String get allProducts;

  /// No description provided for @tryAgain.
  ///
  /// In uk, this message translates to:
  /// **'Спробувати ще раз'**
  String get tryAgain;

  /// No description provided for @errorNetwork.
  ///
  /// In uk, this message translates to:
  /// **'Немає підключення до мережі. Спробуй ще раз.'**
  String get errorNetwork;

  /// No description provided for @errorGeneric.
  ///
  /// In uk, this message translates to:
  /// **'Щось пішло не так. Спробуй ще раз.'**
  String get errorGeneric;

  /// No description provided for @emptyCategory.
  ///
  /// In uk, this message translates to:
  /// **'Товарів у цій категорії поки немає'**
  String get emptyCategory;

  /// No description provided for @emptyCart.
  ///
  /// In uk, this message translates to:
  /// **'Кошик порожній'**
  String get emptyCart;

  /// No description provided for @clearCart.
  ///
  /// In uk, this message translates to:
  /// **'Очистити'**
  String get clearCart;

  /// No description provided for @orderTotal.
  ///
  /// In uk, this message translates to:
  /// **'Сума замовлення'**
  String get orderTotal;

  /// No description provided for @checkout.
  ///
  /// In uk, this message translates to:
  /// **'Оформити замовлення'**
  String get checkout;

  /// No description provided for @myData.
  ///
  /// In uk, this message translates to:
  /// **'Мої дані'**
  String get myData;

  /// No description provided for @myBonuses.
  ///
  /// In uk, this message translates to:
  /// **'Мої бонуси'**
  String get myBonuses;

  /// No description provided for @personalCashback.
  ///
  /// In uk, this message translates to:
  /// **'Персональний кешбек'**
  String get personalCashback;

  /// No description provided for @myPurchases.
  ///
  /// In uk, this message translates to:
  /// **'Мої покупки'**
  String get myPurchases;

  /// No description provided for @myAddresses.
  ///
  /// In uk, this message translates to:
  /// **'Мої адреси доставки'**
  String get myAddresses;

  /// No description provided for @myCards.
  ///
  /// In uk, this message translates to:
  /// **'Мої збережені картки'**
  String get myCards;

  /// No description provided for @wishlist.
  ///
  /// In uk, this message translates to:
  /// **'Список бажань'**
  String get wishlist;

  /// No description provided for @stores.
  ///
  /// In uk, this message translates to:
  /// **'Магазини та точки видачі'**
  String get stores;

  /// No description provided for @projects.
  ///
  /// In uk, this message translates to:
  /// **'Проєкти'**
  String get projects;

  /// No description provided for @support.
  ///
  /// In uk, this message translates to:
  /// **'Сервіси та допомога'**
  String get support;

  /// No description provided for @aboutCompany.
  ///
  /// In uk, this message translates to:
  /// **'Про компанію GLOWUP'**
  String get aboutCompany;

  /// No description provided for @addToCart.
  ///
  /// In uk, this message translates to:
  /// **'В кошик'**
  String get addToCart;

  /// No description provided for @inCart.
  ///
  /// In uk, this message translates to:
  /// **'В кошику'**
  String get inCart;

  /// No description provided for @description.
  ///
  /// In uk, this message translates to:
  /// **'Опис'**
  String get description;

  /// No description provided for @characteristics.
  ///
  /// In uk, this message translates to:
  /// **'Характеристики'**
  String get characteristics;

  /// No description provided for @noResults.
  ///
  /// In uk, this message translates to:
  /// **'За запитом \"{query}\" нічого не знайдено'**
  String noResults(String query);

  /// No description provided for @foundProducts.
  ///
  /// In uk, this message translates to:
  /// **'Знайдено: {count} товарів'**
  String foundProducts(int count);

  /// No description provided for @popularQueries.
  ///
  /// In uk, this message translates to:
  /// **'Популярні запити'**
  String get popularQueries;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
