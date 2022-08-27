import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/LocationBloc.dart';
import 'package:argued/controller/groupBloc.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppDropDown.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppappBar.dart';
import 'package:argued/model/catergoryModel.dart';
import 'package:argued/model/countryModel.dart';
import 'package:argued/model/statesWithCItiesModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGroupScreen extends StatefulWidget {
  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  void initState() {
    var locationBloc = Provider.of<LocationBloc>(context, listen: false);
    var groupBloc = Provider.of<GroupBloc>(context, listen: false);
    locationBloc.getCountry();
    groupBloc.getCategorise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locationBloc = Provider.of<LocationBloc>(context);
    var groupBloc = Provider.of<GroupBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppAppBar(
        title: 'Create Group',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8,
              ),
              // UserCirle(profilePic: kTempImage,height: 80,width: 80,),
              // SizedBox(height: 8,),
              // Text("Upload Image")
              AppTextField(
                onChanged: groupBloc.changeName,
                label: "Group Name",
                hintText: 'name',
              ),
              SizedBox(
                height: 4,
              ),
              AppTextField(
                label: "Group Descritpion",
                hintText: 'description',
                onChanged: groupBloc.changeDescription,
              ),
              SizedBox(
                height: 4,
              ),
              StreamBuilder<CategoryModel>(
                  stream: groupBloc.catergories,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return AppDropDown(
                          disableHint: "Please wait Fetching Topics...",
                          label: "Select Topic",
                          itemList: [''],
                          onChange: null,
                          stream: null);
                    }
                    return AppDropDown(
                        label: "Select Topic",
                        hinttext: "Select Topic",
                        itemList:
                            snapshot.data.data.map((e) => e.name).toList(),
                        onChange: (name) {
                          snapshot.data.data.forEach((e) {
                            groupBloc.changeTopic(name);
                            if (e.name == name) {
                              groupBloc.changeSubCatergories(e.subcategories);
                              groupBloc
                                  .changeSubTopic(e.subcategories.first.name);
                              groupBloc.changeTopicId(e.id);
                              groupBloc
                                  .changeSubTopicId(e.subcategories.first.id);
                            }
                          });
                        },
                        stream: groupBloc.topic);
                  }),
              SizedBox(
                height: 4,
              ),
              StreamBuilder<List<Subcategory>>(
                  stream: groupBloc.subcatergories,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return AppDropDown(
                          disableHint: "Select Topic First",
                          label: "Select Sub Topic",
                          itemList: [''],
                          onChange: null,
                          stream: null);
                    }
                    return AppDropDown(
                        hinttext: 'Select Sub Topic',
                        label: "Select Sub Topic",
                        itemList: snapshot.data.map((e) => e.name).toList(),
                        onChange: (name) {
                          groupBloc.changeSubTopic(name);
                          snapshot.data.forEach((e) {
                            if (e.name == name) {
                              groupBloc.changeSubTopicId(e.id);
                            }
                          });
                        },
                        stream: groupBloc.subtopic);
                  }),
              StreamBuilder<CountryModel>(
                  stream: locationBloc.listOfcountries,
                  builder: (context, snapshot) {
                    List<String> _countriesNameList = List();
                    if (!snapshot.hasData) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: kbaseVerticalPadding),
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
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
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
                          padding: EdgeInsets.symmetric(
                              vertical: kbaseVerticalPadding),
                          child: AppDropDown(
                              disableHint: "Select Country First",
                              label: "Select State",
                              itemList: [''],
                              onChange: null,
                              stream: null));
                    }
                    if (snapshot.data == null) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: kbaseVerticalPadding),
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
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
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
                          padding: EdgeInsets.symmetric(
                              vertical: kbaseVerticalPadding),
                          child: AppDropDown(
                              disableHint: "Select State First",
                              label: "Select City",
                              itemList: [''],
                              onChange: null,
                              stream: null));
                    }
                    if (snapshot.data == null) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: kbaseVerticalPadding),
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
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: AppDropDown(
                            hinttext: 'Select States',
                            label: "Select States",
                            itemList: _cityList,
                            onChange: (name) {
                              locationBloc.changedefaultCities(name);
                              snapshot.data.forEach((c) {
                                if (c.name == name) {
                                  locationBloc.changedefaultCitiesId(c.id);
                                }
                              });
                            },
                            stream: locationBloc.defaultcities));
                  }),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: AppDropDown(
                      label: 'Audience',
                      itemList: ['Private', 'Public'],
                      onChange: groupBloc.changeAudience,
                      stream: groupBloc.audience)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppSmallButton(
                      onTap: () => Navigator.pop(context),
                      screenWidthPercentage: 0.4,
                      buttonColor: Colors.white,
                      buttonTextColor: primaryColor,
                      buttonText: 'Close'),
                  AppSmallButton(
                      onTap: () {
                        authBloc.changeButton(true);
                        groupBloc.createGroup(locationBloc, context, authBloc);
                      },
                      screenWidthPercentage: 0.4,
                      buttonColor:
                          (true) ? primaryColor : primaryColor.withOpacity(0.5),
                      buttonTextColor: Colors.white,
                      buttonText: 'Submit')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
