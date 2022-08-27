import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/ProfileBloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppPhoneNumberField extends StatefulWidget {
  @override
  _AppPhoneNumberFieldState createState() => _AppPhoneNumberFieldState();
}

class _AppPhoneNumberFieldState extends State<AppPhoneNumberField> {
  TextEditingController _phoneNo = TextEditingController();
  @override
  void dispose() {
    _phoneNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var profileBloc = Provider.of<ProfileBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            "Phone no.",
            style: smallHeadingText(),
          ),
        ),
        Container(
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2)),
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: StreamBuilder<String>(
                        stream: profileBloc.phoneCode,
                        builder: (context, snapshot) {
                          return CountryCodePicker(
                            padding: EdgeInsets.all(0),
                            initialSelection:
                                snapshot.hasData ? snapshot.data : "+92",
                            showDropDownButton: true,
                            onChanged: (code) {
                              profileBloc.changePhoneCode(code.toString());
                            },
                          );
                        }),
                  ),
                  Container(
                    width: SizeConfig.screenWidth * 0.5,
                    child: StreamBuilder<String>(
                        stream: profileBloc.phoneNo,
                        builder: (context, snapshot) {
                          return TextFormField(
                            maxLength: 10,
                            controller: _phoneNo
                              ..text = profileBloc.getPhoneNo != null
                                  ? profileBloc.getPhoneNo
                                  : ''
                              ..selection = TextSelection.collapsed(
                                  offset: profileBloc.getPhoneNo != null
                                      ? profileBloc.getPhoneNo.length
                                      : 0),
                            keyboardType: TextInputType.number,
                            onChanged: profileBloc.changePhoneNo,
                            decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.only(left: 15),
                                border: InputBorder.none,
                                hintText: '3456789546',
                                hintStyle: TextStyle(color: primaryTextColor)),
                          );
                        }),
                  ),
                ],
              ),
              StreamBuilder<String>(
                  stream: profileBloc.phoneNo,
                  builder: (context, snapshot) {
                    return Positioned(
                        right: 10,
                        top: 14,
                        child: Icon(
                          snapshot.hasError ? Icons.clear : Icons.check,
                          size: 20,
                          color: snapshot.hasError ? Colors.red : primaryColor,
                        ));
                  })
            ],
          ),
        ),
      ],
    );
  }
}
