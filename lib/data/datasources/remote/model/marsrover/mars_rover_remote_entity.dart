import 'dart:convert';

import 'package:space_nasa/data/datasources/remote/model/marsrover/mars_rover_photo_remote_entity.dart';

//List<MarsRoverRemoteEntity> marsRoverFromJson(String str) =>
//    List<MarsRoverRemoteEntity>.from(
//        json.decode(str).map((x) => MarsRoverRemoteEntity.fromJson(x)));

//String marsRoverToJson(List<MarsRoverRemoteEntity> data) =>
//    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarsRoverRemoteEntity {
  List<MarsRoverPhotoRemoteEntity> photos;

  MarsRoverRemoteEntity({this.photos});

  Map<String, dynamic> toJson() => {"photos": photos};

  MarsRoverRemoteEntity.fromJson(Map<String, dynamic> json) {
    if (json['photos'] != null) {
      photos = new List<MarsRoverPhotoRemoteEntity>();
      json['photos'].forEach((v) {
        photos.add(new MarsRoverPhotoRemoteEntity.fromJson(v));
      });
    }
  }
}
