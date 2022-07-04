import 'package:e_commerce/models/cart_product.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();
  static Database? _db;
  createDatabase() async {
    if (_db != null) {
      return;
    }
    String path = join(await getDatabasesPath(), 'cart.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE products (id INTEGER PRIMARY KEY AUTO_INCREMENT , name TEXT , img TEXT,price INTEGER,count INTEGER);');
    });
    return _db;
  }

  Future<int> createProducts(CartProduct cartProduct) async {
    Database db = await createDatabase();
    return db.insert('products', cartProduct.toMap()).then((value) {
      print("the id inserted $value");
      return value;
    });
  }

  Future<List<Map<String, Object?>>> allProducts() async {
    Database db = await createDatabase();
    return db.query('products');
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('products', where: 'id = ?', whereArgs: [id]);
  }
}
