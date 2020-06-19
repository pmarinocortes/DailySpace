import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:space_nasa/domain/model/spacex/spacex_launches_model.dart'
as SpaceXLaunchesModel;
import 'package:space_nasa/presentation/helper/fetch_preview_article.dart';
import 'package:space_nasa/presentation/helper/fetch_preview_wikipedia.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SpaceXLaunchesDetailsScreen extends StatefulWidget {
  final SpaceXLaunchesModel.SpaceXLaunches spaceXLaunchesModel;
  var articleData;
  var wikiData;

  SpaceXLaunchesDetailsScreen({Key key, @required this.spaceXLaunchesModel})
      : super(key: key);

  @override
  _SpaceXLaunchesDetailsScreenState createState() =>
      _SpaceXLaunchesDetailsScreenState();
}

class _SpaceXLaunchesDetailsScreenState
    extends State<SpaceXLaunchesDetailsScreen> {
  @override
  void initState() {
    FetchPreviewArticle()
        .fetch(widget.spaceXLaunchesModel.spaceXLink.articleLink)
        .then((res) {
      setState(() {
        widget.articleData = res;
      });
    });
    FetchPreviewWikipedia()
        .fetch(widget.spaceXLaunchesModel.spaceXLink.wikipedia)
        .then((res) {
      setState(() {
        widget.wikiData = res;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    FetchPreviewArticle()
//        .fetch(widget.spaceXLaunchesModel.spaceXLink.articleLink)
//        .then((res) {
//      setState(() {
//        widget.articleData = res;
//      });
//    });
//    FetchPreviewWikipedia()
//        .fetch(widget.spaceXLaunchesModel.spaceXLink.wikipedia)
//        .then((res) {
//      setState(() {
//        widget.wikiData = res;
//      });
//    });
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.spaceXLaunchesModel.missionName),
        ),
        body: Center(
          child: ListView(children: <Widget>[
          Padding(
          padding: EdgeInsets.only(left: 10.0, top: 5.0),
          child: Text(
            "Rocket: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(widget.spaceXLaunchesModel.spaceXRocket.rocketName),
        ),
        Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Details: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )),
        Padding(
            padding: EdgeInsets.only(left: 10.0, top: 5.0),
            child: Text(widget.spaceXLaunchesModel.details != null
                ? widget.spaceXLaunchesModel.details
                : "")),
        Padding(
          padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
          child: Card(elevation: 4.0, child: _buildArticlePreviewWidget()),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
          child: Card(elevation: 4.0, child: _buildWikipediaPreviewWidget()),
        ),
        showVideo()
        ])),
    );
  }

  _buildArticlePreviewWidget() {
    if (widget.articleData != null) {
      return Wrap(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            width: 100.0,
            height: 100.0,
            imageUrl: widget.articleData['image'] != null
                ? widget.articleData['image']
                : "",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.articleData['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(widget.spaceXLaunchesModel.spaceXLink.articleLink,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(
                    height: 4,
                  ),
                ])),
      ]);
    } else {
      return Center(
        child: SpinKitCubeGrid(
          color: Colors.black,
          size: 80.0,
        ),
      );
    }
  }

  _buildWikipediaPreviewWidget() {
    if (widget.wikiData != null) {
      return Wrap(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            width: 100.0,
            height: 100.0,
            imageUrl: widget.wikiData['image'] != null
                ? widget.wikiData['image']
                : "",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.wikiData['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(widget.spaceXLaunchesModel.spaceXLink.wikipedia,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(
                    height: 4,
                  ),
                ])),
      ]);
    } else {
      return Center(
        child: SpinKitCubeGrid(
          color: Colors.black,
          size: 80.0,
        ),
      );
    }
  }

  Widget showVideo() {
    String videoId = YoutubePlayer.convertUrlToId(
        widget.spaceXLaunchesModel.spaceXLink.videoLink);
    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: true
        )
    );
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
//  Widget showMedia() {
//    if (_picOfDayModel.media_type == "video") {
//      String videoId = YoutubePlayer.convertUrlToId(_picOfDayModel.url);
//      YoutubePlayerController _controller = YoutubePlayerController(
//        initialVideoId: videoId,
//        flags: YoutubePlayerFlags(
//          autoPlay: true,
//          mute: true,
//        ),
//      );
//      return YoutubePlayer(
//        controller: _controller,
//        showVideoProgressIndicator: true,
//      );
//    } else {
//      return Image.network(_picOfDayModel.url);
//    }
//  }
}
