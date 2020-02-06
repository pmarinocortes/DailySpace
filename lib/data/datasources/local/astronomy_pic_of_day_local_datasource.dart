import 'package:space_nasa/data/datasources/local/astronomypicofday/astronomy_pic_of_day_preferences.dart';
import 'package:space_nasa/data/datasources/local/database_helper.dart';
import 'package:space_nasa/data/datasources/local/model/astronomy_pic_of_day_local_entity.dart';

class AstronomyPicOfdayLocalDataSourceImpl
    implements AstronomyPicOfDayLocalDataSource {
  DatabaseHelper _databaseHelper;
  AstronomyPicOfDayPreferences prefs;

  AstronomyPicOfdayLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<AstronomyPicOfDayLocalEntity> getPicOfDay() {
    return _databaseHelper.getPicOfDay();
//  return prefs.getPicOfDay();
  }

  @override
  Future<String> getExplanation() {
    return prefs.getExplanation();
  }

  @override
  Future<String> getTitle() {
    return prefs.getTitle();
  }
}

abstract class AstronomyPicOfDayLocalDataSource {
  Future<AstronomyPicOfDayLocalEntity> getPicOfDay();

  Future<String> getTitle();

  Future<String> getExplanation();
}
