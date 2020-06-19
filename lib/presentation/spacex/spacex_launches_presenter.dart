import 'package:space_nasa/domain/interactor/get_spacex_launches_use_case.dart';
import 'package:space_nasa/domain/model/spacex/spacex_launches_model.dart';

class SpaceXLaunchesPresenter {
  GetSpaceXLaunchesUseCase _getSpaceXLaunchesUseCase;
  SpacesXLaunchesViewTranslator _view;

  SpaceXLaunchesPresenter(this._view, this._getSpaceXLaunchesUseCase);

  void onScreenInit(List<SpaceXLaunches> spaceXLaunches) async {
    spaceXLaunches = await _getSpaceXLaunchesUseCase.run();
    _view.showSpaceXLaunches(spaceXLaunches);
  }
}

abstract class SpacesXLaunchesViewTranslator {
  showSpaceXLaunches(List<SpaceXLaunches> spaceXLaunches);
}
