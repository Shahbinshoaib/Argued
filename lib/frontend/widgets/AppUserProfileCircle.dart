import 'package:argued/ArguedConfigs/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserCirle extends StatelessWidget {
  final String profilePic;
  final double height;
  final double width;

  const UserCirle(
      {Key key, @required this.profilePic, this.height = 40, this.width = 40})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: profilePic??kTempImage,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
