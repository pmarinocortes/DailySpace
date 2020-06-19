import 'package:space_nasa/domain/model/spacex/spacex_link.dart';

class SpaceXLinksEntity {
  String missionPatch;
  String articleLink;
  String videoLink;
  String wikipedia;

//  List<String> flickrImages;

  SpaceXLinksEntity(
      {this.missionPatch, this.articleLink, this.videoLink, this.wikipedia});

  SpaceXLink toSpaceXRocketLink() {
    return SpaceXLink(
      missionPatch: this.missionPatch,
      articleLink: this.articleLink,
      videoLink: this.videoLink,
      wikipedia: this.wikipedia
    );
  }

}