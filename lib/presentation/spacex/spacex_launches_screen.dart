import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:space_nasa/domain/model/spacex/spacex_launches_model.dart';
import 'package:space_nasa/domain/model/spacex/spacex_launches_model.dart'
    as SpaceXLaunchesModel;
import 'package:space_nasa/injection/injection.dart';
import 'package:space_nasa/presentation/spacex/spacex_launches_details_screen.dart';
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
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl:
                              _spaceXLaunchesModel[index].spaceXLink != null
                                  ? _spaceXLaunchesModel[index]
                                      .spaceXLink
                                      .missionPatch
                                  : "",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        title: Text(
                          _spaceXLaunchesModel[index].missionName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        trailing: Text(_spaceXLaunchesModel[index].launchYear,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                        subtitle: Text(
                            _spaceXLaunchesModel[index].details != null
                                ? _spaceXLaunchesModel[index].details
                                : ""),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SpaceXLaunchesDetailsScreen(
                                          spaceXLaunchesModel: _spaceXLaunchesModel != null ? _spaceXLaunchesModel[index] : null)));
                        },
                      ),
                    ),
                  ),
//                  Opacity(
//                    opacity: 0.0,
//                    child: _buildPreviewWidget(index),
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
}
