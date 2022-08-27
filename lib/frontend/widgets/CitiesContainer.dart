import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/LocationBloc.dart';
import 'package:argued/frontend/widgets/AppDropDown.dart';
import 'package:argued/model/statesWithCItiesModel.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class CitiesContainer extends StatefulWidget {
  @override
  _CitiesContainerState createState() => _CitiesContainerState();
}

class _CitiesContainerState extends State<CitiesContainer> {
  @override
  Widget build(BuildContext context) {
    var countryBloc = Provider.of<LocationBloc>(context);
    return StreamBuilder<List<City>>(
        stream: countryBloc.listOfcities,
        builder: (context, snap) {
          if (snap.hasData) {
            final _items =
                snap.data.map((e) => MultiSelectItem(e.id, e.name)).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Select Cities",
                    style: smallHeadingText(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.2)),
                    child: StreamBuilder<List<String>>(
                        stream: countryBloc.listOfcitiesName,
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: !snapshot.hasData
                                    ? Container(
                                        padding: EdgeInsets.only(left: 14),
                                        child: Text(
                                          'Select city',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 14),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.only(left: 12),
                                        child: Wrap(
                                            children: snapshot.data.map((city) {
                                          return Chip(
                                              label: Text(city,
                                                  style:
                                                      TextStyle(fontSize: 14)));
                                        }).toList()),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 12, 10, 12),
                                child: GestureDetector(
                                    onTap: () async {
                                      List<String> cityName = [];
                                      await showModalBottomSheet(
                                          enableDrag: false,
                                          isDismissible: false,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (ctx) {
                                            return MultiSelectBottomSheet(
                                              items: _items,
                                              initialValue: null,
                                              onConfirm: (values) {
                                                for (int i = 0;
                                                    i < _items.length;
                                                    i++) {
                                                  if (values.contains(
                                                      _items[i].value)) {
                                                    cityName
                                                        .add(_items[i].label);
                                                  }
                                                }
                                                countryBloc
                                                    .changeListOfCitiesId(
                                                        values);
                                                countryBloc
                                                    .changeListOfCitiesName(
                                                        cityName);
                                              },
                                              maxChildSize: 0.8,
                                            );
                                          });
                                    },
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 30,
                                      color: primaryColor,
                                    )),
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ],
            );
          }
          return Padding(
              padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
              child: AppDropDown(
                  disableHint: 'Select State First',
                  label: "Select City",
                  itemList: [''],
                  onChange: null,
                  stream: null));
        });
  }
}
