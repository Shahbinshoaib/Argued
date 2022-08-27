import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/frontend/widgets/AppUserProfileCircle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function onTap;
  final String profilePic;

  const AppAppBar({Key key, @required this.title,@required this.onTap, this.profilePic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: appBarTitleText(),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onTap,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, kEditProfileScreen);
          },
          child: Column(
            
            children: [
              SizedBox(height: 4,),
              Expanded(child: UserCirle(profilePic: profilePic??authBloc.getLoginResponse.profilePic ,height: 20,width: 50,)),
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
