import 'package:path/path.dart';
import 'package:space_nasa/data/datasources/local/model/astronomy_pic_of_day_local_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  String path;

  DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await init();
    return _database;
  }

  init() async {
    String path = await getDatabasesPath();
    path = join(path, "spacenasa.db");

    return await openDatabase(path, version: 1, onCreate: _onCreateTables);
  }

  _onCreateTables(Database db, int version) async {
    await db.execute(
        "CREATE TABLE astronomy_pic_of_day (date TEXT, explanation TEXT, hdurl TEXT, media_type TEXT, service_version TEXT, title TEXT, url TEXT)");
  }

  Future<AstronomyPicOfDayLocalEntity> getPicOfDay() async {
    return AstronomyPicOfDayLocalEntity(
        date: "date",
        explanation: "explanation",
        hdurl: "hdurl",
        media_type: "media_type",
        service_version: "service_version",
        title: "title",
        url: "url");
  }
}
