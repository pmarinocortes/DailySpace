import 'package:space_nasa/data/datasources/local/database_helper.dart';
import 'package:space_nasa/data/datasources/local/mars_rover_photo_local_datasource.dart';
import 'package:space_nasa/data/datasources/local/model/marsrover/mars_rover_photo_local_entity.dart';
import 'package:space_nasa/data/datasources/remote/mars_rover_photo_remote_datasource.dart';
import 'package:space_nasa/data/datasources/remote/model/marsrover/mars_rover_photo_remote_entity.dart';
import 'package:space_nasa/data/repository/model/mars_rover_photo_entity.dart';
import 'package:space_nasa/domain/data_policy.dart';

class MarsRoverPhotoRepositoryImpl implements MarsRoverPhotoRepository {
  MarsRoverPhotoRemoteDataSource _remoteDataSource;
  MarsRoverPhotoLocalDataSource _localDataSource;

  MarsRoverPhotoRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<List<MarsRoverPhotoEntity>> getMarsRoverPhotos(DataPolicy dataPolicy) {
    switch (dataPolicy) {
      case DataPolicy.LOCAL:
        return _getMarsRoverPhotoFromLocal();
        break;
      case DataPolicy.REMOTE:
        return _getMarsRoverPhotoFromRemote();
        break;
      default:
        throw ArgumentError("Invalid Argument");
    }
  }

  Future<List<MarsRoverPhotoEntity>> _getMarsRoverPhotoFromLocal() async {
    var localResponse = await _localDataSource.getMarsRoverPhotos();

    if (localResponse.isNotEmpty) {
      return fromLocalEntityToMarsRoverEntity(localResponse);
    } else {
      return _getMarsRoverPhotoFromRemote();
    }
  }

  Future<List<MarsRoverPhotoEntity>> _getMarsRoverPhotoFromRemote() async {
    var remoteResponse = await _remoteDataSource.getMarsRoverPhotos();
//    saveMarsRoverPhotos(remoteResponse);
    _localDataSource.saveMarsRoverPhotos(fromRemoteEntityToMarsRoverPhotoLocalEntity(remoteResponse));

    if (remoteResponse.isNotEmpty) {
      return fromRemoteEntityToMarsRoverEntity(remoteResponse);
    } else {
      throw Exception("Error: Empty remote response");
    }
  }

//  saveMarsRoverPhotos(List<MarsRoverPhotoRemoteEntity> marsRoverPhotos) {
//    DatabaseHelper.db.saveMarsRoverPhotos(marsRoverPhotos
//        .map((photos) => photos.toMarsRoverPhotoLocalEntity())
//        .toList());
//  }

  List<MarsRoverPhotoEntity> fromRemoteEntityToMarsRoverEntity(
      List<MarsRoverPhotoRemoteEntity> marsRoverPhotoRemoteEntityList) {
    return marsRoverPhotoRemoteEntityList
        .map((photos) => photos.toMarsRoverPhoto())
        .toList();
  }

  List<MarsRoverPhotoEntity> fromLocalEntityToMarsRoverEntity(
      List<MarsRoverPhotoLocalEntity> marsRoverPhotoLocalEntityList) {
    return marsRoverPhotoLocalEntityList
        .map((movie) => movie.toMarsRoverPhotoEntity())
        .toList();
  }

  List<MarsRoverPhotoLocalEntity> fromMarsRoverPhotoEntityToLocalEntity(
      List<MarsRoverPhotoEntity> marsRoverPhotoEntityList) {
    return marsRoverPhotoEntityList
        .map((photos) => photos.toMarsRoverPhotoLocalEntity())
        .toList();
  }

  List<MarsRoverPhotoLocalEntity> fromRemoteEntityToMarsRoverPhotoLocalEntity(
      List<MarsRoverPhotoRemoteEntity> marsRoverPhotoRemoteEntityList) {
    return marsRoverPhotoRemoteEntityList
        .map((photos) => photos.toMarsRoverPhotoLocalEntity())
        .toList();
  }
}

abstract class MarsRoverPhotoRepository {
  Future<List<MarsRoverPhotoEntity>> getMarsRoverPhotos(DataPolicy dataPolicy);
}
