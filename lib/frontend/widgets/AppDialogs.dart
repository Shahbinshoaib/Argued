import 'dart:async';

import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/frontend/screens/group/groupDetails.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppDailog {
  loading(context, bool dissimable,bool popBack) {
    showDialog(
        barrierDismissible: dissimable,
        context: context,
        builder: (context) => Center(
              child: WillPopScope(
                  onWillPop: () async {
                    return popBack;
                  },
                  child: CircularProgressIndicator()),
            ));
  }

  loginDailog(msg, context) {
    var dailog = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Argued.com",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                msg ?? "",
                style: normalText(),
              ),
            ],
          )),
    );
    return dailog;
  }

  responseDailog(msg, context, {bool showClosebutton = false}) {
    var dailog = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Argued.com",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    msg,
                    style: normalText(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              (showClosebutton)
                  ? Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ))
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ],
          )),
    );
    showDialog(context: context, builder: (context) => dailog);
  }

  updateApkDailog(msg, context, onTap) {
    var dailog = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Argued.com",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            Divider(
              color: primaryTextColor,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              msg,
              style: normalText().copyWith(
                  color: primaryTextColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Center(
              child: AppSmallButton(
                  onTap: onTap,
                  screenWidthPercentage: 0.4,
                  buttonColor: primaryColor,
                  buttonTextColor: Colors.white,
                  buttonText: 'Upgrade'),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => dailog);
  }

  appResponseDailog(
      context, Stream<Map<dynamic, dynamic>> stream, int popPageCount) {
    showDialog(
        context: context,
        builder: (context) => StreamBuilder<Map<dynamic, dynamic>>(
            stream: stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              Future.delayed(Duration(milliseconds: 3000)).then((value) {
                for (int i = 0; i < popPageCount; i++) {
                  Navigator.pop(context);
                }
              });
              return Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Container(
                    width: SizeConfig.screenWidth,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Argued.com",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data["message"] ?? 'Error!',
                          style: normalText(),
                        ),
                      ],
                    )),
              );
            }));
  }

  ratingDailog(
    rating,
    topicName,
    userName,
    context,
    onTap,
  ) {
    showDialog(
        context: context,
        builder: (context) => RatingBox(
              rating: rating,
              topicName: topicName,
              userName: userName,
              onTap: onTap,
            ));
  }

  groupDetailsDailog(context, groupId) {
    var dailog = Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: GroupDetails(
              groupId: groupId,
            )));
    showDialog(context: context, builder: (context) => dailog);
  }
}

emojiContainer(DashboardBloc dashboardBloc) {
  return StreamBuilder<List<bool>>(
      stream: dashboardBloc.emojiList,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                dashboardBloc.changeEmojiList([true, false, false]);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: snapshot.data[0] == true ? 80 : 40,
                width: snapshot.data[0] == true ? 80 : 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/sad.png'),
                        fit: BoxFit.contain)),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                dashboardBloc.changeEmojiList([false, true, false]);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: snapshot.data[1] == true ? 80 : 40,
                width: snapshot.data[1] == true ? 80 : 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/ok.png'),
                        fit: BoxFit.contain)),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                dashboardBloc.changeEmojiList([false, false, true]);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: snapshot.data[2] == true ? 80 : 40,
                width: snapshot.data[2] == true ? 80 : 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/happy.png'),
                        fit: BoxFit.contain)),
              ),
            ),
          ],
        );
      });
}

// ignore: must_be_immutable
class RatingBox extends StatefulWidget {
  String rating;
  final String userName;
  final String topicName;
  final Function onTap;

  RatingBox({Key key, this.rating, this.userName, this.topicName, this.onTap})
      : super(key: key);
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  @override
  Widget build(BuildContext context) {
    print("Rating : ${widget.rating}");
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => Navigator.pop(context)),
                ],
              ),
              Text(
                widget.topicName ?? '',
                style: listTileTitleText2,
              ),
              SizedBox(
                height: 12,
              ),
              emojiContainer(dashboardBloc),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.grade,
                        color: Colors.red.shade800,
                        size: 16,
                      ),
                      Text(
                        '${widget.rating}% avg',
                        style: listTileTrailingText.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  // Wrap(
                  //   children: [
                  //     Text(
                  //       'Add host to Watchlist +',
                  //       style: listTileTrailingText,
                  //     ),
                  //     SizedBox(
                  //       width: 4,
                  //     )
                  //   ],
                  // ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                indent: 16,
                endIndent: 16,
                height: 4,
                thickness: 1,
              ),
              SizedBox(
                height: 12,
              ),
              Row(children: [
                Container(
                  width: SizeConfig.screenWidth * 0.1,
                  child: Icon(
                    Icons.grade,
                    color: Colors.red.shade800,
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.1,
                  child: Text(
                    'Rate :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 14,
                        color: Colors.black),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.4,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.red[700],
                      inactiveTrackColor: Colors.red[100],
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbColor: Colors.redAccent,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 6.0),
                      overlayColor: Colors.red.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                    ),
                    child: StreamBuilder<double>(
                        stream: dashboardBloc.rating,
                        builder: (context, snapshot) {
                          return Slider(
                            label: '${snapshot.data}%',
                            value: snapshot.data,
                            onChanged: (newRating) {
                              dashboardBloc.changeRating(newRating);
                            },
                            min: 0,
                            max: 100,
                          );
                        }),
                  ),
                ),
                StreamBuilder<double>(
                    stream: dashboardBloc.rating,
                    builder: (context, snapshot) {
                      String val = snapshot.data.toString().split('.')[0] + '%';
                      return Container(
                        width: SizeConfig.screenWidth * 0.1,
                        child: Text(
                          val,
                          style: listTileTrailingText.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      );
                    })
              ]),
              Divider(
                indent: 16,
                endIndent: 16,
                height: 4,
                thickness: 1,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(8),
                  width: SizeConfig.screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor),
                  child: Center(
                    child: Text('save',
                        style: listTileTrailingText.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
