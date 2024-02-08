import 'dart:io';

import 'package:minsait_larh/models/models.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database!;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ReviewsDB.db');

    // Crear base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Reviews(
            id INTEGER PRIMARY KEY,
            movie TEXT,
            review TEXT
          )
        ''');
    });
  }

  Future<int> newReview(Review newReview) async {
    final db = await database;
    final res = await db.insert('Reviews', newReview.toJson());

    // Es el ID del último registro insertado;
    return res;
  }

  Future<List<Review>> getAllReviews() async {
    final db = await database;
    final res = await db.query('Reviews');

    return res.isNotEmpty ? res.map((s) => Review.fromJson(s)).toList() : [];
  }
}
