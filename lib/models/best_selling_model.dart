import 'dart:convert';

class BestSellingModel {
  String brand;
  String color;
  String details;
  String img;
  String name;
  String price;
  BestSellingModel({
    this.brand = '',
    this.color = "",
    this.details = '',
    this.img = '',
    this.name = '',
    this.price = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand': brand,
      'color': color,
      'details': details,
      'img': img,
      'name': name,
      'price': price,
    };
  }

  factory BestSellingModel.fromMap(map) {
    return BestSellingModel(
      brand: map['brand'],
      color: map['color'],
      details: map['details'],
      img: map['img'],
      name: map['name'],
      price: map['price'],
    );
  }
}
