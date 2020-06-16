import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_launches_remote_entity.dart';
import 'package:space_nasa/data/datasources/remote/utils/constants.dart';
import 'package:space_nasa/data/datasources/remote/utils/http_handler.dart';

class SpaceXLaunchesRemoteDataSourceImpl
    implements SpaceXLaunchesRemoteDataSource {
  final String path = "/v3/launches";

  @override
  Future<List<SpaceXLaunchesRemoteEntity>> getSpaceXLaunches() {
    var uri = Uri.https(Constants.SPACE_X_BASE_URL, path);
    return _getSpaceXLaunchesFromUri(uri);
  }

  Future<List<SpaceXLaunchesRemoteEntity>> _getSpaceXLaunchesFromUri(
      Uri uri) async {
//    return HttpHandler()
//        .getJson(uri)
//        .then((data) =>  SpaceXLaunchesRemoteEntity.fromJson(data));
    return HttpHandler().getJson(uri).then((data) => data
        .map<SpaceXLaunchesRemoteEntity>(
            (item) => SpaceXLaunchesRemoteEntity.fromJson(item))
        .toList());
//    List<UserModel>.from(response.data.map((i) => UserModel.fromJson(i)));
  }

//  Future<List<MarsRoverPhotoRemoteEntity>> _getMarsRoverPhotoFromUri(Uri uri) {
//    return HttpHandler().getJson(uri).then(((data) => data["photos"]
//        .map<MarsRoverPhotoRemoteEntity>(
//            (item) => MarsRoverPhotoRemoteEntity.fromJson(item)).toList()));
//  }
}

abstract class SpaceXLaunchesRemoteDataSource {
  Future<List<SpaceXLaunchesRemoteEntity>> getSpaceXLaunches();
}
