import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNumberField extends StatefulWidget {
  @override
  _AppNumberFieldState createState() => _AppNumberFieldState();
}

class _AppNumberFieldState extends State<AppNumberField> {
  FocusNode pin2node;
  FocusNode pin3node;
  FocusNode pin4node;

  @override
  void initState() {
    pin2node = FocusNode();
    pin3node = FocusNode();
    pin4node = FocusNode();
    super.initState();
  }

  nextField({String value, FocusNode node}) {
    if (value.length == 1) {
      node.requestFocus();
    }
  }

  @override
  void dispose() {
    pin2node.dispose();
    pin3node.dispose();
    pin4node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: SizeConfig.screenWidth / 6,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor, width: 1)),
            child: Center(
              child: TextField(
                // autofocus: true,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  authBloc.changePin1(value);
                  nextField(value: value, node: pin2node);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: SizeConfig.screenWidth / 6,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor, width: 1)),
            child: Center(
              child: TextField(
                focusNode: pin2node,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
                onChanged: (v) {
                  authBloc.changePin2(v);
                  nextField(value: v, node: pin3node);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: SizeConfig.screenWidth / 6,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor, width: 1)),
            child: Center(
              child: TextField(
                focusNode: pin3node,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
                onChanged: (v) {

                  authBloc.changePin3(v);
                  nextField(value: v, node: pin4node);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: SizeConfig.screenWidth / 6,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor, width: 1)),
            child: Center(
              child: TextField(
                focusNode: pin4node,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
                onChanged: (v) {
                  authBloc.changePin4(v);
                  pin4node.unfocus();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
