import 'package:space_nasa/data/repository/model/astronomy_pic_of_day_entity.dart';

class AstronomyPicOfDayLocalEntity {
  String date;
  String explanation;
  String hdurl;
  String media_type;
  String service_version;
  String title;
  String url;

  AstronomyPicOfDayLocalEntity(
      {this.date,
      this.explanation,
      this.hdurl,
      this.media_type,
      this.service_version,
      this.title,
      this.url});

  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "explanation": explanation,
      "hdurl": hdurl,
      "media_type": media_type,
      "service_version": service_version,
      "title": title,
      "url": url
    };
  }

  AstronomyPicOfDayLocalEntity.fromMap(Map<String, dynamic> map) {
    date = map["date"];
    explanation = map["explanation"];
    hdurl = map["hdurl"];
    media_type = map["media_type"];
    service_version = map["service_version"];
    title = map["title"];
    url = map["url"];
  }

  AstronomyPicOfDayEntity toAstronomyPicOfDayEntity() {
    return AstronomyPicOfDayEntity(
        date: this.date,
        explanation: this.explanation,
        hdurl: this.hdurl,
        media_type: this.media_type,
        service_version: this.service_version,
        title: this.title,
        url: this.url);
  }
}
