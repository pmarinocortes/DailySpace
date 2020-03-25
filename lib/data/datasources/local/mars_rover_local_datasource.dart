import 'package:space_nasa/data/datasources/local/model/marsrover/mars_rover_local_entity.dart';
import 'database_helper.dart';

class MarsRoverLocalDataSourceImpl implements MarsRoverLocalDataSource {

  DatabaseHelper _db;

  MarsRoverLocalDataSourceImpl(this._db);
  @override
  Future<MarsRoverLocalEntity> getMarsRoverPhoto() {
    // TODO: implement getMarsRoverPhoto
    return null;
  }

  @override
  saveMarsRoverPhotos(MarsRoverLocalEntity marsRover) {
    // TODO: implement saveMarsRoverPhoto
    return null;
  }
}

abstract class MarsRoverLocalDataSource {
  Future<MarsRoverLocalEntity> getMarsRoverPhoto();
  saveMarsRoverPhotos(MarsRoverLocalEntity marsRover);
}
