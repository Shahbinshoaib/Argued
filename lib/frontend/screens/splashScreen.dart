import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';

import 'package:argued/frontend/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    authBloc.retreiveCredential();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: AnimatedSplashScreen(
                  animationDuration: Duration(milliseconds: 3000),
                  duration: 3000,
                  splashTransition: SplashTransition.rotationTransition,
                  curve: Curves.easeInOutBack,
                  nextScreen: SplashScreen(),
                  splash: Center(
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/appIcon.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: AnimatedSplashScreen(
                  animationDuration: Duration(milliseconds: 3000),
                  duration: 3000,
                  splashTransition: SplashTransition.slideTransition,
                  curve: Curves.easeInOutBack,
                  nextScreen: LoginScreen(),
                  splash: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      'Argument is the cornerstone of a free society.',
                      style: bigHeadingText().copyWith(
                          color: Colors.black.withOpacity(1), fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: AnimatedSplashScreen(
                  animationDuration: Duration(milliseconds: 3000),
                  duration: 3000,
                  //splashTransition: SplashTransition.slideTransitionReverse,
                  curve: Curves.easeInOutBack,
                  nextScreen: LoginScreen(),
                  splash: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      'Anything preventing argument is oppression.',
                      style: bigHeadingText().copyWith(
                          color: Colors.black.withOpacity(1), fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Expanded(flex: 4,child: Container())
          ],
        ),
      ),
    );
  }
}
