import 'dart:convert';

import 'package:space_nasa/data/datasources/remote/model/marsrover/mars_rover_photo_entity.dart';

List<MarsRoverRemoteEntity> marsRoverFromJson(String str) =>
    List<MarsRoverRemoteEntity>.from(
        json.decode(str).map((x) => MarsRoverRemoteEntity.fromJson(x)));

String marsRoverToJson(List<MarsRoverRemoteEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarsRoverRemoteEntity {
  List<MarsRoverPhotoEntity> photos;

//  String img_src;
//  String earth_date;

//  MarsRoverRemoteEntity({this.img_src, this.earth_date});
  MarsRoverRemoteEntity({this.photos});

//  factory MarsRoverRemoteEntity.fromJson(Map<String, dynamic> json) =>
//      MarsRoverRemoteEntity(
////          img_src: json["img_src"], earth_date: json["earth_date"]
//          photos: json["photos"]);

  Map<String, dynamic> toJson() =>
//      {"img_src": img_src, "earth_date": earth_date};
      {"photos": photos};

  MarsRoverRemoteEntity.fromJson(Map<String, dynamic> json) {
    if(json['photos'] != null) {
      photos = new List<MarsRoverPhotoEntity>();
      json['photos'].forEach((v){
        photos.add(new MarsRoverPhotoEntity.fromJson(v));
      });
    }
  }
}




//class CreditsRemoteEntity {
//  int id;
//  List<CastRemoteEntity> cast;
//  List<CrewRemoteEntity> crew;
//
//  CreditsRemoteEntity({this.id, this.cast, this.crew});
//
//  CreditsRemoteEntity.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    if (json['cast'] != null) {
//      cast = new List<CastRemoteEntity>();
//      json['cast'].forEach((v) {
//        cast.add(new CastRemoteEntity.fromJson(v));
//      });
//    }
//    if (json['crew'] != null) {
//      crew = new List<CrewRemoteEntity>();
//      json['crew'].forEach((v) {
//        crew.add(new CrewRemoteEntity.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    if (this.cast != null) {
//      data['cast'] = this.cast.map((v) => v.toJson()).toList();
//    }
//    if (this.crew != null) {
//      data['crew'] = this.crew.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//
//  CreditsEntity toCreditsEntity() {
//    return CreditsEntity(
//      id: id,
//      cast: cast.map((data) => data.toCastEntity()).toList(),
//      crew: crew.map((data) => data.toCrewEntity()).toList(),
//    );
//  }
//}

