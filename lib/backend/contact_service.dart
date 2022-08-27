import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/chatModel.dart';
import 'package:argued/model/contactModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactService {
  getContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio()
          .get('$kendpoint$kContact', options: Options(headers: header));

      return ContactModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }

  getChatRoom(String roomId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio().get('$kendpoint$kChatRoom$roomId',
          options: Options(headers: header));
      return ChatModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }

  chatMessageRead(String roomId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio().patch(
          '$kendpoint$kChatMessagesread$roomId',
          options: Options(headers: header));
      print('Read =======> ${response.data}');
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }

  findContact(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio().get('$kendpoint$kInviteContact$userName',
          options: Options(headers: header));
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }

  addContact(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    var data = {"username": userName};
    try {
      Response response = await Dio().post('$kendpoint$kAddContact',
          options: Options(headers: header), data: data);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }
}
