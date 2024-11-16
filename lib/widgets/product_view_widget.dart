import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product_model.dart';
import 'single_item.dart';

class ProductDisplaysViewWidget extends StatefulWidget {
  const ProductDisplaysViewWidget({super.key});

  @override
  State<ProductDisplaysViewWidget> createState() =>
      _ProductDisplaysViewWidgetState();
}

class _ProductDisplaysViewWidgetState extends State<ProductDisplaysViewWidget> {
  final supabase = Supabase.instance.client;
  List<Product> products = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final response = await supabase
          .from('products')
          .select('*')
          .order('created_at', ascending: false);

      if (mounted) {
        setState(() {
          products = (response as List)
              .map((product) => Product(
                    id: product['id'],
                    name: product['name'],
                    description: product['description'],
                    price: product['price'].toDouble(),
                    brand: product['brand'],
                    imageUrl: product['image_url'],
                    category: product['category'],
                  ))
              .toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Error loading products: $e';
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    await _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!),
            ElevatedButton(
              onPressed: _refreshProducts,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (products.isEmpty) {
      return const Center(child: Text('No products found'));
    }

    return RefreshIndicator(
      onRefresh: _refreshProducts,
      child: MasonryGridView.count(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        itemCount: products.length,
        mainAxisSpacing: 10,
        itemBuilder: (context, index) => SingleItemWidget(
          index: index == products.length - 1,
          product: products[index],
        ),
      ),
    );
  }
}
