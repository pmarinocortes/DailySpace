import 'dart:convert';

import 'package:space_nasa/data/datasources/local/model/astronomy_pic_of_day_local_entity.dart';
import 'package:space_nasa/data/repository/model/astronomy_pic_of_day_entity.dart';

List<AstronomyPicOfDayRemoteEntity> astronomyPicOfDayFromJson(String str) =>
    List<AstronomyPicOfDayRemoteEntity>.from(
        json.decode(str).map((x) => AstronomyPicOfDayRemoteEntity.fromJson(x)));

String astronomyPicOfDayToJson(List<AstronomyPicOfDayRemoteEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AstronomyPicOfDayRemoteEntity {
  String date;
  String explanation;
  String hdurl;
  String media_type;
  String service_version;
  String title;
  String url;

//  factory AstronomyPicOfDayRemoteEntity(Map json) {
//    return AstronomyPicOfDayRemoteEntity.deserialize(json);
//  }
//
//  AstronomyPicOfDayRemoteEntity.deserialize(Map json)
//      : date = json["date"],
//        explanation = json["explanation"],
//        hdurl = json["hdurl"],
//        media_type = json["media_type"],
//        service_version = json["service_version"],
//        title = json["title"],
//        url = json["url"];
//
//  AstronomyPicOfDayEntity toAstronomyPicOfDayEntity() {
//    return AstronomyPicOfDayEntity(
//        date: this.date,
//        explanation: this.explanation,
//        hdurl: this.hdurl,
//        media_type: this.media_type,
//        service_version: this.service_version,
//        title: this.title,
//        url: this.url);
//  }
//
//  AstronomyPicOfDayLocalEntity toAstronomyPicOfDayLocalEntity() {
//    return AstronomyPicOfDayLocalEntity(
//        date: this.date,
//        explanation: this.explanation,
//        hdurl: this.hdurl,
//        media_type: this.media_type,
//        service_version: this.service_version,
//        title: this.title,
//        url: this.url);
//  }

  AstronomyPicOfDayRemoteEntity(
      {this.date,
      this.explanation,
      this.hdurl,
      this.media_type,
      this.service_version,
      this.title,
      this.url});

  factory AstronomyPicOfDayRemoteEntity.fromJson(Map<String, dynamic> json) =>
      AstronomyPicOfDayRemoteEntity(
          date: json["date"],
          explanation: json["explanation"],
          hdurl: json["hdurl"],
          media_type: json["media_type"],
          service_version: json["service_version"],
          title: json["title"],
          url: json["url"]);

  Map<String, dynamic> toJson() => {
        "date": date,
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": media_type,
        "service_version": service_version,
        "title": title,
        "url": url
      };
}
