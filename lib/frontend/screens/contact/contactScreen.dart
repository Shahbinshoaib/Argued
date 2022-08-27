import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/contactBloc.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppappBar.dart';
import 'package:argued/model/contactModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    var contactBloc = Provider.of<ContactBloc>(context, listen: false);
    contactBloc.getContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var contactBloc = Provider.of<ContactBloc>(context);
    return Scaffold(
        appBar: AppAppBar(
          title: 'My Contacts',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
            onPressed: () =>
                Navigator.pushNamed(context, kInviteContactScreen)),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                showLabel: false,
                onChanged: contactBloc.changeSearchQuery,
                hintText: 'Find my contacts',
                icon: Icons.search,
                iconColor: primaryTextColor,
                size: 30,
                onTap: () {
                  print("search");
                },
              ),
              Expanded(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: StreamBuilder<ContactModel>(
                        stream: contactBloc.contacts,
                        builder: (context, snapshot) {
                          if(snapshot.error == 'loading'){
                            return Center(
                              child:CircularProgressIndicator()
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text(
                                "No Contact Yet",
                                style: listTileSubTitleText,
                              ),
                            );
                          }
                          var data = snapshot.data.data;
                          return StreamBuilder<String>(
                              stream: contactBloc.searchQuery,
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data != "") {
                                  return ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      var c = data[index];
                                      if (c.user.username
                                          .toLowerCase()
                                          .contains(
                                              snapshot.data.toLowerCase())) {
                                        return GestureDetector(
                                          onTap: () {
                                            contactBloc.getChatRoom(c.room);
                                            Navigator.pushNamed(
                                                context, kChatScreen,
                                                arguments:
                                                    "${c.user.username},${c.room}");
                                          },
                                          child: contactViewContainer(
                                              c.user.profilePic,
                                              c.user.username,
                                              c.lastMessageMobile.message,
                                              c.unreadCount,
                                              c.lastMessageMobile.createdAt),
                                        );
                                      }
                                      return Container();
                                    },
                                  );
                                }
                                return ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    var c = data[index];
                                    return GestureDetector(
                                      onTap: () {
                                        contactBloc.getChatRoom(c.room);
                                        Navigator.pushNamed(
                                            context, kChatScreen,
                                            arguments:
                                                "${c.user.username},${c.room}");
                                      },
                                      child: contactViewContainer(
                                          c.user.profilePic,
                                          c.user.username,
                                          c.lastMessageMobile.message,
                                          c.unreadCount,
                                          c.lastMessageMobile.createdAt),
                                    );
                                  },
                                );
                              });
                        })),
              ),
            ],
          ),
        ));
  }

  contactViewContainer(String profilePic, String username, String lastmsg,
      int unreadCount, DateTime time) {
    return ListTile(
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: profilePic??kTempImage,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Center(child: Icon(Icons.error)),
        ),
      ),
      title: Text(
        username,
        style: listTileTitleText,
      ),
      subtitle: Text(
        lastmsg??"",
        style: listTileSubTitleText,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getFormatedTime(time)??"",
            style: listTileTrailingText,
          ),
          SizedBox(height: 2),
          (unreadCount > 0)
              ? CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Center(
                    child: Text(
                      "$unreadCount"??"",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : SizedBox(
                  height: 0,
                  width: 0,
                )
        ],
      ),
    );
  }
}

String getFormatedTime(DateTime time) {
  var t;
  if (time.hour < 10) {
    if (time.minute < 10) {
      t = "0${time.hour}:0${time.minute}";
    } else {
      t = "0${time.hour}:${time.minute}";
    }
  } else if (time.minute < 10) {
    t = "${time.hour}:0${time.minute}";
  } else {
    t = "${time.hour}:${time.minute}";
  }
  return t;
}
