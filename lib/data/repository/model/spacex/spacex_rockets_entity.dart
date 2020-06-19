import 'package:space_nasa/data/repository/model/spacex/spacex_links_entity.dart';
import 'package:space_nasa/domain/model/spacex/spacex_link.dart';
import 'package:space_nasa/domain/model/spacex/spacex_rockets_model.dart';

class SpaceXRocketEntity {
  String rocketId;
  String rocketName;
  String rocketType;
  bool launchSuccess;
//  LaunchFailureDetailsRemoteEntity launchFailureDetailsRemoteEntity;
  String details;

  SpaceXRocketEntity(
      {this.rocketId,
      this.rocketName,
      this.rocketType,
      this.launchSuccess,
//    this.launchFailureDetailsRemoteEntity,
      this.details});

  SpaceXRocket toSpaceXRocket() {
    return SpaceXRocket(
      rocketId: this.rocketId,
      rocketName: this.rocketName,
      rocketType: this.rocketType,
      launchSuccess: this.launchSuccess,
      details: this.details
    );
  }
}
