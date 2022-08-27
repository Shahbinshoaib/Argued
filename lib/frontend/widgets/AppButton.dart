import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String text;
  Function onTap;
  double height;
  double fontSize;
  Color color;
  AppButton(
      {this.color = primaryColor,
      this.height = 45,
      this.text = '',
      this.onTap,
      this.fontSize = 20});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return StreamBuilder<bool>(
        stream: authBloc.button,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: snapshot.data == true
                    ? primaryColor.withOpacity(0.4)
                    : primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
                ),
              ),
            ),
          );
        });
  }
}

class AppSmallButton extends StatelessWidget {
  final Function onTap;
  final double screenWidthPercentage;
  final Color buttonColor;
  final Color buttonTextColor;
  final String buttonText;

  const AppSmallButton(
      {Key key,
      @required this.onTap,
      @required this.screenWidthPercentage,
      @required this.buttonColor,
      @required this.buttonTextColor,
      @required this.buttonText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth * screenWidthPercentage,
        height: 40,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor, width: 1),
        ),
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: buttonTextColor),
        )),
      ),
    );
  }
}
