import 'package:space_nasa/domain/model/astronomy_pic_of_day_model.dart';

class AstronomyPicOfDayEntity {
  String date;
  String explanation;
  String hdurl;
  String media_type;
  String service_version;
  String title;
  String url;

  AstronomyPicOfDayEntity(
      {this.date,
      this.explanation,
      this.hdurl,
      this.media_type,
      this.service_version,
      this.title,
      this.url});


  AstronomyPicOfDay toAstronomyPicOfDay() {
    return AstronomyPicOfDay(
      date: date,
      explanation: explanation,
      hdurl: hdurl,
      media_type: media_type,
      service_version: service_version,
      title: title,
      url: url
    );
  }


}
