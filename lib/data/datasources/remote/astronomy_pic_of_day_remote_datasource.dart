import 'package:space_nasa/data/datasources/remote/model/astronomy_pic_of_day_remote_entity.dart';
import 'package:space_nasa/data/datasources/remote/utils/constants.dart';
import 'package:space_nasa/data/datasources/remote/utils/http_handler.dart';
import 'package:space_nasa/data/datasources/remote/utils/secrets.dart';

class AstronomyPicOfDayDataSourceImpl
    implements AstronomyPicOfDayRemoteDataSource {
  final String path = "/planetary/apod";
  final Map<String, String> queryParams = {"api_key": Secrets.API_KEY};

  @override
  Future<AstronomyPicOfDayRemoteEntity> getPicOfDay() {
    var uri = Uri.https(Constants.BASE_URL, path, queryParams);

    return _getPicOfDayFromUri(uri);
  }

  Future<AstronomyPicOfDayRemoteEntity> _getPicOfDayFromUri(Uri uri) {
    return HttpHandler()
        .getJson(uri)
        .then((data) => AstronomyPicOfDayRemoteEntity.fromJson(data));
  }

//  Future<List<AstronomyPicOfDayRemoteEntity>> _getPicOfDayFromUri(Uri uri) {
//    return HttpHandler().getJson(uri).then(((data) => data['results']
//        .map<AstronomyPicOfDayRemoteEntity>(
//            (item) => AstronomyPicOfDayRemoteEntity.fromJson(item))
//        .toList()),);
//  }
}

abstract class AstronomyPicOfDayRemoteDataSource {
  Future<AstronomyPicOfDayRemoteEntity> getPicOfDay();
}
