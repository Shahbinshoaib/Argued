import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/controller/LocationBloc.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/frontend/widgets/AppDropDown.dart';
import 'package:argued/frontend/widgets/AppNumberField.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/CitiesContainer.dart';
import 'package:argued/frontend/widgets/TopicOfInterest.dart';
import 'package:argued/main.dart';
import 'package:argued/model/countryModel.dart';
import 'package:argued/model/statesWithCItiesModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBottomSheet {
  verifyCode(context, onTap) {
    showModalBottomSheet(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
        ),
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return VerificationCode(
            onTap: onTap,
          );
        });
  }

  resetUserNamePassword(context, onTap) {
    showModalBottomSheet(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
        ),
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return ResetUNamePassword(
            onTap: onTap,
          );
        });
  }

  changeMyInterest(context) {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return ChangeMyInterest();
        });
  }

  geoInterest(context) {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return GeographicalInterest();
        });
  }

  topicOfInterest(context) {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return TopicOfInterest();
        });
  }

  defaultLocationOfVideo(context) {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return DefaultLocation();
        });
  }
}

class DefaultLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locationBloc = Provider.of<LocationBloc>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Default Location Of New Video",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  )),
              Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<CountryModel>(
              stream: locationBloc.listOfcountries,
              builder: (context, snapshot) {
                List<String> _countriesNameList = List();
                if (!snapshot.hasData) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                      child: AppDropDown(
                          disableHint: "Please wait Fetching Countries...",
                          label: "Select Country",
                          itemList: [''],
                          onChange: null,
                          stream: null));
                }
                snapshot.data.data.forEach((c) {
                  _countriesNameList.add(c.name);
                });
                return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: AppDropDown(
                        hinttext: 'Select Country',
                        label: "Select Country",
                        itemList: _countriesNameList,
                        onChange: (value) async {
                          if (value == 'Global') {
                            locationBloc.changedefaultCountry(value);
                            locationBloc.changeDefaultListOfStates(null);
                            locationBloc.changedefaultCities(null);
                          }
                          locationBloc.changedefaultCountry(value);
                          locationBloc.getDefaultStatesWithCities();
                        },
                        stream: locationBloc.defaultcountry));
              }),
          StreamBuilder<StatesModel>(
              stream: locationBloc.defaultlistOfStates,
              builder: (context, snapshot) {
                List<String> _statesList = List();
                if (!snapshot.hasData) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                      child: AppDropDown(
                          disableHint: "Select Country First",
                          label: "Select State",
                          itemList: [''],
                          onChange: null,
                          stream: null));
                }
                if (snapshot.data == null) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                      child: AppDropDown(
                          disableHint: "",
                          label: "",
                          itemList: [''],
                          onChange: null,
                          stream: null));
                }

                snapshot.data.data.forEach((c) {
                  _statesList.add(c.name);
                });
                return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: AppDropDown(
                        hinttext: 'Select States',
                        label: "Select States",
                        itemList: _statesList,
                        onChange: (v) {
                          locationBloc.changedefaultStates(v);
                          locationBloc.getDefaultCities();
                        },
                        stream: locationBloc.defaultstates));
              }),
          StreamBuilder<List<City>>(
              stream: locationBloc.defaultlistOfcities,
              builder: (context, snapshot) {
                List<String> _cityList = List();
                if (!snapshot.hasData) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                      child: AppDropDown(
                          disableHint: "Select State First",
                          label: "Select City",
                          itemList: [''],
                          onChange: null,
                          stream: null));
                }
                if (snapshot.data == null) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                      child: AppDropDown(
                          disableHint: "",
                          label: "",
                          itemList: [''],
                          onChange: null,
                          stream: null));
                }
                snapshot.data.forEach((c) {
                  _cityList.add(c.name);
                });
                return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: AppDropDown(
                        hinttext: 'Select States',
                        label: "Select States",
                        itemList: _cityList,
                        onChange: locationBloc.changedefaultCities,
                        stream: locationBloc.defaultcities));
              }),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Save Default Location',
            onTap: () {
              // locationBloc.updateProfile();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class GeographicalInterest extends StatefulWidget {
  @override
  _GeographicalInterestState createState() => _GeographicalInterestState();
}

class _GeographicalInterestState extends State<GeographicalInterest> {
  @override
  Widget build(BuildContext context) {
    var countryBloc = Provider.of<LocationBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    var dashboardBloc = Provider.of<DashboardBloc>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Geograhpical Location Of Interest",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  )),
              Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<CountryModel>(
              stream: countryBloc.listOfcountries,
              builder: (context, snapshot) {
                List<String> _countriesNameList = List();
                if (!snapshot.hasData) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                      child: AppDropDown(
                          disableHint: "Please wait Fetching Countries...",
                          label: "Select Country",
                          itemList: [''],
                          onChange: null,
                          stream: null));
                }
                snapshot.data.data.forEach((c) {
                  _countriesNameList.add(c.name);
                });
                return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: AppDropDown(
                        hinttext: 'Select country',
                        label: "Select Country",
                        itemList: _countriesNameList,
                        onChange: (value) async {
                          countryBloc.changeCountry(value);
                          countryBloc.getStatesWithCities();
                        },
                        stream: countryBloc.country));
              }),
          StreamBuilder<StatesModel>(
              stream: countryBloc.listOfStatesWithCities,
              builder: (context, snapshot) {
                List<String> _statesList = List();
                if (!snapshot.hasData) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                      child: AppDropDown(
                          disableHint: "Select Country First",
                          label: "Select State",
                          itemList: [''],
                          onChange: null,
                          stream: null));
                }
                snapshot.data.data.forEach((c) {
                  _statesList.add(c.name);
                });
                return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: AppDropDown(
                        hinttext: "Select States",
                        label: "Select States",
                        itemList: _statesList,
                        onChange: (v) {
                          countryBloc.changeStates(v);
                          countryBloc.getCities();
                        },
                        stream: countryBloc.states));
              }),
          CitiesContainer(),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Apply Filter',
            onTap: () async {
              authBloc.changeButton(true);
              var response = await countryBloc.updateProfile();
              dashboardBloc.getMostWatchedTopic();
              dashboardBloc.getInterestingToYou();
              MyAppDailog().responseDailog(response['message'], context);
              authBloc.changeButton(false);
              Future.delayed(Duration(milliseconds: 600)).then((value) {
                Navigator.pop(context);
                Navigator.pop(context);
              });
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class ChangeMyInterest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Change my Interests",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  )),
              Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Topic Of Interest',
            onTap: () {
              AppBottomSheet().topicOfInterest(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Geographical Locations Of Interest',
            onTap: () {
              AppBottomSheet().geoInterest(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Set Default Location For New Video',
            onTap: () {
              AppBottomSheet().defaultLocationOfVideo(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class VerificationCode extends StatelessWidget {
  Function onTap;
  VerificationCode({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 4,
          ),
          Center(
            child: Container(
              height: 7,
              width: SizeConfig.screenWidth * 0.2,
              decoration: BoxDecoration(
                  color: primaryTextColor,
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: Text(
              'Enter 4 Digit Code',
              style: bigHeadingText(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: Text(
              "Enter the 4 digit code recieved on your email",
              style: normalText(),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: AppNumberField(),
          ),
          SizedBox(
            height: 25,
          ),
          AppButton(text: 'Continue', onTap: onTap),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ResetUNamePassword extends StatelessWidget {
  Function onTap;
  ResetUNamePassword({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 4,
          ),
          Center(
            child: Container(
              height: 7,
              width: SizeConfig.screenWidth * 0.2,
              decoration: BoxDecoration(
                  color: primaryTextColor,
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: Text(
              'Reset username or password',
              style: bigHeadingText(),
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
              child: userNameOrPass()),
          resetUserNamePassword(),
        ],
      ),
    );
  }

  resetUserNamePassword() {
    return StreamBuilder<bool>(
        stream: authBloc.resetCredential,
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                snapshot.data == true
                    ? 'We just need your register Email to send you your Username reset instructions'
                    : 'We just need your register Email to send you your Password reset instructions',
                style: listTileSubTitleText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              AppTextField(
                hintText: 'johndoe@email.com',
                label: 'Email',
                onChanged: authBloc.changeEmail,
              ),
              SizedBox(
                height: 16,
              ),
              AppButton(
                text: 'Reset',
                onTap: snapshot.data == true
                    ? () async {
                        await authBloc.resetUserCredential(false);
                        Navigator.pop(context);
                        authBloc.changeLoginPress(true);
                      }
                    : () async {
                        await authBloc.resetUserCredential(true);
                        Navigator.pop(context);
                        authBloc.changeLoginPress(true);
                      },
              ),
              SizedBox(
                height: 12,
              )
            ],
          );
        });
  }

  userNameOrPass() {
    return StreamBuilder<bool>(
        stream: authBloc.resetCredential,
        builder: (context, snapshot) {
          return Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 1)),
                      child: GestureDetector(
                        onTap: () {
                          authBloc.changeResetCredential(true);
                        },
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: (snapshot.data == true)
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor),
                                  )
                                : Container(),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      'Forgot Username',
                      style: normalText(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 1)),
                      child: GestureDetector(
                        onTap: () {
                          authBloc.changeResetCredential(false);
                        },
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: (snapshot.data == false)
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor),
                                  )
                                : Container(),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      'Forgot Password',
                      style: normalText(),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}
