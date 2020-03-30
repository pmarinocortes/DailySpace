import 'package:space_nasa/data/datasources/local/database_helper.dart';
import 'package:space_nasa/data/datasources/local/model/astronomy_pic_of_day_local_entity.dart';

class AstronomyPicOfDayLocalDataSourceImpl
    implements AstronomyPicOfDayLocalDataSource {
  DatabaseHelper _db;

  AstronomyPicOfDayLocalDataSourceImpl(this._db);

  @override
  savePicOfDay(AstronomyPicOfDayLocalEntity picOfDay) {
    _db.savePicOfDay(picOfDay);
  }

  @override
  Future<AstronomyPicOfDayLocalEntity> getPicOfDay() {
    return _db.getPicOfDay();
  }

  @override
  Future<void> deletePicOfDay(String date) {
    return _db.deletePicOfDay(date);
  }
}

abstract class AstronomyPicOfDayLocalDataSource {
  Future<AstronomyPicOfDayLocalEntity> getPicOfDay();

  savePicOfDay(AstronomyPicOfDayLocalEntity picOfDay);

  Future<void> deletePicOfDay(String date);
}
