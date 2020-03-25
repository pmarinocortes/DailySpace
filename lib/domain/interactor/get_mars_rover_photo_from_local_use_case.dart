import 'package:space_nasa/data/repository/mars_rover_photo_repository.dart';
import 'package:space_nasa/domain/model/mars_rover_photo_model.dart';

import '../data_policy.dart';

class GetMarsRoverPhotoFromLocalUseCase {
  MarsRoverPhotoRepository _repository;

  GetMarsRoverPhotoFromLocalUseCase(this._repository);

  Future<List<MarsRoverPhoto>> run() async {
    var localResponse = await _repository.getMarsRoverPhotos(DataPolicy.LOCAL);
    if (localResponse.isNotEmpty) {
      return localResponse.map((photo) => photo.toMarsRoverPhoto()).toList();
    } else {
      throw Exception("error");
    }
  }
}
