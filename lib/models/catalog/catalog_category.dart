class SubCategory {
  final String name;

  const SubCategory({required this.name});
}

class CatalogCategory {
  final String name;
  final List<SubCategory> subCategories;

  const CatalogCategory({
    required this.name,
    required this.subCategories,
  });
}