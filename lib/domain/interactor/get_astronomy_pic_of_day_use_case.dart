import 'package:space_nasa/data/repository/astronomy_pic_of_day_repository.dart';
import 'package:space_nasa/domain/data_policy.dart';
import 'package:space_nasa/domain/model/astronomy_pic_of_day_model.dart';

class GetAstronomyPicOfDayUseCase {
  AstronomyPicOfDayRepository _repository;

  GetAstronomyPicOfDayUseCase(this._repository);

  Future<AstronomyPicOfDay> run() async {
    var response = await _repository.getPicOfDay(DataPolicy.REMOTE);
    if (response != null) {
      return response.toAstronomyPicOfDay();
    } else {
      return throw Exception("error");
    }
  }

//  Future<List<Movie>> run() async {
//    var response = await _repository.getPopularMovies(DataPolicy.REMOTE);
//    if (response.isNotEmpty) {
//      return response
//          .map((movie) => movie.toMovie()).toList();
//    } else {
//      throw Exception("error");
//    }
//  }

//  Future<AstronomyPicOfDay> run() async {
//    var remote = await _repository.getPicOfDay(DataPolicy.REMOTE);
//    var local = await _repository.getPicOfDay(DataPolicy.LOCAL);
//    if (remote != null) {
////      return remote.toAstronomyPicOfDay();
//      if (remote == local) {
//        return local.toAstronomyPicOfDay();
//      } else {
//        return remote.toAstronomyPicOfDay();
//      }
//    } else {
//      throw Exception("error");
//    }

//  }

//  Future<AstronomyPicOfDay> run() {
//    var localResult = _getLocalResult();
//    var remoteResult = _getRemoteResult();
//
//    if (remoteResult != null) {
//      if (remoteResult == localResult) {
//        return localResult;
//      } else {
//        return remoteResult;
//      }
//    } else {
//      throw Exception("error");
//    }
//  }

//  Future<AstronomyPicOfDay> _getLocalResult() async {
//    var local = await _repository.getPicOfDay(DataPolicy.LOCAL);
//    if (local != null) {
//      return local.toAstronomyPicOfDay();
//    } else {
//      return throw Exception("error");
//    }
//  }
//
//  Future<AstronomyPicOfDay> _getRemoteResult() async {
//    var remote = await _repository.getPicOfDay(DataPolicy.REMOTE);
//    if (remote != null) {
//      return remote.toAstronomyPicOfDay();
//    } else {
//      return throw Exception("error");
//    }
//  }
}
