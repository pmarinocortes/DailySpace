import 'package:space_nasa/data/datasources/remote/astronomy_pic_of_day_remote_datasource.dart';
import 'package:space_nasa/data/datasources/remote/mars_rover_remote_datasource.dart';
import 'package:space_nasa/data/repository/MarsRoverRepository.dart';
import 'package:space_nasa/data/repository/astronomy_pic_of_day_repository.dart';
import 'package:space_nasa/domain/interactor/get_astronomy_pic_of_day_use_case.dart';
import 'package:space_nasa/domain/interactor/get_mars_rover_photo_use_case.dart';

class Injection {
  static _providesPicOfDayRemoteDataSource() {
    return AstronomyPicOfDayDataSourceImpl();
  }

  static _providesPicOfDayRepository() {
    return AstronomyPicOfDayRepositoryImpl(_providesPicOfDayRemoteDataSource());
  }

  static providesGetPicOfDayUseCase() {
    return GetAstronomyPicOfDayUseCase(_providesPicOfDayRepository());
  }

  static _providesMarsRoverRemoteDataSource() {
    return MarsRoverDataSourceImpl();
  }

  static _providesMarsRoverRepository() {
    return MarsRoverRepositoryImpl(_providesMarsRoverRemoteDataSource());
  }

  static providesGetMarsRoverPhotoUseCase() {
    return GetMarsRoverPhotoUseCase(_providesMarsRoverRepository());
  }
}
