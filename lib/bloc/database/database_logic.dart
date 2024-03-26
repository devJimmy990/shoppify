import 'package:bloc/bloc.dart';
import 'package:online_store/bloc/database/database_state.dart';
import 'package:online_store/model/category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:online_store/model/data.dart';
import '../../model/item.dart';

class DatabaseLogic extends Cubit<DatabaseState> {
  DatabaseLogic() : super(InitDatabase());
  static Database? _database;
  bool isPreview = false;
  KItem previewItem = KItem();
  List<KItem> items = [];
  List<KCategory> categories = [];

  isItemPreview(bool value, {KItem? item}) {
    isPreview = value;
    emit(IsItemPreview());
    if (isPreview) _setPreviewItem(item!);
  }

  _setPreviewItem(KItem item) {
    previewItem = item;
    emit(SetItemPreview());
  }

  KItem getItemPreview() => previewItem;

  initialDB() async {
    String path = "${await getDatabasesPath()}/shop.db";
    Database db = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  _onCreate(db, version) async {
    await db.execute('''
    CREATE TABLE `item` (
    id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    desc TEXT NOT NULL,
    image TEXT NOT NULL,
    category  TEXT NOT NULL,
    price INTEGER,
    qty INTEGER,
    ordered INTEGER,
    discount REAL,
    isAsset INTEGER
     )''');
    print("Item Database - Created");
    await db.execute('''
    CREATE TABLE `category` (
    id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    image TEXT NOT NULL
    )''');
    print("Categgory Database - Created");

    itemsList.forEach((item) {
      insertItem(item: item,db: db);
      print("Item ${item.name} is Added");
    });

    categoriesList.forEach((category) {
      insertCategory(category: category,db: db);
      print("Category ${category.name} is Added");
    });
  }

  _onUpgrade(db, oldV, newV) async {
    await db.execute('''
    CREATE TABLE `category` (
    id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    image TEXT NOT NULL
    )''');
    print("Database - Upgraded");
  }

  Future<Database?> getInstance() async {
    _database ??= await initialDB();
    _getDBItems(_database!);
    _getDBCategories(_database!);
    return _database;
  }

  insertItem({required KItem item, Database? db}) async {
    await db!
        .transaction((txn) => txn.rawInsert(
                "INSERT INTO `item` "
                "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                [
                  (item.id),
                  (item.name),
                  (item.desc),
                  (item.image),
                  (item.category),
                  item.price,
                  item.qty,
                  item.ordered,
                  item.discount,
                  item.isAsset ? 1 : 0
                ]))
        .then((value) => print("Insert Query - $value"));
  }

  insertCategory({required KCategory category, Database? db}) async {
    await db!
        .transaction(
            (txn) => txn.rawInsert("INSERT INTO `category` VALUES(?, ?, ?)", [
                  (category.id),
                  (category.name),
                  (category.image),
                ]))
        .then((value) => print("Insert Query - $value"));
  }

  Future _getDBItems(Database db) async {
    items.clear();
    await db.rawQuery("SELECT * FROM item").then((value) {
      for (var map in value) {
        items.add(KItem(
          id: map["id"].toString(),
          name: map["name"].toString(),
          desc: map["desc"].toString(),
          image: map["image"].toString(),
          category: map["category"].toString(),
          qty: int.parse("${map["qty"]}"),
          price: int.parse("${map["price"]}"),
          discount: double.parse("${map["discount"]}"),
          isAsset: int.parse("${map["isAsset"]}") == 1 ? true : false,
        ));
      }
      emit(GetDatabaseItems());
    });
  }

  Future _getDBCategories(Database db) async {
    items.clear();
    await db.rawQuery("SELECT * FROM category").then((value) {
      for (var map in value) {
        categories.add(KCategory(
          id: map["id"].toString(),
          name: map["name"].toString(),
          image: map["image"].toString(),
        ));
      }
      emit(GetDatabaseCategories());
    });
  }
}
