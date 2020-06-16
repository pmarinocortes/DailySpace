import 'dart:convert';

List<SpaceXRocketLinks> spaceXRocketFromJson(String str) =>
    List<SpaceXRocketLinks>.from(
        json.decode(str).map((x) => SpaceXRocketLinks.fromJson(x)));

String spaceXRocketToJson(List<SpaceXRocketLinks> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpaceXRocketLinks {
  String missionPatch;
  String articleLink;
  String videoLink;
//  List<String> flickrImages;

  SpaceXRocketLinks(
      {this.missionPatch, this.articleLink, this.videoLink});

  SpaceXRocketLinks.fromJson(Map<String, dynamic> json) {
    missionPatch = json["mission_patch"] ?? "";
    articleLink = json["article_link"] ?? "";
    videoLink = json["video_link"] ?? "";
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
//    data["flickr_images"] = flickrImages;
    return data;
  }
}
