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
      return _db;
    }
    String path = join(await getDatabasesPath(), 'cart.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE products (id integer primary key autoincrement, name TEXT ,img TEXT,price TEXT,count INTEGER);');
    });
    print("database");

    return _db;
  }

  Future<int> createPruduct(CartProduct cartPruduct) async {
    Database db = await createDatabase();
    return db.insert('products', cartPruduct.toMap()).then((value) {
      print("the id inserted>>>>>>>>>>>>>>>>>>>>>>>>>> $value");
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

  Future<int> updateId(CartProduct cartProduct) async {
    Database db = await createDatabase();
    return db.update('products', cartProduct.toMap(),
        where: 'id=?', whereArgs: [cartProduct.id]);
  }

  void clear() async {
    Database db = await createDatabase();
    db.execute('delete from products');
  }
}
