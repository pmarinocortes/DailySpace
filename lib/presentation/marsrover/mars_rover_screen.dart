import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:space_nasa/domain/model/mars_rover_photo_model.dart';
import 'package:space_nasa/domain/model/mars_rover_photo_model.dart'
    as MarsRoverPhotoModel;
import 'package:space_nasa/injection/injection.dart';
import 'package:space_nasa/presentation/marsrover/mars_rover_presenter.dart';

class MarsRoverScreen extends StatefulWidget {
//  MarsRoverScreen();
  @override
  _MarsRoverScreenState createState() => _MarsRoverScreenState();
}

class _MarsRoverScreenState extends State<MarsRoverScreen>
    implements MarsRoverViewTranslator {
  MarsRoverPresenter _presenter;
  List<MarsRoverPhotoModel.MarsRoverPhoto> _marsRoverModel;

  _MarsRoverScreenState() {
    _presenter =
        MarsRoverPresenter(this, Injection.providesGetMarsRoverPhotoUseCase());
  }

  @override
  void initState() {
    super.initState();
    _presenter.onScreenInit(_marsRoverModel);
  }

  @override
  Widget build(BuildContext context) {
    if (_marsRoverModel != null) {
      return Center(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: _marsRoverModel.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.all(10.0),
//                      child: Text(
//                        "Mars Rover Photos: " +
//                            _marsRoverModel[index].earth_date,
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold, fontSize: 16.0),
//                      ),
//                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CachedNetworkImage(
                        imageUrl: _marsRoverModel[index].img_src,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
//                      Image.network(
//                        _marsRoverModel[index].img_src,
//                      ),
                    ),
                  ],
                ),
              );
//                Wrap(
//                alignment: WrapAlignment.center,
//                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.all(10.0),
//                    child: Text(
//                      "Mars Rover Photos: " +
//                          _marsRoverModel[index].earth_date,
//                      style: TextStyle(
//                          fontWeight: FontWeight.bold, fontSize: 16.0),
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.all(10.0),
//                    child: Image.network(
//                      _marsRoverModel[index].img_src,
//                    ),
//                  ),
//                ],
//              );
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
  showMarsRoverPhoto(List<MarsRoverPhoto> marsRoverPhotos) {
    setState(() {
      _marsRoverModel = marsRoverPhotos;
    });
  }
}
