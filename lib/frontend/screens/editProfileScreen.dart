import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constantsList.dart';
import 'package:argued/controller/ProfileBloc.dart';
import 'package:argued/frontend/widgets/AppBottomSheet.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/frontend/widgets/AppDropDown.dart';
import 'package:argued/frontend/widgets/AppPhoneNumberField.dart';
import 'package:argued/main.dart';
import 'package:flutter/material.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPassController = TextEditingController();

  @override
  void initState() {
    var profBloc = Provider.of<ProfileBloc>(context, listen: false);
    profBloc.getProfile();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confrimPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var profileBloc = Provider.of<ProfileBloc>(context);
    List<String> countryName =
        kcountryList.map((c) => c.name).toList().toSet().toList();
    List<String> currencyName =
        kcountryList.map((c) => c.currencyName).toList().toSet().toList();
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
        child:  ListView(
            children: [
              AppIcon(),
              Padding(
                padding: const EdgeInsets.only(bottom: kbaseVerticalPadding),
                child: Text("Edit Profile", style: bigHeadingText()),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: AppDropDown(
                      label: 'Salutaion',
                      itemList: salutationList,
                      onChange: profileBloc.changeSalutation,
                      stream: profileBloc.salutation)),
              firstlastName(profileBloc),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                child: StreamBuilder<String>(
                    stream: profileBloc.username,
                    builder: (context, snapshot) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Focus(
                            onFocusChange: (focus) {
                              if (!focus) {
                                profileBloc.checkUserName();
                              }
                            },
                            child: AppTextField(
                              iconColor:
                                  snapshot.hasError ? Colors.red : primaryColor,
                              icon:
                                  snapshot.hasError ? Icons.clear : Icons.check,
                              controller: TextEditingController()
                                ..text = !snapshot.hasError ? snapshot.data : ''
                                ..selection = TextSelection.collapsed(
                                    offset: snapshot.hasData
                                        ? snapshot.data.length
                                        : 0),
                              label: 'Username',
                              hintText: 'James',
                              onChanged: profileBloc.changeUsername,
                            ),
                          ),
                          (snapshot.hasError)
                              ? Text(
                                  snapshot.error,
                                  style: listTileTrailingText.copyWith(
                                      color: Colors.red),
                                )
                              : Container()
                        ],
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                child: StreamBuilder<DateTime>(
                    stream: profileBloc.dob,
                    builder: (context, snapshot) {
                      DateTime _date = DateTime(1990, 3, 15);
                      return AppTextField(
                        controller: TextEditingController()
                          ..text = snapshot.hasData
                              ? snapshot.data.toString().substring(0, 10)
                              : '',
                        label: 'Date of Birth',
                        hintText: '03-15-1990',
                        icon: Icons.arrow_drop_down,
                        size: 30,
                        enable: false,
                        onTap: () async {
                          var pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _date,
                              firstDate: DateTime(1947),
                              lastDate: DateTime.now());
                          profileBloc.changeDOB(pickedDate);
                        },
                      );
                    }),
              ),
              AppPhoneNumberField(),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: StreamBuilder<String>(
                      stream: profileBloc.password,
                      builder: (context, snapshot) {
                        return Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            StreamBuilder<bool>(
                                stream: profileBloc.hideText,
                                builder: (context, show) {
                                  return AppTextField(
                                      controller: passwordController
                                        ..text = profileBloc.pass != null
                                            ? profileBloc.pass
                                            : ''
                                        ..selection = TextSelection.collapsed(
                                            offset: profileBloc.pass != null
                                                ? profileBloc.pass.length
                                                : 0),
                                      onTap: () {
                                        profileBloc.changeHideText(
                                            !profileBloc.getHideText);
                                      },
                                      obsecureText:
                                          profileBloc.getHideText == false
                                              ? false
                                              : true,
                                      onChanged: profileBloc.changePassword,
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
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: StreamBuilder<bool>(
                      stream: profileBloc.hideText,
                      builder: (context, snapshot) {
                        return Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            AppTextField(
                                controller: confrimPassController
                                  ..text = profileBloc.confirmpass != null
                                      ? profileBloc.confirmpass
                                      : ''
                                  ..selection = TextSelection.collapsed(
                                      offset: profileBloc.confirmpass != null
                                          ? profileBloc.confirmpass.length
                                          : 0),
                                onTap: () {
                                  profileBloc
                                      .changeHideText(!profileBloc.getHideText);
                                },
                                obsecureText: profileBloc.getHideText == false
                                    ? false
                                    : true,
                                onChanged: profileBloc.changeConfrimPassword,
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
              Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: AppDropDown(
                      label: 'Nationality',
                      itemList: countryName,
                      onChange: profileBloc.changeCountry,
                      stream: profileBloc.country)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: AppDropDown(
                      label: 'Currency',
                      itemList: currencyName,
                      onChange: profileBloc.changeCurrency,
                      stream: profileBloc.currency)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: AppDropDown(
                      label: 'Occupation',
                      itemList: occupationList,
                      onChange: profileBloc.changeOccupation,
                      stream: profileBloc.occupation)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: AppDropDown(
                            widthPercentage: 0.43,
                            label: 'Marital Status',
                            itemList: maritalStatusList,
                            onChange: profileBloc.changeMaritalStatus,
                            stream: profileBloc.maritalStatus)),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: AppDropDown(
                            widthPercentage: 0.43,
                            label: 'Religion',
                            itemList: religionList,
                            onChange: profileBloc.changeReligion,
                            stream: profileBloc.religion)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                child: AppTextField(
                  label: 'UI Display Language',
                  hintText: 'English',
                  icon: Icons.arrow_drop_down,
                  size: 30,
                  enable: false,
                  onTap: () {
                    print('hello');
                  },
                ),
              ),
              Row(
                children: [
                  StreamBuilder<bool>(
                      stream: profileBloc.showMyOccupation,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        return Checkbox(
                            activeColor: Colors.red.shade700,
                            value: snapshot.data,
                            onChanged: profileBloc.changeShowMyOccupation);
                      }),
                  Text(
                    'Show My Occupation in Video',
                    style: listTileTitleText,
                  )
                ],
              ),
              Row(
                children: [
                  StreamBuilder<bool>(
                      stream: profileBloc.showGeographicalInterest,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        return Checkbox(
                            activeColor: Colors.red.shade700,
                            value: snapshot.data,
                            onChanged: profileBloc.changeGeographicalInterest);
                      }),
                  Text(
                    'Enable Geographical of Interest',
                    style: listTileTitleText,
                  )
                ],
              ),
              bottomBlock(
                'Topics Of Interest',
                () {
                  AppBottomSheet().topicOfInterest(context);
                },
              ),
              bottomBlock('Geographical Location of Interest', () {
                AppBottomSheet().geoInterest(context);
              }),
              bottomBlock(
                'Set Default Location For New Video',
                () {
                  AppBottomSheet().defaultLocationOfVideo(context);
                },
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppSmallButton(
                      onTap: () => Navigator.pop(context),
                      screenWidthPercentage: 0.4,
                      buttonColor: Colors.white,
                      buttonTextColor: primaryColor,
                      buttonText: 'Back'),
                  AppSmallButton(
                            onTap: (true)
                                ? () {
                                    authBloc.changeButton(true);
                                    profileBloc.editProfile();
                                    MyAppDailog().appResponseDailog(context,
                                        profileBloc.profileResponse, 2);
                                    authBloc.changeButton(false);
                                    print('available');
                                  }
                                : () {
                                    print('Not available');
                                  },
                            screenWidthPercentage: 0.4,
                            buttonColor: (true)
                                ? primaryColor
                                : primaryColor.withOpacity(0.5),
                            buttonTextColor: Colors.white,
                            buttonText: 'Submit'),
                      
                ],
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  bottomBlock(String text, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red.shade700, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              text,
              style: TextStyle(color: Colors.red.shade700, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  firstlastName(ProfileBloc profileBloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder<String>(
            stream: profileBloc.firstname,
            builder: (context, snapshot) {
              return AppSmallTextField(
                controller: TextEditingController()
                  ..text = snapshot.hasData ? snapshot.data : ''
                  ..selection = TextSelection.collapsed(
                      offset: snapshot.hasData ? snapshot.data.length : 0),
                onChanged: profileBloc.changefirstname,
                label: 'First Name',
                hintText: 'John',
              );
            }),
        StreamBuilder<String>(
            stream: profileBloc.lastname,
            builder: (context, snapshot) {
              return AppSmallTextField(
                controller: TextEditingController()
                  ..text = snapshot.hasData ? snapshot.data : ''
                  ..selection = TextSelection.collapsed(
                      offset: snapshot.hasData ? snapshot.data.length : 0),
                onChanged: profileBloc.changeLastName,
                label: 'Last Name',
                hintText: 'Doe',
              );
            }),
      ],
    );
  }
}
