import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final double widthPortion;
  final double heigthPortion;

  const AppIcon({Key key, this.widthPortion = 0.6, this.heigthPortion = 0.25})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: SizeConfig.screenWidth,
      alignment: Alignment.center,
      child: Container(
        height: SizeConfig.screenHeight * heigthPortion,
        margin: EdgeInsets.only(top: 30),
        width: SizeConfig.screenWidth * widthPortion,
        child: Image.asset(
          'assets/logo.png',
          // fit: BoxFit.cover,
        ),
      ),
    );
  }
}
