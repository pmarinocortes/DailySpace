import 'package:space_nasa/data/datasources/local/model/marsrover/mars_rover_photo_local_entity.dart';
import 'package:space_nasa/domain/model/mars_rover_photo_model.dart';

class MarsRoverPhotoEntity {
  String img_src;
  String earth_date;

  MarsRoverPhotoEntity({this.img_src, this.earth_date});

  MarsRoverPhoto toMarsRoverPhoto() {
    return MarsRoverPhoto(img_src: img_src, earth_date: earth_date);
  }

  MarsRoverPhotoLocalEntity toMarsRoverPhotoLocalEntity() {
    return MarsRoverPhotoLocalEntity(
        img_src: this.img_src, earth_date: this.earth_date);
  }
}