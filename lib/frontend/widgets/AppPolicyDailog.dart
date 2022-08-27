import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDailog extends StatelessWidget {
  PolicyDailog({this.radius = 8, @required this.mdfilename})
      : assert(mdfilename.contains('.md'),
            'The fileName must contain .md extension');
  final double radius;
  final String mdfilename;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: Future.delayed(Duration(milliseconds: 150)).then((value) => rootBundle.loadString("assets/$mdfilename")),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data);
                    }
                    return Center(child: CupertinoActivityIndicator());
                  })),
          FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () => Navigator.pop(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              )),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                )),
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text(
                  "close",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
