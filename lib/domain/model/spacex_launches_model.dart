import 'package:space_nasa/data/datasources/remote/model/spacex/spacex_rocket_remote_entity.dart';

class SpaceXLaunches {
  int flightNumber;
  String missionName;
  String launchYear;
  SpaceXRocketRemoteEntity spaceXRocketRemoteEntity;

  SpaceXLaunches(
      {this.flightNumber,
      this.missionName,
      this.launchYear,
      this.spaceXRocketRemoteEntity});
}
