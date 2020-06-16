import 'dart:convert';

import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_rocket_remote_entity.dart';
import 'package:space_nasa/data/repository/model/spacex_launches_entity.dart';

List<SpaceXLaunchesRemoteEntity> spaceXLaunchesFromJson(String str) =>
    List<SpaceXLaunchesRemoteEntity>.from(
        json.decode(str).map((x) => SpaceXLaunchesRemoteEntity.fromJson(x)));

String spaceXLaunchesToJson(List<SpaceXLaunchesRemoteEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpaceXLaunchesRemoteEntity {
  int flightNumber;
  String missionName;
  String launchYear;
  SpaceXRocketRemoteEntity spaceXRocketRemoteEntity;

  SpaceXLaunchesRemoteEntity(
      {this.flightNumber,
      this.missionName,
      this.launchYear,
      this.spaceXRocketRemoteEntity});

  factory SpaceXLaunchesRemoteEntity.fromJson(Map<String, dynamic> json) =>
      SpaceXLaunchesRemoteEntity(
          flightNumber: json["flight_number"],
          missionName: json["mission_name"],
          launchYear: json["launch_year"],
          spaceXRocketRemoteEntity: json['rocket'] != null ? new SpaceXRocketRemoteEntity.fromJson(json['rocket']) : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["flight_number"] = this.flightNumber;
    data["mission_name"] = missionName;
    data["launch_year"] = launchYear;
    data["rocket"] = spaceXRocketRemoteEntity;
    return data;
  }

  SpaceXLaunchesEntity toSpaceXLaunchesEntity() {
    return SpaceXLaunchesEntity(
        flightNumber: this.flightNumber,
        missionName: this.missionName,
        launchYear: this.launchYear,
        spaceXRocketRemoteEntity: this.spaceXRocketRemoteEntity);
  }
}
