import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_links_remote_entity.dart';
import 'package:space_nasa/domain/model/spacex/spacex_link.dart';

class SpaceXRocket {
  String rocketId;
  String rocketName;
  String rocketType;
  bool launchSuccess;
//  LaunchFailureDetailsRemoteEntity launchFailureDetailsRemoteEntity;
  String details;

  SpaceXRocket({this.rocketId,
    this.rocketName,
    this.rocketType,
    this.launchSuccess,
//    this.launchFailureDetailsRemoteEntity,
    this.details});
}