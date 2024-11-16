import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/product_model.dart';

// Supabase client instance
final supabase = Supabase.instance.client;

class ProductService {
  static const String tableName = 'products';

  // Create

  Future<void> createProduct() async {
    final response = await supabase
        .from('products')
        .insert([
          {
            'name': 'name',
            'description': 'description',
            'price': 0.0,
            'image': 'image',
            'brand': 'brand',
            'category': 'category',
            'created_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
            'is_favorite': false
          },
        ])
        .select()
        .single();
    if (response.error != null) {
      throw 'Error creating product: ${response.error!.message}';
    }
  }

  // Read all
  Future<List<Product>> getProducts() async {
    try {
      final response = await supabase.from(tableName).select();
      return response.data as List<Product>;
    } catch (e) {
      throw 'Error fetching products: $e';
    }
  }

  // Read single
  Future<Product> getProduct(int id) async {
    try {
      final response =
          await supabase.from(tableName).select().eq('id', id).single();
      return Product.fromJson(response);
    } catch (e) {
      throw 'Error fetching product: $e';
    }
  }

  // Update
  Future<Product> updateProduct(Product product) async {
    try {
      final response = await supabase
          .from(tableName)
          .update(product.toJson())
          .eq('id', product.id as Object)
          .select()
          .single();
      return Product.fromJson(response);
    } catch (e) {
      throw 'Error updating product: $e';
    }
  }

  // Delete
  Future<void> deleteProduct(int id) async {
    try {
      await supabase.from(tableName).delete().eq('id', id);
    } catch (e) {
      throw 'Error deleting product: $e';
    }
  }

  // Toggle favorite
  Future<Product> toggleFavorite(int id, bool isFavorite) async {
    try {
      final response = await supabase
          .from(tableName)
          .update({'is_favorite': isFavorite})
          .eq('id', id)
          .select()
          .single();
      return Product.fromJson(response);
    } catch (e) {
      throw 'Error updating favorite status: $e';
    }
  }
}

extension on PostgrestList {
  get data => null;
}

extension on PostgrestMap {
  get error => null;
}
// Compare this snippet from lib/models/product_model.dart: