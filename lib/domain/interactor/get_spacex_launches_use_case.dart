import 'package:space_nasa/data/repository/spacex_launches_repository.dart';
import 'package:space_nasa/domain/data_policy.dart';
import 'package:space_nasa/domain/model/spacex/spacex_launches_model.dart';

class GetSpaceXLaunchesUseCase {
  SpaceXLaunchesRepository _repository;

  GetSpaceXLaunchesUseCase(this._repository);

  Future<List<SpaceXLaunches>> run() async {
    return _getRemoteResult();
  }

  Future<List<SpaceXLaunches>> _getRemoteResult() async {
    var response = await _repository.getSpaceXLaunches(DataPolicy.REMOTE);

    if (response.isNotEmpty) {
      return response.map((launches) => launches.toSpacexLaunches()).toList();
    } else {
      throw Exception("error");
    }
  }
//  Future<SpaceXLaunches> _getRemoteResult() async {
//    var response = await _repository.getSpaceXLaunches(DataPolicy.REMOTE);
//    if(response != null) {
//      return response.toSpacexLaunches();
//    } else {
//      throw Exception("error");
//    }
//  }
}
