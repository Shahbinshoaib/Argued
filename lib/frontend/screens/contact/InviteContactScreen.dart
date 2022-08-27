import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/contactBloc.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppappBar.dart';
import 'package:argued/model/findCOntactModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InviteContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var contactBloc = Provider.of<ContactBloc>(context);
    return Scaffold(
        appBar: AppAppBar(
          title: 'Find Contacts',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Column(
            children: [
              AppTextField(
                showLabel: false,
                onChanged: contactBloc.changeSearchContact,
                hintText: 'Invite Contacts',
                icon: Icons.search,
                iconColor: primaryTextColor,
                size: 30,
                onTap: () {
                  print("search");
                },
              ),
              SizedBox(
                height: 4,
              ),
              Expanded(
                  child: StreamBuilder<FindContactModel>(
                      stream: contactBloc.findContacts,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.data.length,
                              itemBuilder: (context, index) {
                                var d = snapshot.data.data[index];
                                return contactView(
                                  d.profilePic,
                                  d.username,
                                  () {
                                    contactBloc.addToContact(d.username);
                                    MyAppDailog().appResponseDailog(
                                        context, contactBloc.addContact, 1);
                                  },
                                );
                              });
                        }

                        return Center(
                          child: Text(
                            snapshot.error ?? "",
                            style: listTileSubTitleText,
                          ),
                        );
                      }))
            ],
          ),
        ));
  }

  contactView(String profilePic, String userName, Function onTap) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 4,
              ),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: primaryTextColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                    child: (profilePic == null)
                        ? Center(
                            child: Icon(
                            Icons.person,
                            color: primaryColor,
                            size: 26,
                          ))
                        : CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: profilePic,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Center(child: Icon(Icons.error)),
                          )),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  userName ?? '',
                  style: listTileTitleText.copyWith(fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 16,
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ))),
              ),
              SizedBox(
                width: 4,
              ),
            ],
          ),
        ));
  }
}
