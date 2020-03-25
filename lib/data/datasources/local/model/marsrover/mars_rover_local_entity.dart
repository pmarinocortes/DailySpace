import 'mars_rover_photo_local_entity.dart';

class MarsRoverLocalEntity {
  List<MarsRoverPhotoLocalEntity> photos;

  MarsRoverLocalEntity({this.photos});

  Map<String, dynamic> toMap() {
    return {
      "photos": photos
    };
  }


}
