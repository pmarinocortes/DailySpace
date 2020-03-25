import 'package:path/path.dart';
import 'package:space_nasa/data/datasources/local/model/astronomy_pic_of_day_local_entity.dart';
import 'package:space_nasa/data/datasources/local/model/marsrover/mars_rover_photo_local_entity.dart';
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
        """CREATE TABLE astronomy_pic_of_day (date TEXT, explanation TEXT, hdurl TEXT, media_type TEXT, service_version TEXT, title TEXT, url TEXT)""");
    await db.execute(
        "CREATE TABLE mars_rover_photo (img_src TEXT, earth_date TEXT)");
  }

  savePicOfDay(AstronomyPicOfDayLocalEntity picOfDay) async {
    final db = await database;
    await db.insert("astronomy_pic_of_day", picOfDay.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
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

//  savePicOfDay(List<AstronomyPicOfDayLocalEntity> pics) async {
//    final db = await database;
//    for (var p in pics) {
//      await db.insert("astronomy_pic_of_day", p.toMap(),
//          conflictAlgorithm: ConflictAlgorithm.replace);
//    }
//  }
//
//  Future<List<AstronomyPicOfDayLocalEntity>> getPicOfDay() async {
//    final db = await database;
//    final List<Map<String, dynamic>> maps =
//        await db.query("astronomy_pic_of_day");
//
//    return List.generate(maps.length, (i) {
//      return AstronomyPicOfDayLocalEntity(
//          date: maps[i]["date"],
//          explanation: maps[i]["explanation"],
//          hdurl: maps[i]["hdurl"],
//          media_type: maps[i]["media_type"],
//          service_version: maps[i]["service_version"],
//          title: maps[i]["title"],
//          url: maps[i]["url"]);
//    });
//  }

  saveMarsRoverPhotos(List<MarsRoverPhotoLocalEntity> marsRoverPhotos) async {
    final Database db = await database;
    for (var m in marsRoverPhotos) {
      await db.insert("mars_rover_photo", m.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<MarsRoverPhotoLocalEntity>> getMarsRoverPhotos() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query("mars_rover_photo");

    return List.generate(maps.length, (i) {
      return MarsRoverPhotoLocalEntity(
          img_src: maps[i]["img_src"], earth_date: maps[i]["earth_date"]);
    });
  }
}
