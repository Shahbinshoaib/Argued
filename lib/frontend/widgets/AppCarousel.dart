import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/frontend/widgets/AppCard.dart';
import 'package:argued/main.dart';
import 'package:argued/model/opnionModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    return StreamBuilder<OpinionModel>(
        stream: dashboardBloc.mostWatched,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              height: SizeConfig.screenHeight * 0.3,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          var s = snapshot.data.data;

          return Stack(
            children: [
              Positioned(
                  top: 200,
                  left: -3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: primaryTextColor,
                      size: 35,
                    ),
                  )),
              Positioned(
                  top: 200,
                  right: -3,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: primaryTextColor,
                    size: 35,
                  )),
              CarouselSlider(
                options: CarouselOptions(
                  height: 430,
                  viewportFraction: 0.878,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: s.map((i) {
                  bool alreadyRate = false;
                  i.userRatings.forEach((e) {
                    if (e.createdBy == authBloc.getuserId) {
                      alreadyRate = true;
                    }
                  });
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: AppCard2(
                              alreadyRated: alreadyRate,
                              hostId: i.createdBy.id,
                              rating: i.rating.toString(),
                              videoURL: i.video.file,
                              thumbnail: i.video.thumbnail,
                              stand: i.stand,
                              userName: i.createdBy.displayName ?? i.details.userName,
                              topicName: i.details.topicName ?? "",
                              categoryName: i.details.categoryName ?? '',
                              subCategoryName: i.details.subCategoryName ?? '',
                              language: i.language ?? '',
                              createdAt: i.createdAt,
                              opinionID: i.id ?? '',
                              userPostCover:
                                  i.createdBy.profilePic ?? kTempImage));
                    },
                  );
                }).toList(),
              ),
            ],
          );
        });
  }
}
