import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/model/loginModel.dart';
import 'package:argued/model/signUpModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  apiVerification() async {
    try {
      Response response = await Dio().get('$kendpoint$kApiVersion');
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

  signUp(SignUpModel signUpModel) async {
    try {
      Response response =
          await Dio().post('$kendpoint$ksignUp', data: signUpModel.toMap());
      // print(response.data);
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

  verifyCode(String code, String id) async {
    try {
      Response response = await Dio()
          .post('$kendpoint$kverifyCode/$id', data: {"verificationCode": code});
      // print(response);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  login(LoginModel loginModel) async {
    try {
      Response response =
          await Dio().post('$kendpoint$kLogin', data: loginModel.toMap());
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  resetCredential(bool password, String email) async {
    String url =
        password ? kendpoint + kforgotPassword : kendpoint + kforgotUsername;
    var data = {"email": email};
    try {
      Response response = await Dio().post(url, data: data);
      // print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  checkUesrname(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> header = {'Authorization': prefs.getString('Token')};
    var data = {"username": name};
    try {
      Response response = await Dio().post('$kendpoint$kCheckUsername',
          data: data, options: Options(headers: header));

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
