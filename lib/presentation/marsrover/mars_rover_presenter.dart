import 'package:space_nasa/domain/interactor/get_mars_rover_photo_use_case.dart';
import 'package:space_nasa/domain/model/mars_rover_model.dart';

class MarsRoverPresenter {
  GetMarsRoverPhotoUseCase _getMarsRoverPhotoUseCase;
  MarsRoverViewTranslator _view;

  MarsRoverPresenter(this._view, this._getMarsRoverPhotoUseCase);

  void onScreenInit(MarsRover marsRover) async {
    marsRover = await _getMarsRoverPhotoUseCase.run();
    _view.showMarsRoverPhoto(marsRover);
  }
}

abstract class MarsRoverViewTranslator {
  showMarsRoverPhoto(MarsRover marsRover);
}
