import 'dart:convert';

import 'package:space_nasa/data/datasources/local/model/marsrover/mars_rover_photo_local_entity.dart';
import 'package:space_nasa/data/repository/model/mars_rover_photo_entity.dart';

List<MarsRoverPhotoRemoteEntity> marsRoverFromJson(String str) =>
    List<MarsRoverPhotoRemoteEntity>.from(
        json.decode(str).map((x) => MarsRoverPhotoRemoteEntity.fromJson(x)));

//String marsRoverToJson(List<MarsRoverPhotoRemoteEntity> data) =>
//    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarsRoverPhotoRemoteEntity {
  String img_src;
  String earth_date;

  MarsRoverPhotoRemoteEntity({this.img_src, this.earth_date});

  MarsRoverPhotoRemoteEntity.fromJson(Map<String, dynamic> json) {
    img_src = json["img_src"];
    earth_date = json["earth_date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["img_src"] = this.img_src;
    data["earth_date"] = this.earth_date;
    return data;
  }

  MarsRoverPhotoEntity toMarsRoverPhoto() {
    return MarsRoverPhotoEntity(
        img_src: this.img_src, earth_date: this.earth_date);
  }

  MarsRoverPhotoLocalEntity toMarsRoverPhotoLocalEntity() {
    return MarsRoverPhotoLocalEntity(
        img_src: this.img_src, earth_date: this.earth_date);
  }
}
