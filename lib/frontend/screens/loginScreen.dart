import 'dart:ui';

import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/frontend/widgets/AppBottomSheet.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:argued/frontend/widgets/AppPolicyDailog.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/PopUpMessage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ota_update/ota_update.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TapGestureRecognizer onTap;
  Stream<OtaEvent> otaEvent;
  OtaEvent currentEvent;
  FocusNode node;
  TextEditingController c = TextEditingController();
  TextEditingController c1 = TextEditingController();
  String versionCode = '';
  String versionName = '';

  @override
  void initState() {
    node = FocusNode();
    platfromInfo();
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.apiVerification();
    onTap = TapGestureRecognizer()..onTap = _handleOnTap;
    super.initState();
  }

  Future platfromInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionCode = packageInfo.buildNumber;
      versionName = packageInfo.version;
    });
  }

  @override
  void dispose() {
    c.dispose();
    c1.dispose();
    node.dispose();
    onTap.dispose();
    super.dispose();
  }

  updateApk(String url) {
    try {
      OtaUpdate()
          .execute(url, destinationFilename: 'Agrued.apk')
          .listen((event) {});
    } catch (e) {
      print('Failed to make OTA update. Details: $e');
    }
  }

  void _handleOnTap() {
    Navigator.pushNamed(context, kSignUpScreen);
  }

  String updateMsg =
      "The App Version You Are Currently Using Is Deprecated. Kindly Upgrade Your App";
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return SafeArea(child: Scaffold(
      body: Builder(builder: (context) {
        return Stack(
          children: [
            ListView(
              children: [
                AppIcon(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kbaseHorizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: Text("Welcome back", style: bigHeadingText()),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: kbaseVerticalPadding),
                          child: StreamBuilder<String>(
                              stream: authBloc.username,
                              builder: (context, snapshot) {
                                return Focus(
                                  onFocusChange: (focus) {
                                    if (!focus) {
                                      authBloc.checkUserName();
                                    }
                                  },
                                  child: AppTextField(
                                    controller: c1
                                      ..text =
                                          snapshot.hasData ? snapshot.data : ''
                                      ..selection = TextSelection.collapsed(
                                          offset: snapshot.hasData
                                              ? snapshot.data.length
                                              : 0),
                                    iconColor: snapshot.hasError
                                        ? Colors.red
                                        : primaryColor,
                                    icon: snapshot.hasError
                                        ? Icons.clear
                                        : Icons.check,
                                    onChanged: authBloc.changeusername,
                                    hintText: 'johndoe',
                                    label: 'Username',
                                  ),
                                );
                              })),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: kbaseVerticalPadding),
                          child: StreamBuilder<bool>(
                              stream: authBloc.hideText,
                              builder: (context, snapshot) {
                                return AppTextField(
                                    controller: c
                                      ..text = authBloc.pass != null
                                          ? authBloc.pass
                                          : ''
                                      ..selection = TextSelection.collapsed(
                                          offset: authBloc.pass != null
                                              ? authBloc.pass.length
                                              : 0),
                                    onTap: () {
                                      authBloc.changeHideText(!snapshot.data);
                                    },
                                    obsecureText:
                                        snapshot.data == false ? false : true,
                                    onChanged: authBloc.changePassword,
                                    hintText: '**********',
                                    label: 'Password',
                                    icon: FontAwesomeIcons.eye);
                              })),
                      rememberMe(authBloc),
                      SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<bool>(
                          stream: authBloc.apiVerified,
                          builder: (context, api) {
                            return StreamBuilder<bool>(
                              // initialData: false,
                              stream: authBloc.isValidLogin,
                              builder: (context, snapshot) {
                                return StreamBuilder<bool>(
                                    stream: authBloc.button,
                                    builder: (context, loginpress) {
                                      return AppButton(
                                        text: 'Login',
                                        onTap: snapshot.data == true &&
                                                api.data == true
                                            ? () async {
                                                authBloc.changeButton(true);
                                                MyAppDailog().loading(
                                                    context, true, false);
                                                await authBloc.login();
                                                Navigator.pop(context);
                                                authBloc.changeLoginPress(true);
                                                authBloc.changeButton(false);
                                                var response =
                                                    authBloc.responseValue;

                                                if (response['key'] ==
                                                    "user.account_inactive") {
                                                  AppBottomSheet().verifyCode(
                                                      context, () async {
                                                    await authBloc.verifyCode();
                                                    Navigator.pop(context);
                                                    authBloc
                                                        .changeLoginPress(true);
                                                  });
                                                }
                                              }
                                            : () async {
                                                authBloc.changeButton(true);
                                                if (snapshot.data == true) {
                                                  if (api.data == false) {
                                                    MyAppDailog().updateApkDailog(
                                                        "The App Version Currently You Are Using Is Deprecated. Kindly Upgrade Your App ",
                                                        context, () {
                                                      updateApk(
                                                          authBloc.newApkUrl);
                                                      // updateApk(
                                                      //     'https://argued.com/argued-app.apk');
                                                      Navigator.pop(context);
                                                      MyAppDailog().loading(
                                                          context,
                                                          false,
                                                          false);
                                                      // Navigator.pushReplacement(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             DownloadScreen(
                                                      //               event:
                                                      //                   currentEvent,
                                                      //             )));
                                                    });
                                                  }
                                                }
                                                await Future.delayed(Duration(
                                                    milliseconds: 300));
                                                authBloc.changeButton(false);
                                              },
                                      );
                                    });
                              },
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'v$versionName.2',
                        style: normalText().copyWith(color: primaryTextColor),
                      )),
                      SizedBox(
                        height: 35,
                      ),
                      dontHaveAcc(),
                      SizedBox(
                        height: 45,
                      ),
                      Center(
                        child: termsAndCondition(),
                      )
                    ],
                  ),
                ),
              ],
            ),
            PopUpMessage().loginAndSignUpMsg(authBloc),
            Container(
              child: StreamBuilder<Map>(
                  stream: authBloc.apiValidation,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data["data"]["versionAllowed"] == true) {
                      authBloc.changeApiVerified(true);
                      return Container();
                    }

                    authBloc.changeApiVerified(false);
                    return Container();
                  }),
            ),
          ],
        );
      }),
    ));
  }

  

  termsAndCondition() {
    return Column(
      children: [
        Text('You are completely safe.',
            style: TextStyle(color: primaryTextColor)),
        SizedBox(
          height: 8,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return PolicyDailog(mdfilename: 'terms_conditions.md');
                });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Text('Read our Terms & Conditions.p',
                style: TextStyle(color: primaryTextColor)),
          ),
        ),
      ],
    );
  }

  dontHaveAcc() {
    return Container(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: Colors.black)),
        TextSpan(text: 'Signup', style: smallHeadingText(), recognizer: onTap)
      ])),
    );
  }

  rememberMe(AuthBloc authBloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder<bool>(
                stream: authBloc.rememberMe,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return Checkbox(
                      activeColor: primaryColor,
                      value: snapshot.data,
                      onChanged: (value) {
                        authBloc.changeRememberMe(value);
                      });
                }),
            Text(
              'Remember me',
              style: TextStyle(color: primaryTextColor),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            AppBottomSheet().resetUserNamePassword(context, () {});
          },
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Forgot Credential",
              style: TextStyle(
                  decoration: TextDecoration.underline, color: primaryColor),
            ),
            TextSpan(text: '?  ', style: TextStyle(color: Colors.black))
          ])),
        )
      ],
    );
  }
}
