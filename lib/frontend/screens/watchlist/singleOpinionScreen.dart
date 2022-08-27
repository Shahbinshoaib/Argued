import 'package:argued/ArguedConfigs/color.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class SingleOpinion extends StatefulWidget {
  final String videoUrl;
  final String videoName;
  final String hostId;

  const SingleOpinion({Key key, this.videoUrl, this.videoName, this.hostId})
      : super(key: key);
  @override
  _SingleOpinionState createState() => _SingleOpinionState();
}

class _SingleOpinionState extends State<SingleOpinion> {
  ChewieController _chewieController;
  bool showVideo = false;
  bool playing = true;
  @override
  void initState() {
    _chewieController = ChewieController(
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.portraitDown,
        ],
        videoPlayerController: VideoPlayerController.network(widget.videoUrl,
            videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true)),
        aspectRatio: 16 / 9,
        showControlsOnInitialize: true,
        showControls: true,
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
    super.initState();
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
    // var dashboardBloc = Provider.of<DashboardBloc>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top :12,
              left: 12,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
                // Card(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Expanded(
                //         child: GestureDetector(
                //           onTap: () {
                //             dashboardBloc.addhost(widget.hostId);
                //             MyAppDailog().appResponseDailog(
                //                 context, dashboardBloc.ratingResponse, 1);
                //           },
                //           child: Padding(
                //             padding: const EdgeInsets.all(12.0),
                //             child: Row(
                //               children: [
                //                 CircleAvatar(
                //                   radius: 15,
                //                   backgroundColor: Colors.grey.withOpacity(0.2),
                //                   child: Center(
                //                     child: Icon(
                //                       Icons.add,
                //                       color: primaryTextColor,
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   width: 6,
                //                 ),
                //                 Column(
                //                   children: [
                //                     Text(
                //                       'Add Host to',
                //                       style: listTileTrailingText,
                //                     ),
                //                     SizedBox(
                //                       height: 2,
                //                     ),
                //                     Text(
                //                       'Watch list',
                //                       style: listTileTrailingText,
                //                     ),
                //                   ],
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Padding(
                //           padding: const EdgeInsets.all(12.0),
                //           child: GestureDetector(
                //             onTap: () {
                //               // if (widget.alreadyRated) {
                //               //   MyAppDailog().responseDailog(
                //               //       'You Have already Rate it this Video', context,
                //               //       showClosebutton: true);
                //               // } else {
                //               //   MyAppDailog().ratingDailog(
                //               //       widget.rating,
                //               //       dashboardBloc,
                //               //       widget.topicName,
                //               //       widget.userName,
                //               //       context, () {
                //               //     dashboardBloc.postRating(
                //               //         widget.opinionID, widget.stand);
                //               //     MyAppDailog().appResponseDailog(
                //               //         context, dashboardBloc.ratingResponse, 2);
                //               //   });
                //               // }
                //             },
                //             child: Row(
                //               children: [
                //                 CircleAvatar(
                //                   radius: 15,
                //                   backgroundColor: Colors.grey.withOpacity(0.2),
                //                   child: Center(
                //                     child: Icon(
                //                       Icons.grade,
                //                       color: Colors.red.shade800,
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   width: 6,
                //                 ),
                //                 Text(
                //                   'Rate it',
                //                   style: listTileSubTitleText,
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: GestureDetector(
                //           onTap: () async {
                //             await FlutterShare.share(
                //                 title: widget.videoName,
                //                 linkUrl: widget.videoUrl);
                //           },
                //           child: Padding(
                //             padding: const EdgeInsets.all(12.0),
                //             child: Row(
                //               children: [
                //                 CircleAvatar(
                //                   radius: 15,
                //                   backgroundColor: Colors.grey.withOpacity(0.2),
                //                   child: Center(
                //                     child: Icon(Icons.ios_share,
                //                         color: primaryTextColor),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   width: 6,
                //                 ),
                //                 Text(
                //                   'Share',
                //                   style: listTileSubTitleText,
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ],
        ));
  }
}
