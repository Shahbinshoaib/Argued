import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:flutter/material.dart';
import 'package:ota_update/ota_update.dart';

// ignore: must_be_immutable
class DownloadScreen extends StatefulWidget {
  OtaEvent event;

  DownloadScreen({
    Key key,
    this.event,
  }) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: primaryColor),
              height: 250,
              width: SizeConfig.screenWidth * 0.8,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        // widget.notGranted
                        // ? "Please grant permission to download new App verison!"
                        'Downloading... ${widget.event.value}%',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    // (widget.notGranted)
                    //     ? AppSmallButton(
                    //         onTap: () {
                    //           setState(() {
                    //             widget.notGranted = false;
                    //           });
                    //           // updateApk(authBloc.newApkUrl);
                    //           updateApk('https://argued.com/argued-app.apk');
                    //         },
                    //         screenWidthPercentage: 0.4,
                    //         buttonColor: primaryTextColor,
                    //         buttonTextColor: Colors.black,
                    //         buttonText: 'Upgrade')
                    //     : Container(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }

  updateApk(String url) {
    try {
      OtaUpdate()
          .execute(url, destinationFilename: 'Agrued.apk')
          .listen((event) {
        setState(() {
          widget.event = event;
        });
      });
    } catch (e) {
      print('Failed to make OTA update. Details: $e');
    }
  }
}



