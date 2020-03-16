import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:space_nasa/domain/model/astronomy_pic_of_day_model.dart'
    as AstronomyPicOfDayModel;
import 'package:space_nasa/injection/injection.dart';
import 'package:space_nasa/presentation/astronomypicofday/astronomy_pic_day_presenter.dart';

class AstronomyPicOfDayScreen extends StatefulWidget {
//  AstronomyPicOfDayScreen();

  @override
  _AstronomyPicOfDayScreenState createState() =>
      _AstronomyPicOfDayScreenState();
}

class _AstronomyPicOfDayScreenState extends State<AstronomyPicOfDayScreen>
    implements AstronomyPicOfDayViewTranslator {
  AstronomyPicOfDayPresenter _presenter;
  AstronomyPicOfDayModel.AstronomyPicOfDay _picOfDayModel;

  _AstronomyPicOfDayScreenState() {
    _presenter = AstronomyPicOfDayPresenter(
        this, Injection.providesGetPicOfDayUseCase());
  }

  @override
  void initState() {
    super.initState();
    _presenter.onScreenInit(_picOfDayModel);
  }

  @override
  Widget build(BuildContext context) {
    if (_picOfDayModel != null) {
      return Center(
        child: ListView(
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    _picOfDayModel.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                ),
              ],
            ),
            Padding(
              child: Text(
                _picOfDayModel.explanation,
                textAlign: TextAlign.justify,
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Image.network(_picOfDayModel.url)
          ],
        ),
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
  showPicOfDay(AstronomyPicOfDayModel.AstronomyPicOfDay astronomyPicOfDay) {
    setState(() {
      _picOfDayModel = astronomyPicOfDay;
    });
  }
}
