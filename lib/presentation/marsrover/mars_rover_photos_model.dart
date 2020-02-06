import 'dart:convert';

List<MarsRoverPhotosModels> mrpFromJson(String str) =>
    List<MarsRoverPhotosModels>.from(
        json.decode(str).map((x) => MarsRoverPhotosModels.fromJson(x)));

String mrpToJson(List<MarsRoverPhotosModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarsRoverPhotosModels {
  List photos;
  int id;
  String img_src;
  String earth_date;

  MarsRoverPhotosModels({this.photos,this.id, this.img_src, this.earth_date});

  factory MarsRoverPhotosModels.fromJson(Map<String, dynamic> json) =>
      MarsRoverPhotosModels(
        photos: json["photos"],
          id: json["id"],
          img_src: json["img_src"],
          earth_date: json["earth_date"]);

  Map<String, dynamic> toJson() =>
      {"photos": photos, "id": id, "img_src": img_src, "earth_date": earth_date};
}
