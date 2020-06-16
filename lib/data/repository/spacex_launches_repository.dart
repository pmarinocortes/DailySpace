import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_launches_remote_entity.dart';
import 'package:space_nasa/data/datasources/remote/spacex_lauches_remote_datasource.dart';
import 'package:space_nasa/data/repository/model/spacex_launches_entity.dart';
import 'package:space_nasa/domain/data_policy.dart';

class SpaceXLaunchesRepositoryImpl implements SpaceXLaunchesRepository {
  SpaceXLaunchesRemoteDataSource _remoteDataSource;

  SpaceXLaunchesRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<SpaceXLaunchesEntity>> getSpaceXLaunches(DataPolicy dataPolicy) {
    switch (dataPolicy) {
//      case DataPolicy.LOCAL:
//        return _getPicOfDayFromLocal();
//        break;
      case DataPolicy.REMOTE:
        return _getSpaceXLaunchesFromRemote();
        break;
      default:
        throw ArgumentError("Invalid Argument");
    }
  }

  Future<List<SpaceXLaunchesEntity>> _getSpaceXLaunchesFromRemote() async {
    var remoteResponse = await _remoteDataSource.getSpaceXLaunches();

    if (remoteResponse != null) {
      return fromRemoteEntityToSpaceXLaunchesEntity(remoteResponse);
//      return fromRemoteEntityToSpaceXLaunchesEntity(remoteResponse);
    } else {
      throw Exception("Error: Empty remote response");
    }
  }

  List<SpaceXLaunchesEntity> fromRemoteEntityToSpaceXLaunchesEntity(
      List<SpaceXLaunchesRemoteEntity> marsRoverPhotoRemoteEntityList) {
    return marsRoverPhotoRemoteEntityList
        .map((launches) => launches.toSpaceXLaunchesEntity())
        .toList();
  }
}

abstract class SpaceXLaunchesRepository {
  Future<List<SpaceXLaunchesEntity>> getSpaceXLaunches(DataPolicy dataPolicy);
}
