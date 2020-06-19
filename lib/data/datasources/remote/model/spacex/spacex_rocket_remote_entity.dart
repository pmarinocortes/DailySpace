import 'dart:convert';

import 'package:space_nasa/data/datasources/remote/model/spacex/launch_failure_details_remote_emtity.dart';
import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_links_remote_entity.dart';
import 'package:space_nasa/data/repository/model/spacex/spacex_rockets_entity.dart';

List<SpaceXRocketRemoteEntity> spaceXRocketFromJson(String str) =>
    List<SpaceXRocketRemoteEntity>.from(
        json.decode(str).map((x) => SpaceXRocketRemoteEntity.fromJson(x)));

String spaceXRocketToJson(List<SpaceXRocketRemoteEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpaceXRocketRemoteEntity {
  String rocketId;
  String rocketName;
  String rocketType;
  bool launchSuccess;
  LaunchFailureDetailsRemoteEntity launchFailureDetailsRemoteEntity;
  String details;

  SpaceXRocketRemoteEntity(
      {this.rocketId,
      this.rocketName,
      this.rocketType,
      this.launchSuccess,
      this.launchFailureDetailsRemoteEntity,
      this.details});

  SpaceXRocketRemoteEntity.fromJson(Map<String, dynamic> json) {
    rocketId = json["rocket_id"];
    rocketName = json["rocket_name"];
    rocketType = json["rocket_type"];
    launchSuccess = json["launch_success"];
    launchFailureDetailsRemoteEntity = json["launch_failure_details"];
    details = json["details"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["rocket_id"] = rocketId;
    data["rocket_name"] = rocketName;
    data["rocket_type"] = rocketType;
    data["launch_success"] = launchSuccess;
//    data["launch_failure_details"] = launchFailureDetailsRemoteEntity;
    data["details"] = details;
    return data;
  }

  SpaceXRocketEntity toSpaceXRocketEntity() {
    return SpaceXRocketEntity(
        rocketId: this.rocketId,
        rocketName: this.rocketName,
        rocketType: this.rocketType,
        launchSuccess: this.launchSuccess,
//        launchFailureDetailsRemoteEntity: this.launchFailureDetailsRemoteEntity,
        details: this.details);
  }
}
