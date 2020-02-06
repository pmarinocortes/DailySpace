import 'package:shared_preferences/shared_preferences.dart';

class AstronomyPicOfDayPreferences {
  Future<bool> savePicOfDay(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("url", value);
  }

  Future<String> getPicOfDay() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("url");
  }

  Future<bool> saveTitle(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("title", value);
  }

  Future<String> getTitle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("title");
  }

  Future<bool> saveExplanation(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("explanation", value);
  }

  Future<String> getExplanation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("explanation");
  }
}
