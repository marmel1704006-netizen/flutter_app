import 'catalog_category.dart';

class CatalogData {
  static const List<CatalogCategory> categories = [
    CatalogCategory(
      name: 'Парфумерія',
      subCategories: [
        SubCategory(name: 'Жіноча парфумерія'),
        SubCategory(name: 'Чоловіча парфумерія'),
        SubCategory(name: 'Парфумерія унісекс'),
        SubCategory(name: 'Елітна парфумерія'),
        SubCategory(name: 'Нішева парфумерія'),
        SubCategory(name: 'Міні парфуми'),
        SubCategory(name: 'Тверді парфуми'),
        SubCategory(name: 'Парфумований догляд'),
        SubCategory(name: 'Парфумовані набори'),
        SubCategory(name: 'Дитяча парфумерія'),
        SubCategory(name: 'Аромати для дому'),
        SubCategory(name: 'Арабська парфумерія'),
      ],
    ),
    CatalogCategory(
      name: 'Макіяж',
      subCategories: [
        SubCategory(name: 'Обличчя'),
        SubCategory(name: 'Очі'),
        SubCategory(name: 'Брови'),
        SubCategory(name: 'Губи'),
        SubCategory(name: 'Набори'),
        SubCategory(name: 'Аксесуари для макіяжу'),
        SubCategory(name: 'Нігті'),
        SubCategory(name: 'Інструменти для манікюру та педикюру'),
        SubCategory(name: 'Декор для нігтів'),
        SubCategory(name: 'Техніка для б\'юті майстрів'),
      ],
    ),
    CatalogCategory(
      name: 'Обличчя',
      subCategories: [
        SubCategory(name: 'Креми для обличчя'),
        SubCategory(name: 'Маски для обличчя'),
        SubCategory(name: 'Догляд за шкірою навколо очей'),
        SubCategory(name: 'Зняття макіяжу'),
        SubCategory(name: 'Очищення обличчя'),
        SubCategory(name: 'Тонізуючі засоби для обличчя'),
        SubCategory(name: 'Засоби для проблемної шкіри'),
        SubCategory(name: 'Техніка для обличчя'),
        SubCategory(name: 'Натуральний догляд'),
        SubCategory(name: 'Дерматокосметика'),
      ],
    ),
    CatalogCategory(
      name: 'Волосся',
      subCategories: [
        SubCategory(name: 'Шампуні'),
        SubCategory(name: 'Догляд за волоссям'),
        SubCategory(name: 'Засоби для укладання'),
        SubCategory(name: 'Фарби для волосся'),
        SubCategory(name: 'Професійний догляд за волоссям'),
        SubCategory(name: 'Засоби проти випадіння волосся'),
        SubCategory(name: 'Техніка для догляду за волоссям'),
        SubCategory(name: 'Натуральний догляд за волоссям'),
        SubCategory(name: 'Аксесуари для волосся'),
      ],
    ),
    CatalogCategory(
      name: 'Догляд за тілом та гігієна',
      subCategories: [
        SubCategory(name: 'Сонячна серія'),
        SubCategory(name: 'Догляд за тілом'),
        SubCategory(name: 'Для ванни і душу'),
        SubCategory(name: 'Засоби для гоління'),
        SubCategory(name: 'Дезодоранти, антиперспіранти'),
        SubCategory(name: 'Антисептики для рук'),
        SubCategory(name: 'Засоби гігієни порожнини рота'),
        SubCategory(name: 'Жіноча гігієна'),
        SubCategory(name: 'Техніка для догляду за тілом'),
      ],
    ),
    CatalogCategory(
      name: 'Чоловікам',
      subCategories: [
        SubCategory(name: 'Чоловіча парфумерія'),
        SubCategory(name: 'Засоби для гоління'),
        SubCategory(name: 'Догляд за бородою та вусами'),
        SubCategory(name: 'Обличчя'),
        SubCategory(name: 'Волосся'),
        SubCategory(name: 'Тіло'),
        SubCategory(name: 'Техніка для догляду'),
        SubCategory(name: 'Професійний догляд'),
      ],
    ),
    CatalogCategory(
      name: 'Дітям',
      subCategories: [
        SubCategory(name: 'Гігієна та догляд'),
        SubCategory(name: 'Декоративна косметика для дітей'),
      ],
    ),
  ];
}