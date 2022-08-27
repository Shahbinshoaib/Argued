import 'dart:async';

import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/frontend/widgets/AppUserProfileCircle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

getMonth(month) {
  if (month == 1) {
    return 'Jan';
  } else if (month == 2) {
    return 'Feb';
  } else if (month == 3) {
    return 'Mar';
  } else if (month == 4) {
    return 'Apr';
  } else if (month == 5) {
    return 'May';
  } else if (month == 6) {
    return 'Jun';
  } else if (month == 7) {
    return 'Jul';
  } else if (month == 8) {
    return 'Aug';
  } else if (month == 9) {
    return 'Sept';
  } else if (month == 10) {
    return 'Oct';
  } else if (month == 11) {
    return 'Nov';
  } else if (month == 12) {
    return 'Dec';
  }
}

class AppCard extends StatefulWidget {
  final String userName;
  final String topicName;
  final String categoryName;
  final String subCategoryName;
  final String language;
  final String opinionID;
  final String stand;
  final DateTime createdAt;
  final String userPostCover;
  final String thumbnail;
  final String videoURL;
  final String rating;
  final String hostId;
  final bool alreadyRated;

  const AppCard({
    Key key,
    @required this.rating,
    @required this.alreadyRated,
    @required this.thumbnail,
    @required this.videoURL,
    @required this.stand,
    @required this.userName,
    @required this.topicName,
    @required this.categoryName,
    @required this.subCategoryName,
    @required this.language,
    @required this.createdAt,
    @required this.opinionID,
    @required this.userPostCover,
    @required this.hostId,
  }) : super(key: key);

  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  String avgRating;
  ChewieController _chewieController;
  StreamSubscription _rating;
  bool showVideo = false;
  bool playing = true;
  @override
  void initState() {
    super.initState();
  }

  startVideo() {
    _chewieController = ChewieController(
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp
        ],
        videoPlayerController: VideoPlayerController.network(widget.videoURL),
        // aspectRatio: 5 / 2.3,
        aspectRatio: 16 / 9,
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
    _rating.cancel();
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    _chewieController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    _rating = dashboardBloc.ratingResponse.listen((event) {
      if (event["data"]["avgRating"] != null) {
        if (widget.opinionID == event['data']['opinion']) {
          print('updating rating');
          setState(() {
            avgRating = event['data']["avgRating"].toString();
          });
        }
      }
    });
    print("avgRating: $avgRating");
    var month = getMonth(widget.createdAt.month);
    return Container(
      child: Card(
        child: Wrap(
          children: [
            ListTile(
              leading: UserCirle(
                profilePic: widget.userPostCover ?? kTempImage,
                height: 52,
                width: 52,
              ),
              title: Text(
                widget.userName,
                style: listTileTitleText,
              ),
              subtitle: GestureDetector(
                onTap: () {
                  dashboardBloc.addhost(widget.hostId);
                  MyAppDailog().appResponseDailog(
                      context, dashboardBloc.ratingResponse, 1);
                },
                child: Text(
                  '+ Add host to watch list',
                  style: listTileSubTitleText,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.createdAt.day} $month ${widget.createdAt.year}",
                    style: listTileTrailingText,
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (!showVideo) {
                  setState(() {
                    showVideo = true;
                  });
                }
              },
              child: Container(
                  height: SizeConfig.screenHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: (showVideo)
                      ? Chewie(
                          controller: startVideo(),
                        )
                      : Stack(
                          alignment: Alignment.topRight,
                          children: [
                            CachedNetworkImage(
                              height: SizeConfig.screenHeight * 0.2,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl: widget.thumbnail ?? kTempImage,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Center(child: Icon(Icons.error)),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Center(
                                      child: Icon(
                                    Icons.play_arrow_sharp,
                                    // size: 45,
                                    color: primaryTextColor,
                                  ))),
                            ),
                          ],
                        )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text(
                widget.topicName,
                style: listTileTitleText,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Chip(
                      label: Text(
                        widget.categoryName,
                        style: chipText,
                      ),
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                    Chip(
                      label: Text(
                        widget.subCategoryName,
                        style: chipText,
                      ),
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Chip(
                      label: Text(
                        widget.language,
                        style: chipText,
                      ),
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                    // SizedBox(
                    //   width: 8,
                    // ),
                  ],
                ),
              ],
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              height: 4,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        if (widget.alreadyRated) {
                          MyAppDailog().responseDailog(
                              'You Have already Rate it this Video', context,
                              showClosebutton: true);
                        } else {
                          print("Avg : $avgRating , Rate : ${widget.rating}");
                          MyAppDailog().ratingDailog(
                              avgRating ?? widget.rating,
                              widget.topicName,
                              widget.userName,
                              context, () async {
                            dashboardBloc.postRating(
                                widget.opinionID, widget.stand);
                            MyAppDailog().appResponseDailog(
                                context, dashboardBloc.ratingResponse, 2);
                          });
                        }
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: Center(
                              child: Icon(
                                Icons.grade,
                                color: Colors.red.shade800,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Rate it',
                            style: listTileSubTitleText,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      MyAppDailog().responseDailog(
                          'Upgrade to be a host and post \nUpgrade at argued.com',
                          context,
                          showClosebutton: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: Center(
                              child: Icon(
                                Icons.reply,
                                color: primaryTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Reply',
                            style: listTileSubTitleText,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await FlutterShare.share(
                          title: widget.topicName,
                          linkUrl:
                              "https://argued.com/opinion/${widget.opinionID}");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: Center(
                              child: Icon(Icons.ios_share,
                                  color: primaryTextColor),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Share',
                            style: listTileSubTitleText,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppCard2 extends StatefulWidget {
  final String userName;
  final String topicName;
  final String categoryName;
  final String subCategoryName;
  final String language;
  final String opinionID;
  final String stand;
  final DateTime createdAt;
  final String userPostCover;
  final String thumbnail;
  final String videoURL;
  final String rating;
  final String hostId;
  final bool alreadyRated;
  const AppCard2({
    Key key,
    @required this.alreadyRated,
    @required this.stand,
    @required this.rating,
    @required this.videoURL,
    @required this.userName,
    @required this.topicName,
    @required this.categoryName,
    @required this.subCategoryName,
    @required this.language,
    @required this.createdAt,
    @required this.opinionID,
    @required this.userPostCover,
    @required this.thumbnail,
    @required this.hostId,
  }) : super(key: key);

  @override
  _AppCard2State createState() => _AppCard2State();
}

class _AppCard2State extends State<AppCard2> {
  String avgRating;
  ChewieController _chewieController;
  StreamSubscription _rating;
  bool showVideo = false;
  bool playing = true;
  @override
  void initState() {
    var dashboardBloc = Provider.of<DashboardBloc>(context, listen: false);
    _rating = dashboardBloc.ratingResponse.listen((event) {
      if (event["data"]["avgRating"] != null) {
        if (widget.opinionID == event['data']['opinion']) {
          setState(() {
            avgRating = event['data']["avgRating"].toString();
          });
        }
      }
    });
    super.initState();
  }

  startVideo() {
    _chewieController = ChewieController(
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp
        ],
        videoPlayerController: VideoPlayerController.network(widget.videoURL),
        aspectRatio: 16 / 9,
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
    _rating.cancel();
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    _chewieController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    // var month = getMonth(createdAt.month);
    return Container(
      child: Card(
        child: Wrap(
          children: [
            GestureDetector(
              onTap: () {
                if (!showVideo) {
                  setState(() {
                    showVideo = true;
                  });
                }
              },
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: (showVideo)
                    ? Chewie(
                        controller: startVideo(),
                      )
                    : Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CachedNetworkImage(
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: widget.thumbnail ?? kTempImage,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Center(child: Icon(Icons.error)),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Center(
                                    child: Icon(
                                  Icons.play_arrow_sharp,
                                  // size: 45,
                                  color: primaryTextColor,
                                ))),
                          ),
                        ],
                      ),
              ),
            ),
            Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  width: SizeConfig.screenWidth * 0.6,
                  padding: EdgeInsets.only(left: 12, top: 8),
                  child: Text(
                    widget.topicName ?? "",
                    overflow: TextOverflow.visible,
                    style: listTileTitleText,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Chip(
                      label: Text(
                        widget.categoryName ?? '',
                        style: chipText,
                      ),
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Chip(
                      label: Text(
                        widget.subCategoryName ?? "",
                        style: chipText,
                      ),
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      if (widget.alreadyRated) {
                        MyAppDailog().responseDailog(
                            'You Have already Rate it this Video', context,
                            showClosebutton: true);
                      } else {
                        MyAppDailog().ratingDailog(avgRating ?? widget.rating,
                            widget.topicName, widget.userName, context, () {
                          dashboardBloc.postRating(
                              widget.opinionID, widget.stand);
                          MyAppDailog().appResponseDailog(
                              context, dashboardBloc.ratingResponse, 2);
                        });
                      }
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: Center(
                        child: Icon(
                          Icons.grade,
                          color: Colors.red.shade800,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    MyAppDailog().responseDailog(
                        'Upgrade to be a host and post \nUpgrade at argued.com',
                        context,
                        showClosebutton: true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: Center(
                        child: Icon(
                          Icons.reply,
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await FlutterShare.share(
                        title: widget.topicName, linkUrl: "https://argued.com/opinion/${widget.opinionID}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: Center(
                        child: Icon(
                          Icons.ios_share,
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "",
                      // "${createdAt.day} $month ${createdAt.year}",
                      style: listTileSubTitleText,
                    )),
              ],
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              height: 4,
              thickness: 1,
            ),
            ListTile(
              leading: UserCirle(
                profilePic: widget.userPostCover ?? kTempImage,
                height: 52,
                width: 52,
              ),
              title: Text(
                widget.userName,
                style: listTileTitleText2,
              ),
              subtitle: GestureDetector(
                onTap: () {
                  dashboardBloc.addhost(widget.hostId);
                  MyAppDailog().appResponseDailog(
                      context, dashboardBloc.ratingResponse, 1);
                },
                child: Text(
                  '+ Add host to watch list',
                  style: listTileTrailingText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
