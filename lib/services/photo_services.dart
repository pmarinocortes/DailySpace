import 'dart:convert';
import 'package:flutter/services.dart';
import '../presentation/marsrover/mars_rover_photos.dart';

Future<String> _loadPhotoAsset() async {
  return await rootBundle.loadString('assets/photo.json');
}

Future loadPhotos() async {
  String jsonPhotos = await _loadPhotoAsset();
  final jsonResponse = json.decode(jsonPhotos);
  PhotosList photosList = PhotosList.fromJson(jsonResponse);
  print("photos " + photosList.photos[0].img_src);
}