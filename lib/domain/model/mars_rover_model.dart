//class MarsRover {
//  String img_src;
//  String earth_date;
//
//  MarsRover({
//    this.img_src,
//    this.earth_date
//});
//}

import 'package:space_nasa/data/datasources/remote/model/marsrover/mars_rover_photo_entity.dart';

class MarsRover {
  List<MarsRoverPhotoEntity> photos;

  MarsRover({
    this.photos
  });
}