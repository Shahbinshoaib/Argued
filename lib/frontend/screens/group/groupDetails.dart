import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/groupBloc.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppCard.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppUserProfileCircle.dart';
import 'package:argued/model/groupDetailModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupDetails extends StatefulWidget {
  final String groupId;

  const GroupDetails({Key key, @required this.groupId}) : super(key: key);
  @override
  _GroupDetailsState createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  TextEditingController _username = TextEditingController();
  FocusNode _node = FocusNode();
  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var groupBloc = Provider.of<GroupBloc>(context);
    return SingleChildScrollView(
        child: StreamBuilder<GroupDetailsModel>(
            stream: groupBloc.groupDetails,
            builder: (context, snapshot) {
              if (snapshot.error == 'Disable') {
                return Center(
                  child: Text(
                    "Error Try Again!",
                    style: listTileSubTitleText,
                  ),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var d = snapshot.data.data[0];
              var m = getMonth(d.createdAt.month);
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UserCirle(
                            profilePic: d.profilePic ?? kTempImage,
                            height: 100,
                            width: 100,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            d.name,
                            style: listTileTitleText,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            d.description ?? "",
                            style: listTileSubTitleText,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Members : ',
                                style:
                                    listTileTitleText.copyWith(fontSize: 14)),
                            TextSpan(
                                text: d.numberOfMembers.toString(),
                                style: listTileTitleText.copyWith(
                                    fontSize: 14, color: Colors.red)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Since : ',
                                style:
                                    listTileTitleText.copyWith(fontSize: 14)),
                            TextSpan(
                                text:
                                    '$m ${d.createdAt.day} ${d.createdAt.year}',
                                style: listTileTitleText.copyWith(
                                    fontSize: 14, color: Colors.red)),
                          ])),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        color: primaryTextColor,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Creator : ',
                                style: listTileTitleText.copyWith(
                                    fontSize: 14, color: primaryColor)),
                            TextSpan(
                                text: d.createdBy.username,
                                style: listTileTitleText.copyWith(
                                    fontSize: 14, color: primaryColor)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Group visibility : ',
                                style: listTileTitleText.copyWith(
                                    fontSize: 14, color: primaryColor)),
                            TextSpan(
                                text: d.audience??"",
                                style: listTileTitleText.copyWith(
                                    fontSize: 14, color: primaryColor)),
                          ])),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        color: primaryTextColor,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      heading('Geographic Relevance :'),
                      data('Country', d.countryName??"-------"),
                      data('State', d.stateName??"-------"),
                      data('City', d.cityName??"-------"),
                      heading('Topic Relevance :'),
                      data('Topic', d.topicRelevance.split(',')[0].trim()?? ""),
                      data('Sub Topic', d.topicRelevance.split(',')[1].trim()??""),
                      heading('Nominations:'),
                      data('Nomination', 'No'),
                      heading('Group Join Requests:'),
                      data('Requests', 'No'),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        color: primaryTextColor,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Stack(
                        children: [
                          AppTextField(
                            node: _node,
                            controller: _username,
                            radius: 24,
                            label: 'Invite Others',
                            hintText: 'Enter Username',
                          ),
                          Positioned(
                            bottom: 2,
                            right: 1.2,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: primaryColor,
                              child: IconButton(
                                icon: Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  _node.unfocus();
                                  if (_username.text.isNotEmpty) {
                                    groupBloc.inviteUsers(_username.text,
                                        widget.groupId, context);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AppButton(
                        text: 'Save',
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  !snapshot.hasData
                      ? Container()
                      : Positioned(
                          right: -4,
                          top: -4,
                          child: IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Colors.black,
                                size: 25,
                              ),
                              onPressed: () => Navigator.pop(context)))
                ],
              );
            }));
  }

  heading(String text) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Text(
            text,
            style: listTileTitleText.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }

  data(String label, String value) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: listTileSubTitleText.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: listTileSubTitleText,
          ),
        ],
      ),
    );
  }
}
