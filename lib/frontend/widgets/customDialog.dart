import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:flutter/material.dart';

class CustomDailogBox extends StatefulWidget {
  final description;
  CustomDailogBox({@required this.description});

  @override
  _CustomDailogBoxState createState() => _CustomDailogBoxState();
}

class _CustomDailogBoxState extends State<CustomDailogBox> {
  final double _borderRadius = 10;
  bool _visble = true;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    Future.delayed(Duration(milliseconds: 2500)).then((value) {
      if (this.mounted) {
        setState(() {
          _visble = false;
        });
        Navigator.pop(context);
      }
    });
    return Visibility(
      visible: _visble,
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Align(alignment: Alignment.center,
              child: Container(
                  width: _width,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(_borderRadius),
                  ),
                  child: Text(
                    widget.description,
                    style: normalText(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
