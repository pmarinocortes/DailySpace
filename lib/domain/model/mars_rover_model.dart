//class MarsRover {
//  String img_src;
//  String earth_date;
//
//  MarsRover({
//    this.img_src,
//    this.earth_date
//});
//}

import 'package:space_nasa/data/datasources/remote/model/marsrover/mars_rover_photo_remote_entity.dart';

class MarsRover {
  List<MarsRoverPhotoRemoteEntity> photos;

  MarsRover({
    this.photos
  });
}