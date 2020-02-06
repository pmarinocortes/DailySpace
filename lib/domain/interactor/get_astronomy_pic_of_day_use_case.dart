import 'package:space_nasa/data/repository/astronomy_pic_of_day_repository.dart';
import 'package:space_nasa/domain/data_policy.dart';
import 'package:space_nasa/domain/model/astronomy_pic_of_day_model.dart';

class GetAstronomyPicOfDayUseCase {

  AstronomyPicOfDayRepository _repository;

  GetAstronomyPicOfDayUseCase(this._repository);

  Future<AstronomyPicOfDay> run() async {
    var localResponse = await _repository.getPicOfDay(DataPolicy.REMOTE);
    if (localResponse != null) {
      return localResponse.toAstronomyPicOfDay();
    } else {
      throw Exception("error");
    }
  }
}