import 'package:space_nasa/data/datasources/local/mars_rover_local_datasource.dart';
import 'package:space_nasa/data/datasources/remote/mars_rover_remote_datasource.dart';
import 'package:space_nasa/data/repository/model/MarsRoverEntity.dart';
import 'package:space_nasa/domain/data_policy.dart';

class MarsRoverRepositoryImpl implements MarsRoverRepository {
  MarsRoverRemoteDataSource _remoteDataSource;
  MarsRoverLocalDataSource _localDataSource;

  MarsRoverRepositoryImpl(this._remoteDataSource);

  @override
  Future<MarsRoverEntity> getMarsRoverPhoto(DataPolicy dataPolicy) {
    switch (dataPolicy) {
      case DataPolicy.LOCAL:
        return _getMarsRoverPhotoFromLocal();
        break;
      case DataPolicy.REMOTE:
        return _getMarsRoverPhotoFromRemote();
    }
    return null;
  }

  Future<MarsRoverEntity> _getMarsRoverPhotoFromLocal() async {
    var localResponse = await _localDataSource.getMarsRoverPhoto();

    if (localResponse != null) {
      return MarsRoverEntity(
//          img_src: localResponse.img_src,
//          earth_date: localResponse.earth_date

      );
    } else {
      throw Exception("Error: Empty local response");
    }
  }

  Future<MarsRoverEntity> _getMarsRoverPhotoFromRemote() async {
    var remoteResponse = await _remoteDataSource.getMarsRoverPhoto();

    if (remoteResponse != null) {
      return MarsRoverEntity(
      photos: remoteResponse.photos
      );
    } else {
      throw Exception("Error: Empty remote response");
    }
  }
}

abstract class MarsRoverRepository {
  Future<MarsRoverEntity> getMarsRoverPhoto(DataPolicy dataPolicy);
}
