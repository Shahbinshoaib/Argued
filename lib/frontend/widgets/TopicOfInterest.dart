import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/catergoryBloc.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/model/catergoryModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicOfInterest extends StatefulWidget {
  @override
  _TopicOfInterestState createState() => _TopicOfInterestState();
}

class _TopicOfInterestState extends State<TopicOfInterest> {
  @override
  void initState() {
    var catergoryBloc = Provider.of<CatergoryBloc>(context, listen: false);
    catergoryBloc.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var catergoryBloc = Provider.of<CatergoryBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "Change Of Interest",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                )),
            Container(
                child: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context))),
          ],
        ),
        Divider(
          height: 4,
          thickness: 1,
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            'Select Topic',
            style: smallHeadingText().copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 300,
          padding: EdgeInsets.all(12),
          child: StreamBuilder<CategoryModel>(
              stream: catergoryBloc.catergoryResponse,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    height: 300,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                var data = snapshot.data.data;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              elevation: 0,
                              isScrollControlled: true,
                              isDismissible: false,
                              context: context,
                              builder: (context) {
                                return SubTopicOfInterest(
                                  subcategories: data[index].subcategories,
                                );
                              });
                        },
                        child: CategoryCard(
                            label: data[index].name,
                            imgUrl: data[index].profilePic??kTempImage),
                      );
                    });
              }),
        ),
      ],
    );
  }
}

class SubTopicOfInterest extends StatefulWidget {
  final List<Subcategory> subcategories;

  const SubTopicOfInterest({Key key, this.subcategories}) : super(key: key);

  @override
  _SubTopicOfInterestState createState() => _SubTopicOfInterestState();
}

class _SubTopicOfInterestState extends State<SubTopicOfInterest> {
  // List<Map<String, bool>> _list;
  List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    var catergoryBloc = Provider.of<CatergoryBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "Change Of Interest",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                )),
            Container(
                child: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context))),
          ],
        ),
        Divider(
          height: 4,
          thickness: 1,
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            'Select Sub Topic',
            style: smallHeadingText().copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        StreamBuilder<bool>(
            stream: catergoryBloc.selectAll,
            builder: (context, snapshot) {
              return CheckboxListTile(
                  title: Text(
                    "Select All",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  value: snapshot.data,
                  onChanged: catergoryBloc.changeSelectAll);
            }),
        Container(
            height: 350,
            padding: EdgeInsets.all(12),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemCount: widget.subcategories.length,
                itemBuilder: (context, index) {
                  // _list.add(widget.subcategories[index].id);
                  return StreamBuilder<bool>(
                      stream: catergoryBloc.selectAll,
                      builder: (context, snapshot) {
                        snapshot.data == true
                            ? _list.add(widget.subcategories[index].id)
                            // ignore: unnecessary_statements
                            : null;
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _list.contains(widget.subcategories.map((e) {
                                  return e.id;
                                }).toList())
                                    ? catergoryBloc.changeSelectAll(true)
                                    : catergoryBloc.changeSelectAll(false);
                                setState(() {
                                  _list.contains(widget.subcategories[index].id)
                                      ? _list.remove(
                                          widget.subcategories[index].id)
                                      : _list
                                          .add(widget.subcategories[index].id);
                                });
                              },
                              child: CategoryCard(
                                  label: widget.subcategories[index].name,
                                  imgUrl:
                                      widget.subcategories[index].profilePic??kTempImage),
                            ),
                            !_list.contains(widget.subcategories[index].id)
                                ? Container()
                                : Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      backgroundColor: primaryColor,
                                      radius: 16,
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        );
                      });
                })),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 8, 12, 12),
              child: AppSmallButton(
                  onTap: () async {
                    var response = await catergoryBloc.updateProfile(_list);
                    MyAppDailog().responseDailog(response['message'], context);
                    Future.delayed(Duration(milliseconds: 600)).then((value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  },
                  screenWidthPercentage: 0.4,
                  buttonColor: primaryColor,
                  buttonTextColor: Colors.white,
                  buttonText: "Apply Fliter"),
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final String imgUrl;

  const CategoryCard({Key key, @required this.label, @required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                height: 40,
                color: primaryColor,
                child: Center(
                    child: Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                )),
              ),
              Wrap(
                children: [
                  CachedNetworkImage(
                    height: 145.2,
                    // width: 100,
                    fit: BoxFit.cover,
                    imageUrl: imgUrl??kTempImage,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Center(child: Icon(Icons.error)),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
