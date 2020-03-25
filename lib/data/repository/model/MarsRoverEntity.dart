import 'package:space_nasa/data/datasources/remote/model/marsrover/mars_rover_photo_remote_entity.dart';
import 'package:space_nasa/domain/model/mars_rover_model.dart';

//class MarsRoverEntity {
//  String img_src;
//  String earth_date;
//
//  MarsRoverEntity({this.img_src, this.earth_date});
//
//  MarsRover toMarsRover() {
//    return MarsRover(img_src: img_src, earth_date: earth_date);
//  }
//}

class MarsRoverEntity {
  List<MarsRoverPhotoRemoteEntity> photos;

  MarsRoverEntity({this.photos});

  MarsRover toMarsRover() {
    return MarsRover(photos: photos);
  }
}
