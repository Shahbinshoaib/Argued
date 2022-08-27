 import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:flutter/material.dart';

class PopUpMessage {
  loginAndSignUpMsg(AuthBloc authBloc) {
    return Positioned(
      top: 30,
      right: 0,
      left: 0,
      child: StreamBuilder<bool>(
        initialData: false,
          stream: authBloc.loginPress,
          builder: (context, snapshot) {
            if (snapshot.data) {
              return StreamBuilder<Map>(
                  stream: authBloc.response,
                  builder: (context, response) {
                    if (!response.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: primaryColor,
                        ),
                      );
                    }
                    if (response.data['key'] == "user.login_success") {
                      authBloc.saveCredential();
                      Future.delayed(Duration(milliseconds: 1000))
                          .then((value) {
                        authBloc.changeLoginPress(false);
                        Navigator.pushReplacementNamed(context, kViewerDashBoardScreen);
                      });
                      return MyAppDailog()
                          .loginDailog(response.data['message'], context);
                    }
                    if (response.data['key'] == "user.login_wait"){
                      Future.delayed(Duration(seconds: 10))
                        .then((value) => authBloc.changeLoginPress(false));
                    return MyAppDailog()
                        .loginDailog(response.data['message'], context);  
                    }
                    if (response.data['key'] == "user.verified-user"){
                      Future.delayed(Duration(seconds: 2))
                        .then((value) => authBloc.changeLoginPress(false));
                    return MyAppDailog()
                        .loginDailog(response.data['message'], context);  
                    }

                    Future.delayed(Duration(seconds: 5))
                        .then((value) => authBloc.changeLoginPress(false));
                    return MyAppDailog()
                        .loginDailog(response.data['message'], context);
                  });
            }

            return Container();
          }),
    );
  }
}
