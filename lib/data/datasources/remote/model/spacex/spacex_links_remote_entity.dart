import 'dart:convert';

import 'package:space_nasa/data/repository/model/spacex/spacex_links_entity.dart';

List<SpaceXLinksRemoteEntity> spaceXRocketFromJson(String str) =>
    List<SpaceXLinksRemoteEntity>.from(
        json.decode(str).map((x) => SpaceXLinksRemoteEntity.fromJson(x)));

String spaceXRocketToJson(List<SpaceXLinksRemoteEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpaceXLinksRemoteEntity {
  String missionPatch;
  String articleLink;
  String videoLink;
  String wikipedia;
//  List<String> flickrImages;

  SpaceXLinksRemoteEntity(
      {this.missionPatch, this.articleLink, this.videoLink, this.wikipedia});

  SpaceXLinksRemoteEntity.fromJson(Map<String, dynamic> json) {
    missionPatch = json["mission_patch"] ?? "";
    articleLink = json["article_link"] ?? "";
    videoLink = json["video_link"] ?? "";
    wikipedia = json["wikipedia"] ?? "";
//    if(json["flickr_images"] != null) {
//      flickrImages = new List<String>();
//      json["flickr_images"].forEach((v) {
//        flickrImages.add(new .fromJson(v));
//      });
//    }
//    flickrImages = json["flickr_images"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["mission_patch"] = missionPatch;
    data["article_link"] = articleLink;
    data["video_link"] = videoLink;
    data["wikipedia"] = wikipedia;
//    data["flickr_images"] = flickrImages;
    return data;
  }

  SpaceXLinksEntity toSpaceXRocketLinksEntity() {
    return SpaceXLinksEntity(
      missionPatch: this.missionPatch,
      articleLink: this.articleLink,
      videoLink: this.videoLink,
      wikipedia: this.wikipedia
    );
  }
}
