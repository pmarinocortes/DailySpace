import 'package:space_nasa/data/repository/model/mars_rover_photo_entity.dart';

class MarsRoverPhotoLocalEntity {
  String img_src;
  String earth_date;

  MarsRoverPhotoLocalEntity({this.img_src, this.earth_date});

  MarsRoverPhotoEntity toMarsRoverPhotoEntity() {
    return MarsRoverPhotoEntity(
        img_src: this.img_src, earth_date: this.earth_date);
  }

  Map<String, dynamic> toMap() {
    return {'img_src': img_src, 'earth_date': earth_date};
  }
}
