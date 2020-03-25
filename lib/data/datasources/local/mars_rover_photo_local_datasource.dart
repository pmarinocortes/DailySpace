import 'package:space_nasa/data/datasources/local/database_helper.dart';
import 'package:space_nasa/data/datasources/local/model/marsrover/mars_rover_photo_local_entity.dart';

class MarsRoverPhotoLocalDataSourceImpl
    implements MarsRoverPhotoLocalDataSource {
  DatabaseHelper _db;

  MarsRoverPhotoLocalDataSourceImpl(this._db);

  @override
  Future<List<MarsRoverPhotoLocalEntity>> getMarsRoverPhotos() {
    return _db.getMarsRoverPhotos();
  }

  @override
  saveMarsRoverPhotos(List<MarsRoverPhotoLocalEntity> marsRoverPhotos) {
    _db.saveMarsRoverPhotos(marsRoverPhotos);
  }
}

abstract class MarsRoverPhotoLocalDataSource {
  Future<List<MarsRoverPhotoLocalEntity>> getMarsRoverPhotos();

  saveMarsRoverPhotos(List<MarsRoverPhotoLocalEntity> marsRoverPhotos);
}
