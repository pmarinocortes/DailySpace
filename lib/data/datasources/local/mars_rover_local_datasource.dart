import 'package:space_nasa/data/datasources/local/model/mars_rover_local_entity.dart';

//This class is not finished

class MarsRoverLocalDataSourceImpl implements MarsRoverLocalDataSource {
  @override
  Future<MarsRoverLocalEntity> getMarsRoverPhoto() {
    // TODO: implement getMarsRoverPhoto
    return null;
  }
}

abstract class MarsRoverLocalDataSource {
  Future<MarsRoverLocalEntity> getMarsRoverPhoto();
}
