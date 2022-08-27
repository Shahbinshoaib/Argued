import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/screens/group/groupScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class OpinionContainer extends StatefulWidget {
  final String catergoryName;
  final String subCatName;
  final String country;
  final String language;
  final DateTime createdAt;
  final String videoUrl;
  final String videoName;
  final String views;
  final String rating;
  final String thumbnail;
  final String createdBy;

  OpinionContainer({
    this.catergoryName = "",
    this.views = '',
    this.subCatName = '',
    this.country = '',
    this.language = '',
    this.createdAt,
    this.rating = '',
    this.videoUrl = '',
    this.videoName = '',
    this.thumbnail = kTempImage,
    this.createdBy,
  });
  @override
  _OpinionContainerState createState() => _OpinionContainerState();
}

class _OpinionContainerState extends State<OpinionContainer> {
  ChewieController _chewieController;
  bool showVideo = false;
  bool playing = true;
  @override
  void initState() {
    super.initState();
  }

  startVideo() {
    _chewieController = ChewieController(
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.portraitDown,
        ],
        videoPlayerController: VideoPlayerController.network(widget.videoUrl,
            videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true)),
        // aspectRatio: 2.1 / 2.7,
        aspectRatio: 16 / 9,
        showControlsOnInitialize: false,
        // fullScreenByDefault: true,
        showControls: false,
        allowFullScreen: true,
        autoInitialize: true,
        autoPlay: true,
        looping: false,
        errorBuilder: (context, errorMsg) {
          return Center(
              child: Icon(
            Icons.error,
            color: primaryTextColor,
            size: 30,
          ));
        });
    return _chewieController;
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    _chewieController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String m = getMonth(widget.createdAt != null
        ? widget.createdAt.month
        : DateTime.now().month);

    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, kSingleOpinionScreen,
                      arguments:
                          "${widget.videoName},${widget.videoUrl},${widget.createdBy}");
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 190,
                            width: SizeConfig.screenWidth * .35,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.thumbnail,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Center(child: Icon(Icons.error)),
                            ),
                            // child: CircleAvatar(
                            //     radius: 20,
                            //     backgroundColor: Colors.white,
                            //     child: Center(
                            //         child: Icon(
                            //       Icons.play_arrow_sharp,
                            //       size: 20,
                            //       color: primaryTextColor,
                            //     ))),
                          ),
                        ],
                      ),
                    ]),
              )),
          SizedBox(
            width: 4,
          ),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        widget.videoName,
                        style: listTileTitleText,
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        "${widget.country} , ${widget.language}",
                        style: listTileSubTitleText.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    widget.createdAt != null
                        ? "Posted: $m ${widget.createdAt.day}, ${widget.createdAt.year}"
                        : "Posted: $m ${DateTime.now().day}, ${DateTime.now().year}",
                    style: listTileSubTitleText,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(
                          widget.catergoryName,
                          style: chipText,
                        ),
                        backgroundColor: primaryColor.withOpacity(0.2),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          label: Text(
                            widget.subCatName,
                            style: chipText,
                          ),
                          backgroundColor: primaryColor.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Text(
                              widget.views,
                              style: listTileTitleText,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "${widget.rating.split('.')[0]}%",
                                  style: listTileTitleText),
                              TextSpan(
                                  text: ' Avg Rating',
                                  style: listTileTitleText.copyWith(
                                      color: Colors.red)),
                            ])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
