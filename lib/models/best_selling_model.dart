import 'dart:convert';

class BestSellingModel {
  String img;
  String name;
  String description;
  BestSellingModel({
    this.img = '',
    this.name = '',
    this.description = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'img': img,
      'name': name,
      'description': description,
    };
  }

  factory BestSellingModel.fromMap(map) {
    return BestSellingModel(
      img: map['img'],
      name: map['name'],
      description: map['description'],
    );
  }
}
