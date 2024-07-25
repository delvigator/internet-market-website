import 'package:flutter/cupertino.dart';

class Product {
  String name;
  String category;
  String card;
  String description;
  double rating;
  String price;
  List<String> photos;

  Product({required this.name,
    required this.photos,
    required this.category,
    required this.card,
    required this.description,
    required this.rating,
    required this.price});


  factory Product.fromJson(Map<String, dynamic> map) {
    List<dynamic> photos=map["photos"];
    return Product(
        name: map["name"],
        category: map["category"],
        card: map["card"],
        description: map["description"],
        rating: map["rating"],
        photos: List.generate(photos.length, (index)=> photos[index]),
        price: map['price']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'category': this.category,
      'card': this.card,
      'description': this.description,
      'rating': this.rating,
      'photos':this.photos,
      'price': this.price,
    };
  }


}