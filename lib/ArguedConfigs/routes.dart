import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/frontend/screens/group/GroupChatScreen.dart';
import 'package:argued/frontend/screens/contact/InviteContactScreen.dart';
import 'package:argued/frontend/screens/ViewerDashBoardScreen.dart';
import 'package:argued/frontend/screens/contact/chatScreen.dart';
import 'package:argued/frontend/screens/group/createGroupScreen.dart';
import 'package:argued/frontend/screens/group/groupScreen.dart';
import 'package:argued/frontend/screens/editProfileScreen.dart';
import 'package:argued/frontend/screens/contact/contactScreen.dart';
import 'package:argued/frontend/screens/loginScreen.dart';
import 'package:argued/frontend/screens/signUpScreen.dart';
import 'package:argued/frontend/screens/splashScreen.dart';
import 'package:argued/frontend/screens/watchlist/singleOpinionScreen.dart';
import 'package:argued/frontend/screens/watchlist/userOpinionScreen.dart';
import 'package:argued/frontend/screens/watchlist/watchListScreen.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case kSignUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case kLoginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case kSplashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case kViewerDashBoardScreen:
        return MaterialPageRoute(builder: (context) => ViewerDashBoardScreen());
      case kEditProfileScreen:
        return MaterialPageRoute(builder: (context) => EditProfileScreen());
      case kGroupScreen:
        return MaterialPageRoute(builder: (context) => GroupScreen());
      case kContactScreen:
        return MaterialPageRoute(builder: (context) => ContactScreen());
      case kWatchListScreen:
        return MaterialPageRoute(builder: (context) => WatchListScreen());
      case kSingleOpinionScreen:
        return MaterialPageRoute(
            builder: (context) => SingleOpinion(
                  videoName: settings.arguments.toString().split(',')[0],
                  videoUrl: settings.arguments.toString().split(',')[1],
                  hostId: settings.arguments.toString().split(',')[2],
                ));
      case kChatScreen:
        return MaterialPageRoute(
            builder: (context) => ChatScreen(
                  userName: settings.arguments.toString().split(',')[0],
                  roomId: settings.arguments.toString().split(',')[1],
                ));
      case kUserOpinionScreen:
        return MaterialPageRoute(
            builder: (context) => UserOpinionScreen(
                  name: settings.arguments.toString().split(',')[0],
                  profilePic: settings.arguments.toString().split(',')[1],
                ));
      case kInviteContactScreen:
        return MaterialPageRoute(builder: (context) => InviteContactScreen());
      case kCreateGroupScreen:
        return MaterialPageRoute(builder: (context) => CreateGroupScreen());
      case kGroupChatScreen:
        return MaterialPageRoute(
            builder: (context) => GroupChatScreen(
                  groupName: settings.arguments.toString().split(',')[0],
                  groupId: settings.arguments.toString().split(',')[1],
                ));

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}


