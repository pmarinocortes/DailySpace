import 'dart:convert';

import 'package:space_nasa/data/datasources/remote/model/spacex/launch_failure_details_remote_emtity.dart';
import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_rocket_links.dart';

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
  SpaceXRocketLinks spaceXRocketLinks;
  String details;

  SpaceXRocketRemoteEntity(
      {this.rocketId,
      this.rocketName,
      this.rocketType,
      this.launchSuccess,
      this.launchFailureDetailsRemoteEntity,
      this.spaceXRocketLinks,
      this.details});

  SpaceXRocketRemoteEntity.fromJson(Map<String, dynamic> json) {
    rocketId = json["rocket_id"];
    rocketName = json["rocket_name"];
    rocketType = json["rocket_type"];
    launchSuccess = json["launch_success"];
    launchFailureDetailsRemoteEntity = json["launch_failure_details"];
    spaceXRocketLinks = json['links'] != null
        ? new SpaceXRocketLinks.fromJson(json['links']): null;
    details = json["details"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["rocket_id"] = rocketId;
    data["rocket_name"] = rocketName;
    data["rocket_type"] = rocketType;
    data["launch_success"] = launchSuccess;
    data["launch_failure_details"] = launchFailureDetailsRemoteEntity;
    if (this.spaceXRocketLinks != null) {
      data['links'] = this.spaceXRocketLinks.toJson();
    }
    data["details"] = details;
    return data;
  }
}
