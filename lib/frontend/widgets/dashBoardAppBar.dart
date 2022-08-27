import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/LocationBloc.dart';
import 'package:argued/frontend/widgets/AppBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppUserProfileCircle.dart';

class DashboardAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    var locationBloc = Provider.of<LocationBloc>(context);
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        'DashBoard',
        style: appBarTitleText(),
      ),
      // leading: Container(),
      actions: [
        Icon(
          Icons.notifications,
          color: primaryColor,
          size: 40,
        ),
        SizedBox(
          width: 15,
        ),
        IconButton(
            icon: Icon(Icons.tune, color: primaryColor, size: 40),
            onPressed: () {
              locationBloc.getCountry();
              AppBottomSheet().changeMyInterest(context);
            }),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, kEditProfileScreen);
          },
          child: Column(
            children: [
              SizedBox(height: 4),
              Expanded(
                child: UserCirle(
                  profilePic: authBloc.getLoginResponse.profilePic,
                  height: 20,
                  width: 50,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}
