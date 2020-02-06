import 'package:space_nasa/data/datasources/local/astronomy_pic_of_day_local_datasource.dart';
import 'package:space_nasa/data/datasources/remote/astronomy_pic_of_day_datasource.dart';
import 'package:space_nasa/data/repository/model/astronomy_pic_of_day_entity.dart';
import 'package:space_nasa/domain/data_policy.dart';

class AstronomyPicOfDayRepositoryImpl
    implements AstronomyPicOfDayRepository {
  AstronomyPicOfDayRemoteDataSource _remoteDataSource;
  AstronomyPicOfDayLocalDataSource _localDataSource;

  AstronomyPicOfDayRepositoryImpl(
      this._remoteDataSource);

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
      return AstronomyPicOfDayEntity(
          date: localResponse.date,
          explanation: localResponse.explanation,
          hdurl: localResponse.hdurl,
          media_type: localResponse.media_type,
          service_version: localResponse.service_version,
          title: localResponse.title,
          url: localResponse.url);
    } else {
      throw Exception("Error: Empty local response");
    }
  }

  Future<AstronomyPicOfDayEntity> _getPicOfDayFromRemote() async {
    var remoteResponse = await _remoteDataSource.getPicOfDay();

    if (remoteResponse != null) {
      return AstronomyPicOfDayEntity(
          date: remoteResponse.date,
          explanation: remoteResponse.explanation,
          hdurl: remoteResponse.hdurl,
          media_type: remoteResponse.media_type,
          service_version: remoteResponse.service_version,
          title: remoteResponse.title,
          url: remoteResponse.url);
    } else {
      throw Exception("Error: Empty remote response");
    }
  }
}

abstract class AstronomyPicOfDayRepository {
  Future<AstronomyPicOfDayEntity> getPicOfDay(DataPolicy dataPolicy);
}
