import 'package:space_nasa/data/repository/MarsRoverRepository.dart';
import 'package:space_nasa/domain/data_policy.dart';
import 'package:space_nasa/domain/model/mars_rover_model.dart';

class GetMarsRoverPhotoUseCase {
  MarsRoverRepository _repository;

  GetMarsRoverPhotoUseCase(this._repository);

  Future<MarsRover> run() async {
    var localResponse = await _repository.getMarsRoverPhoto(DataPolicy.REMOTE);

    if (localResponse != null) {
      return localResponse.toMarsRover();
    } else {
      throw Exception("error");
    }
  }
}
