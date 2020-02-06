import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

Future<PhotosList> fetchPost() async {
  final response = await http.get(
      "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=X6nQ9eeh5FV6j3TIfiXx5Zcg83ZldtJed1JpGEcW");

  if (response.statusCode == 200) {
//    List<MarsRoverPhotosModel> list = json.decode(response.body);

    return PhotosList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class MarsRoverPhotos extends StatefulWidget {
  @override
  _MarsRoverPhotosState createState() => _MarsRoverPhotosState();
}

class _MarsRoverPhotosState extends State<MarsRoverPhotos> {
  Future<PhotosList> getRoverPhotos;

  @override
  void initState() {
    super.initState();
    getRoverPhotos = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<PhotosList>(
        future: getRoverPhotos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                Image.network(snapshot.data.photos[0].img_src)
              ],
            );
          } else {
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.black,
                size: 80.0,
              ),
            );
//            return Text("No Rover Photos Today");
          }
        },
      ),
    );
  }
}

List<MarsRoverPhotosModel> mrpFromJson(String str) =>
    List<MarsRoverPhotosModel>.from(
        json.decode(str).map((x) => MarsRoverPhotosModel.fromJson(x)));

String mrpToJson(List<MarsRoverPhotosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarsRoverPhotosModel {
  int id;
  String img_src;
  String earth_date;

  MarsRoverPhotosModel({this.id, this.img_src, this.earth_date});

  factory MarsRoverPhotosModel.fromJson(Map<String, dynamic> json) =>
      MarsRoverPhotosModel(
          id: json["id"],
          img_src: json["img_src"],
          earth_date: json["earth_date"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "img_src": img_src,
        "earth_date": earth_date
      };
}

class PhotosList {
  final List<MarsRoverPhotosModel> photos;

  PhotosList({
    this.photos
});

  factory PhotosList.fromJson(List<dynamic> parsedJson) {
    List<MarsRoverPhotosModel> photos = new List<MarsRoverPhotosModel>();

    return new PhotosList(
      photos: photos
    );
  }
}
