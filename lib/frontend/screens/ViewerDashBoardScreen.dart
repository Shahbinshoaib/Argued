import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/frontend/widgets/AppCard.dart';
import 'package:argued/frontend/widgets/AppCarousel.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/frontend/widgets/dashBoardAppBar.dart';
import 'package:argued/model/HotTopicModel.dart';
import 'package:argued/model/opnionModel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewerDashBoardScreen extends StatefulWidget {
  @override
  _ViewerDashBoardScreenState createState() => _ViewerDashBoardScreenState();
}

class _ViewerDashBoardScreenState extends State<ViewerDashBoardScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    var dashboardBloc = Provider.of<DashboardBloc>(context, listen: false);
    dashboardBloc.getHotTopicOfHour();
    dashboardBloc.getMostWatchedTopic();
    dashboardBloc.getInterestingToYou();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (!dashboardBloc.shouldStopSearching) {
          dashboardBloc.changePageNum(dashboardBloc.getPageNo + 1);
          dashboardBloc.getInterestingToYou();
          dashboardBloc.changeIsLoading(true);
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: DashboardAppBar(),
        bottomNavigationBar: bottomNavBar(dashboardBloc),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
            child: Wrap(
              children: [
                bodyHeading(heading: "Hot Topic this hour"),
                StreamBuilder<HotTopicModel>(
                    stream: dashboardBloc.hotTopicOfHour,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * 0.3,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      var s = snapshot.data;
                      print(
                          "Opinion id for hotopic video thats is also one of the video that show Opinion Not Found ${s.id}");
                      return AppCard(
                        alreadyRated:
                            (s.createdBy.createdById == authBloc.getuserId),
                        hostId: s.createdBy.id,
                        rating: s.rating.toString(),
                        videoURL: s.video.file,
                        thumbnail: s.video.thumbnail,
                        userPostCover: s.createdBy.profilePic,
                        stand: s.stand,
                        userName: s.createdBy.displayName ?? s.details.userName,
                        topicName: s.details.topicName,
                        categoryName: s.details.categoryName,
                        subCategoryName: s.details.subCategoryName,
                        language: s.language,
                        createdAt: s.createdAt,
                        opinionID: s.id,
                      );
                    }),
                bodyHeading(heading: "Most watched in your selected topics"),
                AppCarousel(),
                bodyHeading(heading: "Interesting to you"),
                InterestingToYou(),
                StreamBuilder<bool>(
                    initialData: true,
                    stream: dashboardBloc.isLoading,
                    builder: (context, snapshot) {
                      if (snapshot.hasData & snapshot.data == true) {
                        return Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return Container(
                        child: Center(
                          child: Text(
                            "No more post to show",
                            style: listTileSubTitleText,
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  bodyHeading({String heading = ''}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding + 4),
      child: Text(heading,
          style: GoogleFonts.lato(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  bottomNavBar(DashboardBloc dashboardBloc) {
    return CurvedNavigationBar(
      height: 60,
      // animationCurve: Curves.easeOutCubic,
      animationDuration: Duration(milliseconds: 200),
      index: 0,
      color: Colors.white,
      backgroundColor: Colors.grey.withOpacity(0.1),
      buttonBackgroundColor: Colors.white,
      items: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 35,
              color: primaryColor,
            ),
            // Text(
            //   'Watchlist',
            //   textWidthBasis: TextWidthBasis.parent,
            //   style: listTileTrailingText.copyWith(
            //       color: Colors.black, fontSize: 10),
            // ),
            // SizedBox(
            //   height: 12,
            // ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              FontAwesomeIcons.users,
              // size: 25,
              color: primaryColor,
            ),
            Text(
              '  Groups',
              style: listTileTrailingText.copyWith(
                  color: Colors.black, fontSize: 10),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
        Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/glasses.svg',
              width: 35,
              color: primaryColor,
            ),
            Text(
              'Watchlist',
              textWidthBasis: TextWidthBasis.parent,
              style: listTileTrailingText.copyWith(
                  color: Colors.black, fontSize: 10),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              FontAwesomeIcons.solidAddressBook,
              // size: 25,
              color: primaryColor,
            ),
            Text(
              'Contacts',
              textWidthBasis: TextWidthBasis.parent,
              style: listTileTrailingText.copyWith(
                  color: Colors.black, fontSize: 10),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.pushNamed(context, kGroupScreen);
        } else if (index == 2) {
          Navigator.pushNamed(context, kWatchListScreen);
        } else if (index == 3) {
          Navigator.pushNamed(context, kContactScreen);
        } else {
          MyAppDailog().responseDailog(
              'Upgrade to be a host and post \nUpgrade at argued.com', context,
              showClosebutton: true);
        }
      },
    );
  }
}

class InterestingToYou extends StatelessWidget {
  // int pageNo = 1;
  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return StreamBuilder<List<OpinionData>>(
        stream: dashboardBloc.interestingToYou,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                var s = snapshot.data[index];
                bool alreadyRate = false;
                s.userRatings.forEach((e) {
                  if (e.createdBy == authBloc.getuserId) {
                    alreadyRate = true;
                  }
                });
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppCard(
                    alreadyRated: alreadyRate,
                    hostId: s.createdBy.id,
                    rating: s.rating.toString(),
                    videoURL: s.video.file,
                    userPostCover: s.createdBy.profilePic,
                    thumbnail: s.video.thumbnail,
                    stand: s.stand,
                    userName: s.createdBy.displayName ?? s.details.userName,
                    topicName: s.details.topicName,
                    categoryName: s.details.categoryName,
                    subCategoryName: s.details.subCategoryName,
                    language: s.language,
                    createdAt: s.createdAt,
                    opinionID: s.id,
                  ),
                );
              });
        });
  }
}
