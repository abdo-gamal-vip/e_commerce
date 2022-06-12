import 'dart:convert';

class CategoryModel {
  String img;
  String name;

  CategoryModel({
    this.img = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'img': img,
      'name': name,
    };
  }

  factory CategoryModel.fromMap(map) {
    return CategoryModel(
      img: map['img'],
      name: map['name'],
    );
  }
}
