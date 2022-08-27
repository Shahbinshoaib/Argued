import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int currentPage = 0;
  String versionCode = '';
  String versionName = '';
  final pageController = PageController(initialPage: 0);
  Future platfromInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionCode = packageInfo.buildNumber;
      versionName = packageInfo.version;
    });
  }

  @override
  void initState() {
    platfromInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              // Page1(),
              // Page2(),
              imageContainer("1.png"),
              imageContainer("2.png"),
              imageContainer("3.png"),
              imageContainer("4.png"),
              imageContainer("5.png"),
              imageContainer("6.png"),
              imageContainer("7.png"),
              imageContainer("8.png"),
            ],
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  8,
                  (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: (index == currentPage) ? 15 : 10,
                      width: (index == currentPage) ? 15 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(5),
                        color: (index == currentPage)
                            ? primaryColor
                            : primaryColor.withOpacity(0.2),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (currentPage == 7)
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(bottom: 50),
                          child: AppSmallButton(
                              onTap: () =>
                                  Navigator.pushNamed(context, kSplashScreen),
                              screenWidthPercentage: 0.4,
                              buttonColor: primaryColor,
                              buttonTextColor: Colors.white,
                              buttonText: 'Skip'),
                        ),
                  GestureDetector(
                    onTap: () {
                      if (currentPage == 7) {
                        Navigator.pushNamed(context, kSplashScreen);
                      }
                      // pageController.nextPage(
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.easeInOutQuint);
                    },
                    child: (currentPage != 7)
                        ? Container()
                        : AnimatedContainer(
                            margin: EdgeInsets.only(bottom: 50),
                            duration: Duration(milliseconds: 300),
                            height: 50,
                            alignment: Alignment.center,
                            width: (currentPage == 7) ? 200 : 50,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: (currentPage == 7)
                                ? Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                          ),
                  ),
                ],
              ),
              Center(
                  child: Text(
                'v$versionName.2',
                style: normalText().copyWith(color: primaryTextColor),
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

imageContainer(String image) {
  return Center(
      child: Container(
    height: 300,
    width: 300,
    padding: EdgeInsets.all(0),
    margin: EdgeInsets.all(0),
    // width: 100,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/$image"), fit: BoxFit.cover)),
  ));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor.withOpacity(0.5),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageContainer("1.png"),
            imageContainer("2.png"),
            // Row(
            //   children: [
            //     imageContainer("1.png"),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     imageContainer("2.png"),
            //   ],
            // ),
            // Row(
            //   children: [
            //     imageContainer("3.png"),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     imageContainer("4.png"),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor.withOpacity(0.5),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                imageContainer("5.png"),
                SizedBox(
                  width: 8,
                ),
                imageContainer("6.png"),
              ],
            ),
            Row(
              children: [
                imageContainer("7.png"),
                SizedBox(
                  width: 8,
                ),
                imageContainer("8.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
