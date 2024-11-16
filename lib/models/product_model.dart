import 'package:supabase_flutter/supabase_flutter.dart';

// Supabase client instance
final supabase = Supabase.instance.client;

// Product model
class Product {
  final int? id;
  String name;
  String brand;
  String category;
  double price;
  String imageUrl;

  String description;
  bool isFavorite;
  double currentPrice;

  final double oldPrice; // A

  Product({
    this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    this.currentPrice = 0.0,
    this.oldPrice = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'category': category,
      'price': price,
      'description': description,
      'is_favorite': isFavorite,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      category: json['category'],
      price: json['price'].toDouble(),
      description: json['description'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'] ?? false,
    );
  }

  get isLiked => false;
}
