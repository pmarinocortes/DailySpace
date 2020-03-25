import 'package:space_nasa/data/datasources/local/astronomy_pic_of_day_local_datasource.dart';
import 'package:space_nasa/data/datasources/local/database_helper.dart';
import 'package:space_nasa/data/datasources/local/model/astronomy_pic_of_day_local_entity.dart';
import 'package:space_nasa/data/datasources/remote/astronomy_pic_of_day_remote_datasource.dart';
import 'package:space_nasa/data/datasources/remote/model/astronomy_pic_of_day_remote_entity.dart';
import 'package:space_nasa/data/repository/model/astronomy_pic_of_day_entity.dart';
import 'package:space_nasa/domain/data_policy.dart';

class AstronomyPicOfDayRepositoryImpl implements AstronomyPicOfDayRepository {
  AstronomyPicOfDayRemoteDataSource _remoteDataSource;
  AstronomyPicOfDayLocalDataSource _localDataSource;

  AstronomyPicOfDayRepositoryImpl(this._remoteDataSource);

  @override
  Future<AstronomyPicOfDayEntity> getPicOfDay(DataPolicy dataPolicy) {
    switch (dataPolicy) {
      case DataPolicy.LOCAL:
        return _getPicOfDayFromLocal();
        break;
      case DataPolicy.REMOTE:
        return _getPicOfDayFromRemote();
        break;
      default:
        throw ArgumentError("Invalid Argument");
    }
  }

  Future<AstronomyPicOfDayEntity> _getPicOfDayFromLocal() async {
    var localResponse = await _localDataSource.getPicOfDay();

    if (localResponse != null) {
      return fromLocalEntityToAstronomyPicOfDayEntity(localResponse);
    } else {
      return _getPicOfDayFromRemote();
    }
  }

  Future<AstronomyPicOfDayEntity> _getPicOfDayFromRemote() async {
    var remoteResponse = await _remoteDataSource.getPicOfDay();
    savePicOfDay(remoteResponse);

    if (remoteResponse != null) {
      return fromRemoteEntityToAstronomyPicOfDayEntityEntity(remoteResponse);
    } else {
      throw Exception("Error: Empty remote response");
    }
  }

  void savePicOfDay(AstronomyPicOfDayRemoteEntity picOfDay) {
    DatabaseHelper.db.savePicOfDay(picOfDay.toAstronomyPicOfDayLocalEntity());
  }

//  void savePicOfDay(List<AstronomyPicOfDayRemoteEntity> picOfDay) {
//    DatabaseHelper.db.savePicOfDay(
//        picOfDay.map((pic) => pic.toAstronomyPicOfDayLocalEntity()).toList());
//  }

  AstronomyPicOfDayEntity fromRemoteEntityToAstronomyPicOfDayEntityEntity(
      AstronomyPicOfDayRemoteEntity picOfDayRemoteEntity) {
    return picOfDayRemoteEntity.toAstronomyPicOfDayEntity();
  }

  AstronomyPicOfDayEntity fromLocalEntityToAstronomyPicOfDayEntity(
      AstronomyPicOfDayLocalEntity picOfDayLocalEntity) {
    return picOfDayLocalEntity.toAstronomyPicOfDayEntity();
  }
}

abstract class AstronomyPicOfDayRepository {
  Future<AstronomyPicOfDayEntity> getPicOfDay(DataPolicy dataPolicy);
}
