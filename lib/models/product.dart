import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? category;
  String? code;
  String? image;
  String? name;
  int? price;
  bool? favorite;

  Product({
    this.category,
    this.code,
    this.image,
    this.name,
    this.price,
    this.favorite,
  });

  factory Product.fromFirestore(DocumentSnapshot snapshot) {
    Map d = snapshot.data() as Map<dynamic, dynamic>;
    return Product(
      category: d['category'],
      code: d['code'],
      image: d['image'],
      name: d['name'],
      price: d['price'],
      favorite: d['favorite'],
    );
  }
}
