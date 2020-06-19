import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_links_remote_entity.dart';
import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_rocket_remote_entity.dart';
import 'package:space_nasa/data/repository/model/spacex/spacex_launches_entity.dart';

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
  SpaceXLinksRemoteEntity spaceXLinksRemoteEntity;
  String details;

  SpaceXLaunchesRemoteEntity(
      {this.flightNumber,
      this.missionName,
      this.launchYear,
      this.spaceXRocketRemoteEntity,
      this.spaceXLinksRemoteEntity,
      this.details});

  factory SpaceXLaunchesRemoteEntity.fromJson(Map<String, dynamic> json) =>
      SpaceXLaunchesRemoteEntity(
          flightNumber: json["flight_number"],
          missionName: json["mission_name"],
          launchYear: json["launch_year"],
          spaceXRocketRemoteEntity: json['rocket'] != null ? new SpaceXRocketRemoteEntity.fromJson(json['rocket']) : null,
          spaceXLinksRemoteEntity: json["links"] != null ? new SpaceXLinksRemoteEntity.fromJson(json["links"]) : null,
          details: json["details"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["flight_number"] = this.flightNumber;
    data["mission_name"] = missionName;
    data["launch_year"] = launchYear;
    data["rocket"] = spaceXRocketRemoteEntity;
    data["links"] = this.spaceXLinksRemoteEntity;
    data["details"] = this.details;
    return data;
  }

  SpaceXLaunchesEntity toSpaceXLaunchesEntity() {
    return SpaceXLaunchesEntity(
        flightNumber: this.flightNumber,
        missionName: this.missionName,
        launchYear: this.launchYear,
        spaceXRocketEntity: this.spaceXRocketRemoteEntity.toSpaceXRocketEntity(),
        spaceXLinksEntity: this.spaceXLinksRemoteEntity.toSpaceXRocketLinksEntity(),
        details: this.details);
  }
}
