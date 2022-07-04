import 'dart:convert';

class CartProduct {
  int? id;
  String name;
  String price;
  int count;
  String img;
  CartProduct({
    this.id,
    this.name = '',
    this.price = '',
    this.count = 0,
    this.img = '',
  });

  CartProduct copyWith({
    int? id,
    String? name,
    String? price,
    int? count,
    String? img,
  }) {
    return CartProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      count: count ?? this.count,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'count': count,
      'img': img,
    };
  }

  factory CartProduct.fromMap(map) {
    return CartProduct(
      id: map['id'] != null ? map['id']?.toInt() : null,
      name: map['name'],
      price: map['price'],
      count: map['count']?.toInt(),
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduct.fromJson(String source) =>
      CartProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartProduct(id: $id, name: $name, price: $price, count: $count, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartProduct &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.count == count &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        count.hashCode ^
        img.hashCode;
  }
}
