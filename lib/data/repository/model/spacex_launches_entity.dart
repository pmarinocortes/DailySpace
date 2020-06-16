import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_rocket_remote_entity.dart';
import 'package:space_nasa/domain/model/spacex_launches_model.dart';

class SpaceXLaunchesEntity {
  int flightNumber;
  String missionName;
  String launchYear;
  SpaceXRocketRemoteEntity spaceXRocketRemoteEntity;

  SpaceXLaunchesEntity(
      {this.flightNumber,
      this.missionName,
      this.launchYear,
      this.spaceXRocketRemoteEntity});

  SpaceXLaunches toSpacexLaunches() {
    return SpaceXLaunches(
        flightNumber: flightNumber,
        missionName: missionName,
        launchYear: launchYear,
        spaceXRocketRemoteEntity: spaceXRocketRemoteEntity);
  }
}
