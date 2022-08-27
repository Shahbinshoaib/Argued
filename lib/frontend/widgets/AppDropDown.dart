import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  final String label;
  final String disableHint;
  final String hinttext;
  final List<String> itemList;
  final Function onChange;
  final Stream<String> stream;
  final double widthPercentage;

  const AppDropDown(
      {this.disableHint = '',
      this.widthPercentage = 1,
      this.hinttext,
      @required this.label,
      @required this.itemList,
      @required this.onChange,
      @required this.stream});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            label,
            style: smallHeadingText(),
          ),
        ),
        StreamBuilder<String>(
            stream: stream,
            builder: (context, snapshot) {
              return Container(
                  width: SizeConfig.screenWidth * widthPercentage,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton(
                        hint: Container(
                          width: 150, //and here
                          child: Text(
                            hinttext ?? "",
                            style: listTileSubTitleText,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        disabledHint: Text(
                          disableHint,
                          style: listTileSubTitleText,
                        ),
                        elevation: 5,
                        isExpanded: true,
                        underline: Container(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: primaryColor,
                          size: 30,
                        ),
                        value:
                            snapshot.data == 'Disable' ? null : snapshot.data,
                        items: itemList.map((String item) {
                          return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: dropDownMenuText,
                              ));
                        }).toList(),
                        onChanged:
                            snapshot.data == 'Disable' ? null : onChange),
                  ));
            }),
      ],
    );
  }
}
