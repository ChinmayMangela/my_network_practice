import 'package:my_network_practice/products/data/models/review.dart';

class Product {
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? rating;
  final List<String>? tags;
  final String? brand;
  final String? returnPolicy;
  final String? image;
  final String? thumbnail;
  final List<Review> reviews;

  const Product({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.tags,
    required this.brand,
    required this.returnPolicy,
    required this.image,
    required this.thumbnail,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> productData) {
    return Product(
      title: productData['title'],
      description: productData['description'],
      category: productData['category'],
      // check if price is valid and convert to double if needed
      price: (productData['price'] as num?)?.toDouble(),
      rating: (productData['rating'] as num?)?.toDouble(),
      tags: List<String>.from(productData['tags'] ?? []), // convert to List<String> if needed
      brand: productData['brand'],
      returnPolicy: productData['returnPolicy'],
      image: productData['images'][0],
      thumbnail: productData['thumbnail'],

      // check if reviews is valid and convert to List<Review> if needed
      reviews: List<Review>.from(productData['reviews']?.map((review) => Review.fromJson(review)) ?? [])
    );
  }
}
