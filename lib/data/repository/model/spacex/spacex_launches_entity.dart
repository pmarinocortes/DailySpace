import 'package:space_nasa/data/repository/model/spacex/spacex_links_entity.dart';
import 'package:space_nasa/data/repository/model/spacex/spacex_rockets_entity.dart';
import 'package:space_nasa/domain/model/spacex/spacex_launches_model.dart';

class SpaceXLaunchesEntity {
  int flightNumber;
  String missionName;
  String launchYear;
  SpaceXRocketEntity spaceXRocketEntity;
  SpaceXLinksEntity spaceXLinksEntity;
  String details;

  SpaceXLaunchesEntity(
      {this.flightNumber,
      this.missionName,
      this.launchYear,
      this.spaceXRocketEntity,
      this.spaceXLinksEntity,
      this.details});

  SpaceXLaunches toSpacexLaunches() {
    return SpaceXLaunches(
        flightNumber: flightNumber,
        missionName: missionName,
        launchYear: launchYear,
        spaceXRocket: spaceXRocketEntity.toSpaceXRocket(),
        spaceXLink: spaceXLinksEntity.toSpaceXRocketLink(),
      details: this.details
    );
  }
}
