import 'package:space_nasa/data/repository/mars_rover_photo_repository.dart';
import 'package:space_nasa/domain/data_policy.dart';
import 'package:space_nasa/domain/model/mars_rover_photo_model.dart';

class GetMarsRoverPhotoUseCase {
  MarsRoverPhotoRepository _repository;
  static var _isFirstTime = false;

  GetMarsRoverPhotoUseCase(this._repository);

  Future<List<MarsRoverPhoto>> run() async {
    if(_isFirstTime) {
      return  _getLocalResult();
    } else {
      return _getRemoteResult();
    }
  }

  Future<List<MarsRoverPhoto>>_getRemoteResult() async {
    var response = await _repository.getMarsRoverPhotos(DataPolicy.REMOTE);
    _isFirstTime = true;
    if (response.isNotEmpty) {
      return response.map((photo) => photo.toMarsRoverPhoto()).toList();
    } else {
      throw Exception("error");
    }
  }

  Future<List<MarsRoverPhoto>>_getLocalResult() async {
    var localResponse = await _repository.getMarsRoverPhotos(DataPolicy.LOCAL);
    if (localResponse.isNotEmpty) {
      return localResponse.map((photo) => photo.toMarsRoverPhoto()).toList();
    } else {
      throw Exception("error");
    }
  }
}
