import 'package:space_nasa/data/datasources/local/astronomy_pic_of_day_local_datasource.dart';
import 'package:space_nasa/data/datasources/local/database_helper.dart';
import 'package:space_nasa/data/datasources/local/mars_rover_photo_local_datasource.dart';
import 'package:space_nasa/data/datasources/remote/astronomy_pic_of_day_remote_datasource.dart';
import 'package:space_nasa/data/datasources/remote/mars_rover_photo_remote_datasource.dart';
import 'package:space_nasa/data/repository/astronomy_pic_of_day_repository.dart';
import 'package:space_nasa/data/repository/mars_rover_photo_repository.dart';
import 'package:space_nasa/domain/interactor/get_astronomy_pic_of_day_use_case.dart';
import 'package:space_nasa/domain/interactor/get_mars_rover_photo_use_case.dart';

class Injection {
  static _providesPicOfDayRemoteDataSource() {
    return AstronomyPicOfDayDataSourceImpl();
  }

  static _providesPicOfDayLocalDataSource() {
    return AstronomyPicOfDayLocalDataSourceImpl(DatabaseHelper.db);
  }

  static _providesPicOfDayRepository() {
    return AstronomyPicOfDayRepositoryImpl(_providesPicOfDayRemoteDataSource(),
        _providesPicOfDayLocalDataSource());
  }

  static providesGetPicOfDayUseCase() {
    return GetAstronomyPicOfDayUseCase(_providesPicOfDayRepository());
  }

  static _providesMarsRoverPhotoRemoteDataSource() {
    return MarsRoverPhotoRemoteDataSourceImpl();
  }

  static _providesMarsRoverPhotoLocalDataSource() {
    return MarsRoverPhotoLocalDataSourceImpl(DatabaseHelper.db);
  }

  static _providesMarsRoverRepository() {
    return MarsRoverPhotoRepositoryImpl(
        _providesMarsRoverPhotoRemoteDataSource(),
        _providesMarsRoverPhotoLocalDataSource());
  }

  static providesGetMarsRoverPhotoUseCase() {
    return GetMarsRoverPhotoUseCase(_providesMarsRoverRepository());
  }
}
