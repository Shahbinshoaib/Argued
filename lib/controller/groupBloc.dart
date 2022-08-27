import 'package:argued/backend/group_Services.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/LocationBloc.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/model/catergoryModel.dart';
import 'package:argued/model/chatModel.dart';
import 'package:argued/model/groupDetailModel.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class GroupBloc {
  //variables
  final groupServices = GroupService();
  final _validGroup = BehaviorSubject<bool>();
  final _groupChat = BehaviorSubject<ChatModel>();
  final _groupDetails = BehaviorSubject<GroupDetailsModel>();
  final _searchQuery = BehaviorSubject<String>();
  final _catergories = BehaviorSubject<CategoryModel>();
  final _subcatergories = BehaviorSubject<List<Subcategory>>();
  final _name = BehaviorSubject<String>();
  final _descirption = BehaviorSubject<String>();
  final _topic = BehaviorSubject<String>();
  final _subtopic = BehaviorSubject<String>();
  final _topicId = BehaviorSubject<String>();
  final _subtopicId = BehaviorSubject<String>();
  final _groups = BehaviorSubject<Map<dynamic, dynamic>>();
  final _creategroup = BehaviorSubject<Map<dynamic, dynamic>>();
  final _inviteUser = PublishSubject<Map<dynamic, dynamic>>();
  final _audience = BehaviorSubject<String>.seeded('Private');

  //streams
  Stream<bool> get validgroup => _validGroup.stream;
  Stream<ChatModel> get groupChat => _groupChat.stream;
  Stream<GroupDetailsModel> get groupDetails => _groupDetails.stream;
  Stream<String> get searchQuery => _searchQuery.stream;
  Stream<String> get audience => _audience.stream;
  Stream<String> get name => _name.stream;
  Stream<String> get description => _descirption.stream;
  Stream<String> get topic => _topic.stream;
  Stream<String> get subtopic => _subtopic.stream;
  Stream<CategoryModel> get catergories => _catergories.stream;
  Stream<List<Subcategory>> get subcatergories => _subcatergories.stream;
  Stream<Map<dynamic, dynamic>> get groups => _groups.stream;
  Stream<Map<dynamic, dynamic>> get creategroup => _creategroup.stream;
  Stream<Map<dynamic, dynamic>> get inviteUser => _inviteUser.stream;

  //sinks
  Function(String) get changeSearchQuery => _searchQuery.sink.add;
  Function(String) get changeAudience => _audience.sink.add;
  Function(ChatModel) get changeGroupchat => _groupChat.sink.add;
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeDescription => _descirption.sink.add;
  Function(String) get changeTopic => _topic.sink.add;
  Function(String) get changeSubTopic => _subtopic.sink.add;
  Function(String) get changeTopicId => _topicId.sink.add;
  Function(String) get changeSubTopicId => _subtopicId.sink.add;
  Function(List<Subcategory>) get changeSubCatergories =>
      _subcatergories.sink.add;
  Function(Map<dynamic, dynamic>) get changeGroups => _groups.sink.add;

  //dispose
  dispose() {
    _groupChat.close();
    _inviteUser.close();
    _validGroup.close();
    _searchQuery.close();
    _subcatergories.close();
    _groups.close();
    _audience.close();
    _name.close();
    _descirption.close();
    _topic.close();
    _subtopic.close();
    _topicId.close();
    _subtopicId.close();
    _catergories.close();
    _groupDetails.close();
  }

  //FUNC
  getGroups() async {
    _groups.addError("loading");
    var data = await groupServices.getGroups();
    _groups.add(data);
  }

  inviteUsers(String username, String groupId, BuildContext context) async {
    MyAppDailog().appResponseDailog(context, inviteUser, 1);
    var data = await groupServices.inviteUser(username, groupId);
    _inviteUser.add(data);
  }

  Future<ChatModel> getGroupMessage(String groupId) async {
    _groupChat.addError("loading");
    var data = await groupServices.getGroupMessage(groupId);
    groupServices.groupMessageRead(groupId);
    if (data['data'] != [] && data['data'] != null) {
      return ChatModel.fromJson(data);
    } else {
      return ChatModel();
    }
    // getGroups();
  }

  getCategorise() async {
    var res = await groupServices.getCategory();
    _catergories.add(res);
  }

  getGroupDetails(String groupId) async {
    var res = await groupServices.getGroupDetail(groupId);
    if (res['code'] == 200 && res['data'] != null) {
      _groupDetails.add(GroupDetailsModel.fromJson(res));
    } else {
      _groupDetails.addError('Disable');
    }
  }

  createGroup(LocationBloc locationBloc, context, AuthBloc authBloc) async {
    if (_name.value != null &&
        _descirption.value != null &&
        _topicId.value != null &&
        _audience.value != null &&
        locationBloc.getCountryId != null) {
      var data = {
        'name': _name.value,
        "description": _descirption.value,
        'city': locationBloc.getCityId,
        'country': locationBloc.getCountryId,
        "state": locationBloc.getStateId,
        "audience": _audience.value,
        'category': _topicId.value,
        'subcategory': _subtopicId.value,
      };
      var res = await groupServices.createGroup(data);
      _creategroup.add(res);
      getGroups();
      MyAppDailog().appResponseDailog(context, creategroup, 2);
      authBloc.changeButton(false);
    } else {
      MyAppDailog().responseDailog(
          "Error! Please fill all the information", context,
          showClosebutton: true);
      authBloc.changeButton(false);
    }
  }
}
