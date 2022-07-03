import 'dart:convert';

class CartProduct {
  int? id;
  String name;
  int price;
  int count;
  String image;
  CartProduct({
    this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'count': count,
      'image': image
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        count: map['count'],
        image: map['image']);
  }
}
