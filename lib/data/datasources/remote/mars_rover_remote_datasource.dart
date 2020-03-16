import 'package:space_nasa/data/datasources/remote/model/marsrover/mars_rover_entity.dart';
import 'package:space_nasa/data/datasources/remote/utils/constants.dart';
import 'package:space_nasa/data/datasources/remote/utils/http_handler.dart';
import 'package:space_nasa/data/datasources/remote/utils/secrets.dart';

class MarsRoverDataSourceImpl implements MarsRoverRemoteDataSource {
  final String path = "/mars-photos/api/v1/rovers/curiosity/photos";
  final Map<String, String> queryParams = {
    "sol": Secrets.SOL_NUMBER,
    "api_key": Secrets.API_KEY
  };

  @override
  Future<MarsRoverRemoteEntity> getMarsRoverPhoto() {
    var uri = Uri.https(Constants.BASE_URL, path, queryParams);

    return _getMarsRoverPhotoFromUri(uri);
  }

  Future<MarsRoverRemoteEntity> _getMarsRoverPhotoFromUri(Uri uri) {
    return HttpHandler()
        .getJson(uri)
        .then((data) => MarsRoverRemoteEntity.fromJson(data));
  }
}

abstract class MarsRoverRemoteDataSource {
  Future<MarsRoverRemoteEntity> getMarsRoverPhoto();
}
