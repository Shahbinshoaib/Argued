import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/PopUpMessage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TapGestureRecognizer onTap;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPassController = TextEditingController();

  @override
  void initState() {
    onTap = TapGestureRecognizer()..onTap = _handleOnTap;
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confrimPassController.dispose();
    onTap.dispose();
    super.dispose();
  }

  void _handleOnTap() {
    Navigator.pushNamed(context, kLoginScreen);
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              AppIcon(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kbaseVerticalPadding),
                      child: Text("Create Account", style: bigHeadingText()),
                    ),
                    firstlastName(authBloc),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<String>(
                            stream: authBloc.usernameA,
                            builder: (context, snapshot) {
                              return Focus(
                                onFocusChange: (focus) {
                                  if (!focus) {
                                    authBloc.checkUserNameAvailable();
                                  }
                                },
                                child: AppTextField(
                                  icon: (snapshot.hasError)
                                      ? Icons.clear
                                      : FontAwesomeIcons.check,
                                  onChanged: authBloc.changeusernameA,
                                  hintText: 'johndoe',
                                  label: 'Username',
                                ),
                              );
                            })),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<String>(
                            stream: authBloc.email,
                            builder: (context, snapshot) {
                              return AppTextField(
                                onChanged: authBloc.changeEmail,
                                hintText: 'johndoe@email.com',
                                label: 'Email',
                                icon: (snapshot.error != null)
                                    ? Icons.clear
                                    : FontAwesomeIcons.check,
                              );
                            })),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<String>(
                            stream: authBloc.password,
                            builder: (context, snapshot) {
                              return Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  StreamBuilder<bool>(
                                      stream: authBloc.hideText,
                                      builder: (context, show) {
                                        return AppTextField(
                                            controller: passwordController
                                              ..text = authBloc.pass != null
                                                  ? authBloc.pass
                                                  : ''
                                              ..selection =
                                                  TextSelection.collapsed(
                                                      offset: authBloc.pass !=
                                                              null
                                                          ? authBloc.pass.length
                                                          : 0),
                                            onTap: () {
                                              authBloc.changeHideText(
                                                  !authBloc.getHideText);
                                            },
                                            obsecureText:
                                                authBloc.getHideText == false
                                                    ? false
                                                    : true,
                                            onChanged: authBloc.changePassword,
                                            hintText: '**********',
                                            label: 'Password',
                                            icon: FontAwesomeIcons.eye);
                                      }),
                                  (snapshot.hasError)
                                      ? Text(
                                          snapshot.error,
                                          style: listTileTrailingText.copyWith(
                                              color: Colors.red),
                                        )
                                      : Container()
                                ],
                              );
                            })),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<bool>(
                            stream: authBloc.hideText,
                            builder: (context, snapshot) {
                              return Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  AppTextField(
                                      controller: confrimPassController
                                        ..text = authBloc.confirmpass != null
                                            ? authBloc.confirmpass
                                            : ''
                                        ..selection = TextSelection.collapsed(
                                            offset: authBloc.confirmpass != null
                                                ? authBloc.confirmpass.length
                                                : 0),
                                      onTap: () {
                                        authBloc.changeHideText(
                                            !authBloc.getHideText);
                                      },
                                      obsecureText:
                                          authBloc.getHideText == false
                                              ? false
                                              : true,
                                      onChanged: authBloc.changeConfirmPassword,
                                      hintText: '**********',
                                      label: 'Confirm Password',
                                      icon: FontAwesomeIcons.eye),
                                  (passwordController.text !=
                                          confrimPassController.text)
                                      ? Text(
                                          'password do not match',
                                          style: listTileTrailingText.copyWith(
                                              color: Colors.red),
                                        )
                                      : Container()
                                ],
                              );
                            })),
                    SizedBox(
                      height: 18,
                    ),
                    StreamBuilder<bool>(
                        initialData: false,
                        stream: authBloc.isValidSignUp,
                        builder: (context, snapshot) {
                          return StreamBuilder<String>(
                              stream: authBloc.usernameA,
                              builder: (context, username) {
                                return AppButton(
                                  color: !username.hasError
                                      ? primaryColor
                                      : primaryColor.withOpacity(0.5),
                                  text: 'Sign Up',
                                  onTap: !username.hasError
                                      ? () async {
                                          authBloc.changeButton(true);
                                          await authBloc.signUp();
                                          authBloc.changeLoginPress(true);
                                          authBloc.changeButton(false);
                                        }
                                      : () {
                                          authBloc.changeButton(true);
                                          MyAppDailog().responseDailog(
                                              "Please fill Correct Information",
                                              context,
                                              showClosebutton: true);
                                          authBloc.changeButton(false);
                                          print('Nothing Happens');
                                        },
                                );
                              });
                        }),
                    SizedBox(
                      height: 28,
                    ),
                    alreadyHaveAcc(),
                  ],
                ),
              )
            ],
          ),
          PopUpMessage().loginAndSignUpMsg(authBloc)
        ],
      ),
    ));
  }

  alreadyHaveAcc() {
    return Container(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Have an account? ", style: TextStyle(color: Colors.black)),
        TextSpan(text: 'Login', style: smallHeadingText(), recognizer: onTap)
      ])),
    );
  }

  firstlastName(AuthBloc authBloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder<String>(
            stream: authBloc.fname,
            builder: (context, snapshot) {
              return AppSmallTextField(
                onChanged: authBloc.changefname,
                label: 'First Name',
                hintText: 'John',
              );
            }),
        StreamBuilder<String>(
            stream: authBloc.lname,
            builder: (context, snapshot) {
              return AppSmallTextField(
                onChanged: authBloc.changelname,
                label: 'Last Name',
                hintText: 'Doe',
              );
            }),
      ],
    );
  }
}
