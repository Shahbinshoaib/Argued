import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/countryModel.dart';
import 'package:argued/model/statesWithCItiesModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationService {
  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // getConstant() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
  //   try {
  //     // Response response = await Dio().get('$kendpoint' + '/api/constant',
  //     //     options: Options(headers: header));
  //     // printWrapped(response.data.toString());
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       print(e.response.data);
  //       print(e.response.headers);
  //       print(e.response.request);
  //     } else {
  //       print(e.request);
  //       print(e.message);
  //     }
  //   }
  // }

  getCountries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    // List<CountryModel> _list = List();
    try {
      Response response = await Dio()
          .get('$kendpoint$kCountry', options: Options(headers: header));
      return CountryModel.fromJson(response.data);
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

  getStatesWithCities(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response = await Dio()
          .get('$kendpoint$kStates$id', options: Options(headers: header));
      return StatesModel.fromJson(response.data);
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

  updateProfile(Map<String,dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    try {
      Response response =
          await Dio().put('$kendpoint$kProfile-mobile', data: data,options: Options(headers:header ));
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
