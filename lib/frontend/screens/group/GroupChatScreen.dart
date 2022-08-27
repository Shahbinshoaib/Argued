import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/groupBloc.dart';
import 'package:argued/frontend/screens/contact/contactScreen.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppUserProfileCircle.dart';
import 'package:argued/frontend/widgets/AppappBar.dart';
import 'package:argued/model/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupChatScreen extends StatefulWidget {
  final String groupName;
  final String groupId;

  const GroupChatScreen(
      {Key key, @required this.groupName, @required this.groupId})
      : super(key: key);

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  bool isLoading = true;
  SocketIO socket;
  SocketIOManager manager;
  List<ChatMessages> _allMessages = List<ChatMessages>();
  String token = "";
  TextEditingController _msg = TextEditingController();
  List<String> toPrint = ["trying to conenct"];
  @override
  void initState() {
    super.initState();
    var groupBloc = Provider.of<GroupBloc>(context, listen: false);
    manager = SocketIOManager();
    setUpSocket(groupBloc);
  }

  Future<void> setUpSocket(GroupBloc groupBloc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var d = await groupBloc.getGroupMessage(widget.groupId);
    setState(() {
      token = prefs.getString('Token');
      _allMessages = d.data;
      isLoading = false;
      initSocket(groupBloc);
    });
  }

  initSocket(GroupBloc groupBloc) async {
    socket = await manager.createInstance(SocketOptions(kendpoint,
        query: {
          "token": token,
        },
        nameSpace: '/',
        enableLogging: false,
        transports: [Transports.WEB_SOCKET, Transports.POLLING]));
    socket.onConnect((data) {
      print("connected...");
      print(data);
    });
    socket.onConnectError((data) {
      print('Connecting error :-> $data');
    });
    socket.onConnectTimeout((data) {
      print('Connection TimeOut :-> $data');
      socket.connect();
    });
    socket.onError((data) {
      print('Error :-> $data');
    });
    socket.onDisconnect((data) {
      print('Disconnected :-> $data');
    });
    socket.on("newMessage", (data) {
      print("newMessage");
      print(data);
      setState(() {
        ChatMessages chatMessage = ChatMessages.fromJson(data);
        _allMessages.insert(0, chatMessage);
        print('length ${_allMessages.length}');
      });
    });
    socket.connect();
  }

  void _sendChatMessage(String msg) async {
    String jsonData = '{"group": "${widget.groupId}" , "message": "$msg"}';
    if (socket != null) {
      print("sending message...");
      socket.emit("send-message", [
        jsonData,
      ]);
      print("Message emitted...");
      _msg.text = "";
    }
  }

  @override
  void dispose() {
    _msg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("groupId : ${widget.groupId}");
    // var groupBloc = Provider.of<GroupBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        // groupBloc.getGroups();
        return true;
      },
      child: Scaffold(
          appBar: AppAppBar(
            title: widget.groupName,
            onTap: () {
              // groupBloc.getGroups();
              Navigator.pop(context);
            },
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
            child: Column(
              children: [
                Expanded(
                    child: (isLoading)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (_allMessages.isEmpty)
                            ? Center(
                                child: Text(
                                'No messages yet',
                                style: listTileSubTitleText,
                              ))
                            : ListView.builder(
                                reverse: true,
                                itemCount: _allMessages.length,
                                itemBuilder: (context, i) {
                                  var m = _allMessages[i];
                                  if (i == 0) {
                                    return Column(
                                      crossAxisAlignment:
                                          (authBloc.getuserId == m.sentBy.id)
                                              ? CrossAxisAlignment.end
                                              : CrossAxisAlignment.start,
                                      children: [
                                        (authBloc.getuserId == m.sentBy.id)
                                            ? SenderContainer(
                                                userName: m.sentBy.username,
                                                profilePic: m.sentBy.profilePic,
                                                message: m.message,
                                                time: m.createdAt)
                                            : RecieverContainer(
                                                userName: m.sentBy.username,
                                                profilePic: m.sentBy.profilePic,
                                                message: m.message,
                                                time: m.createdAt),
                                        Container(
                                          height: 12,
                                        ),
                                      ],
                                    );
                                  }
                                  if (authBloc.getuserId == m.sentBy.id) {
                                    print(m.sentBy.profilePic);
                                    return SenderContainer(
                                        userName: m.sentBy.username,
                                        profilePic: m.sentBy.profilePic,
                                        message: m.message,
                                        time: m.createdAt);
                                  }
                                  return RecieverContainer(
                                      userName: m.sentBy.username,
                                      profilePic: m.sentBy.profilePic,
                                      message: m.message,
                                      time: m.createdAt);
                                })),
                AppTextField(
                  controller: _msg,
                  showLabel: false,
                  hintText: 'Type your message..',
                  icon: Icons.send,
                  iconColor: primaryColor,
                  size: 25,
                  onTap: () {
                    if (_msg.text.isNotEmpty) {
                      _sendChatMessage(_msg.text.trim().toString());
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class SenderContainer extends StatelessWidget {
  final String profilePic;
  final String message;
  final String userName;
  final DateTime time;
  final double radius = 15;

  const SenderContainer(
      {Key key,
      @required this.profilePic,
      @required this.message,
      @required this.userName,
      @required this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: SizeConfig.screenWidth * 0.65,
                minWidth: SizeConfig.screenWidth * 0.3),
            child: Card(
              shadowColor: Colors.transparent,
              color: primaryColor.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                  topLeft: Radius.circular(radius),
                ),
              ),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          message,
                          style: chatText,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: -20,
                      left: 0,
                      child: Text(
                        getFormatedTime(time),
                        style: listTileTrailingText,
                      )),
                  Positioned(
                      bottom: -20,
                      right: 0,
                      child: Text(
                        userName,
                        style: listTileTrailingText,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          UserCirle(profilePic: profilePic??authBloc.getUserProfilePic),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RecieverContainer extends StatelessWidget {
  final String profilePic;
  final String message;
  final String userName;
  final DateTime time;
  final double radius = 15;

  const RecieverContainer(
      {Key key,
      @required this.profilePic,
      @required this.message,
      @required this.userName,
      @required this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserCirle(profilePic: profilePic),
          SizedBox(
            width: 4,
          ),
          Container(
            constraints: BoxConstraints(
                maxWidth: SizeConfig.screenWidth * 0.65,
                minWidth: SizeConfig.screenWidth * 0.3),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                topRight: Radius.circular(radius),
              )),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          message,
                          style: chatText,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: -20,
                      right: 0,
                      child: Text(
                        getFormatedTime(time),
                        style: listTileTrailingText,
                      )),
                  Positioned(
                      bottom: -20,
                      left: 0,
                      child: Text(
                        userName,
                        style: listTileTrailingText,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
