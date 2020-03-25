import 'package:space_nasa/data/datasources/remote/model/marsrover/mars_rover_photo_remote_entity.dart';
import 'package:space_nasa/data/datasources/remote/utils/constants.dart';
import 'package:space_nasa/data/datasources/remote/utils/http_handler.dart';
import 'package:space_nasa/data/datasources/remote/utils/secrets.dart';

class MarsRoverPhotoRemoteDataSourceImpl implements MarsRoverPhotoRemoteDataSource {
  final String path = "/mars-photos/api/v1/rovers/curiosity/photos";
  final Map<String, String> queryParams = {
    "sol": Secrets.SOL_NUMBER,
    "api_key": Secrets.API_KEY
  };

  @override
  Future<List<MarsRoverPhotoRemoteEntity>> getMarsRoverPhotos() {
    var uri = Uri.https(Constants.BASE_URL, path, queryParams);
    return _getMarsRoverPhotoFromUri(uri);
  }

  Future<List<MarsRoverPhotoRemoteEntity>> _getMarsRoverPhotoFromUri(Uri uri) {
    return HttpHandler().getJson(uri).then(((data) => data["photos"]
        .map<MarsRoverPhotoRemoteEntity>(
            (item) => MarsRoverPhotoRemoteEntity.fromJson(item)).toList()));
  }

}

abstract class MarsRoverPhotoRemoteDataSource {
  Future<List<MarsRoverPhotoRemoteEntity>> getMarsRoverPhotos();
}
