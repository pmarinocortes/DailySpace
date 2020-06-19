import 'package:space_nasa/domain/model/spacex/spacex_link.dart';
import 'package:space_nasa/domain/model/spacex/spacex_rockets_model.dart';

class SpaceXLaunches {
  int flightNumber;
  String missionName;
  String launchYear;
  SpaceXRocket spaceXRocket;
  SpaceXLink spaceXLink;
  String details;

  SpaceXLaunches(
      {this.flightNumber,
      this.missionName,
      this.launchYear,
      this.spaceXRocket,
      this.spaceXLink,
      this.details});
}
