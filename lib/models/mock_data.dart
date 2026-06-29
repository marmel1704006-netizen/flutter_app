import 'category.dart';
import 'product.dart';
import 'section.dart';

class MockData {
  static const List<ProductCategory> categories = [
    ProductCategory(id: 0, name: 'Всі товари'),
    ProductCategory(id: 1, name: 'Догляд за шкірою'),
    ProductCategory(id: 2, name: 'Макіяж'),
    ProductCategory(id: 3, name: 'Парфуми'),
  ];

  static const List<Product> products = [
    Product(
      id: '1',
      name: 'Зволожуючий крем для обличчя',
      categoryId: 1,
      categoryName: 'Догляд за шкірою',
      imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500&q=80',
      price: 450,
    ),
    Product(
      id: '2',
      name: 'Матова губна помада (Velvet)',
      categoryId: 2,
      categoryName: 'Макіяж',
      imageUrl: 'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=500&q=80',
      price: 320,
    ),
    Product(
      id: '3',
      name: 'Парфумована вода Rose',
      categoryId: 3,
      categoryName: 'Парфуми',
      imageUrl: 'https://images.unsplash.com/photo-1541643600914-78b084683601?w=500&q=80',
      price: 950,
    ),
    Product(
      id: '4',
      name: 'Сонцезахисний крем SPF 50',
      categoryId: 1,
      categoryName: 'Догляд за шкірою',
      imageUrl: 'https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=500&q=80',
      price: 380,
    ),
    Product(
      id: '5',
      name: 'Палетка тіней Nude',
      categoryId: 2,
      categoryName: 'Макіяж',
      imageUrl: 'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=500&q=80',
      price: 680,
    ),
  ];

  // секції формуються з даних
  static List<ProductSection> get sections => [
    ProductSection(
      title: 'Тренди тижня',
      products: products.where((p) => ['1', '2', '3'].contains(p.id)).toList(),
    ),
    ProductSection(
      title: 'Найкраща пропозиція',
      products: products.where((p) => ['4', '5'].contains(p.id)).toList(),
    ),
  ];
}