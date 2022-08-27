import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/watchListBloc.dart';
import 'package:argued/frontend/widgets/AppOpinionConatiner.dart';
import 'package:argued/frontend/widgets/AppappBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserOpinionScreen extends StatefulWidget {
  final String name;
  final String profilePic;

  const UserOpinionScreen({Key key, this.name, this.profilePic = kTempImage})
      : super(key: key);
  @override
  _UserOpinionScreenState createState() => _UserOpinionScreenState();
}

class _UserOpinionScreenState extends State<UserOpinionScreen> {
  @override
  void initState() {
    // var watchListBloc = Provider.of<WatchListBloc>(context, listen: false);
    // watchListBloc.getWatchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watchListBloc = Provider.of<WatchListBloc>(context);

    return Scaffold(
        appBar: AppAppBar(
          profilePic: widget.profilePic,
          title: widget.name,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: StreamBuilder<Map<dynamic, dynamic>>(
              stream: watchListBloc.userOpinon,
              builder: (context, snapshot) {
                if (snapshot.error == 'Disable') {
                  return Center(
                      child: Text(
                    'Host has No videos to show',
                    style: listTileSubTitleText,
                  ));
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List opinions = snapshot.data['data']["opinions"];
                return ListView.builder(
                    itemCount: opinions.length,
                    itemBuilder: (context, i) {
                      var o = opinions[i];
                      return OpinionContainer(
                        catergoryName: o["categoryName"],
                        subCatName: o["subCategoryName"],
                        country: o['countryName'],
                        language: o['language'],
                        createdAt: o['video']['createdAt'] != null
                            ? DateTime.parse(o['video']['createdAt'])
                            : DateTime.now(),
                        videoUrl: o['video']['file'],
                        videoName: o['topic']['name'],
                        views: o['topic']['views'].toString(),
                        rating: o['rating'].toString(),
                        thumbnail: o['video']["thumbnail"],
                        createdBy: o['video']['createdBy'],
                      );
                    });
              }),
        ));
  }
}
