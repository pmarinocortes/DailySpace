import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:space_nasa/domain/model/spacex_launches_model.dart';
import 'package:space_nasa/domain/model/spacex_launches_model.dart'
    as SpaceXLaunchesModel;
import 'package:space_nasa/injection/injection.dart';
import 'package:space_nasa/presentation/spacex/spacex_launches_presenter.dart';

class SpaceXLaunchesScreen extends StatefulWidget {
  @override
  _SpaceXLaunchesScreenState createState() => _SpaceXLaunchesScreenState();
}

class _SpaceXLaunchesScreenState extends State<SpaceXLaunchesScreen>
    implements SpacesXLaunchesViewTranslator {
  SpaceXLaunchesPresenter _presenter;
  List<SpaceXLaunchesModel.SpaceXLaunches> _spaceXLaunchesModel;

  _SpaceXLaunchesScreenState() {
    _presenter = SpaceXLaunchesPresenter(
        this, Injection.providesGetSpaceXLaunchesUseCase());
  }

  @override
  void initState() {
    super.initState();
    _presenter.onScreenInit(_spaceXLaunchesModel);
  }

  @override
  Widget build(BuildContext context) {
    if (_spaceXLaunchesModel != null) {
      return Center(
        child: ListView.builder(
            itemCount: _spaceXLaunchesModel.length,
            itemBuilder: (context, index) {
              return Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.all(10.0),
//                    child: CachedNetworkImage(
//                      imageUrl: _spaceXLaunchesModel[index]
//                          .spaceXRocketRemoteEntity
//                          .spaceXRocketLinks
//                          .missionPatch,
//                      progressIndicatorBuilder:
//                          (context, url, downloadProgress) =>
//                              CircularProgressIndicator(
//                                  value: downloadProgress.progress),
//                      errorWidget: (context, url, error) => Icon(Icons.error),
//                    ),
////                    Image.network(_spaceXLaunchesModel[index].spaceXRocketRemoteEntity.spaceXRocketLinks.missionPatch)
//                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _spaceXLaunchesModel[index].missionName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(_spaceXLaunchesModel[index].launchYear,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Rocket: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_spaceXLaunchesModel[index]
                            .spaceXRocketRemoteEntity
                            .rocketName),
                      ],
                    ),
                  ),
//                  Padding(
//                    padding: EdgeInsets.all(10.0),
//                    child: Row(
//                      children: <Widget>[
//                        Text(
//                          "Details: ",
//                          style: TextStyle(fontWeight: FontWeight.bold),
//                        ),
//                        Text(_spaceXLaunchesModel[index]
//                            .spaceXRocketRemoteEntity
//                            .details),
//                      ],
//                    ),
//                  )
                ],
              );
            }),
      );
    } else {
      return Center(
        child: SpinKitCubeGrid(
          color: Colors.black,
          size: 80.0,
        ),
      );
    }
  }

  @override
  showSpaceXLaunches(List<SpaceXLaunches> spaceXLaunches) {
    setState(() {
      _spaceXLaunchesModel = spaceXLaunches;
    });
  }

//  Widget getImage(int index) {
//  if(_spaceXLaunchesModel[index]
//      .spaceXRocketRemoteEntity
//      .spaceXRocketLinks
//      .missionPatch != null){
//  return Padding(
//  padding: EdgeInsets.all(10.0),
//  child: CachedNetworkImage(
//  imageUrl: _spaceXLaunchesModel[index]
//      .spaceXRocketRemoteEntity
//      .spaceXRocketLinks
//      .missionPatch,
//  progressIndicatorBuilder:
//  (context, url, downloadProgress) =>
//  CircularProgressIndicator(
//  value: downloadProgress.progress),
//  errorWidget: (context, url, error) => Icon(Icons.error),
//  ),
////                    Image.network(_spaceXLaunchesModel[index].spaceXRocketRemoteEntity.spaceXRocketLinks.missionPatch)
//  );
//  } else {
//    return Padding(
//        padding: EdgeInsets.all(10.0),
//    child: Image.network("https://images2.imgbox.com/4d/ed/CHXoRaSP_o.png"),);
//
//  }
//}
}
