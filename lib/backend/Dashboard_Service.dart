import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/HotTopicModel.dart';
import 'package:argued/model/opnionModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardServices {
  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  hotTopicOfHour() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      // var response = await http.get('$kendpoint$kHotTopicHour',headers: header);
      Response response = await Dio()
          .get('$kendpoint$kHotTopicHour', options: Options(headers: header));
      // print("HotTopicResponse : ${response.data}");
      // printWrapped(response.data.toString());
      return HotTopicModel.fromJson(response.data['data']);
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

  mostWatchedTopic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    // List<OpinionModel> _list = [];
    try {
      Response response = await Dio()
          .get('$kendpoint$kMostWatched', options: Options(headers: header));
      return OpinionModel.fromMap(response.data);
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

  interestingToYou(String pageNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    // List<OpinionModel> _list = [];
    try {
      Response response = await Dio().get('$kendpoint$kInterestingToYou$pageNo',
          options: Options(headers: header));

      return OpinionModel.fromMap(response.data);
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

  ratingOpinion(String opinionId, rating) async {
    print('opinionId : $opinionId');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio().post('$kendpoint$kRateOpinion$opinionId',
          data: rating, options: Options(headers: header));

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

  addHost(String hostId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio().post('$kendpoint$kAddHost$hostId',
          data: {"source": "Video"}, options: Options(headers: header));
      print("Add host Response ===> ${response.data}");
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
