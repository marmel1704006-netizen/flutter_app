import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Product> _results = [];
  bool _hasSearched = false;

  final List<String> _popularQueries = [
    'Крем для обличчя',
    'Помада',
    'Парфуми',
    'Шампунь',
    'Маска для волосся',
    'Сироватка',
  ];

  void _search(String query, List<Product> allProducts) {
    setState(() {
      _hasSearched = query.isNotEmpty;
      if (query.isEmpty) {
        _results = [];
      } else {
        _results = allProducts
            .where((p) =>
        p.name.toLowerCase().contains(query.toLowerCase()) ||
            p.categoryName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Пошук товарів...',
            hintStyle: const TextStyle(color: AppColors.grey),
            border: InputBorder.none,
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
              icon: const Icon(Icons.clear, color: AppColors.grey),
              onPressed: () {
                _controller.clear();
                _search('', productProvider.products);
              },
            )
                : null,
          ),
          style: const TextStyle(color: AppColors.textDark, fontSize: 16),
          onChanged: (query) => _search(query, productProvider.products),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (!_hasSearched) {
      return _buildPopularQueries();
    }

    if (_results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 56, color: AppColors.grey),
            const SizedBox(height: 16),
            Text(
              'За запитом "${_controller.text}" нічого не знайдено',
              style: const TextStyle(color: AppColors.grey, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Знайдено: ${_results.length} товарів',
            style: const TextStyle(color: AppColors.grey, fontSize: 13),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              itemCount: _results.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) =>
                  ProductCard(product: _results[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularQueries() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Популярні запити',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _popularQueries.map((query) {
              return GestureDetector(
                onTap: () {
                  _controller.text = query;
                  _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: query.length),
                  );
                  final productProvider = Provider.of<ProductProvider>(
                    context,
                    listen: false,
                  );
                  _search(query, productProvider.products);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.trending_up,
                          size: 14, color: AppColors.primary),
                      const SizedBox(width: 6),
                      Text(
                        query,
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}