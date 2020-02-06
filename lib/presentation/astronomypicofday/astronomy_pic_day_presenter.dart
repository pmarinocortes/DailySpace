import 'package:space_nasa/domain/interactor/get_astronomy_pic_of_day_use_case.dart';
import 'package:space_nasa/domain/model/astronomy_pic_of_day_model.dart';

class AstronomyPicOfDayPresenter {
  GetAstronomyPicOfDayUseCase _getAstronomyPicOfDayUseCase;
  AstronomyPicOfDayViewTranslator _view;

  AstronomyPicOfDayPresenter(this._view, this._getAstronomyPicOfDayUseCase);

  void onScreenInit(AstronomyPicOfDay picOfDay) async {
    picOfDay = await _getAstronomyPicOfDayUseCase.run();
    _view.showPicOfDay(picOfDay);
  }
}

abstract class AstronomyPicOfDayViewTranslator {
  showPicOfDay(AstronomyPicOfDay astronomyPicOfDay);
}
