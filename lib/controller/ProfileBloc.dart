import 'dart:async';

import 'package:argued/backend/Profile_Services.dart';
import 'package:argued/model/ProfileModel.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  ProfileBloc() {
    {
      _profile.listen((ProfileModel p) async {
        _salutation.add(p.salutation);
        _username.add(p.username);
        _firstname.add(p.firstname);
        _showMyOccupation.add(p.settings.showOccupation);
        _geographicalInterest.add(p.settings.useLocation);
        _lastname.add(p.lastname);
        _phoneCode.add(p.countryCode);
        _phoneNo.add(p.phoneNumber);
        _dob.add(p.dob);
        _country.add(p.nationality);
        _occupation.add(p.occupation);
        _maritalStatus.add(p.maritalStatus);
        _religion.add(p.religion);
      });
    }
  }
  //varaible
  ProfileService profileService = ProfileService();
  final _profileResponse = BehaviorSubject<Map<dynamic, dynamic>>();
  final _profile = BehaviorSubject<ProfileModel>();
  final _salutation = BehaviorSubject<String>.seeded('Mr.');
  final _username = BehaviorSubject<String>();
  final _firstname = BehaviorSubject<String>();
  final _lastname = BehaviorSubject<String>();
  final _dob = BehaviorSubject<DateTime>();
  final _phoneNo = BehaviorSubject<String>();
  final _phoneCode = BehaviorSubject<String>.seeded("+92");
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _country = BehaviorSubject<String>.seeded('Pakistan');
  final _currency = BehaviorSubject<String>.seeded('Pakistani rupee');
  final _maritalStatus = BehaviorSubject<String>.seeded('Single');
  final _religion = BehaviorSubject<String>.seeded('Islam');
  final _occupation =
      BehaviorSubject<String>.seeded("Agriculture, Food and Natural Resources");
  final _hideText = BehaviorSubject<bool>.seeded(true);
  final _showMyOccupation = BehaviorSubject<bool>.seeded(false);
  final _geographicalInterest = BehaviorSubject<bool>.seeded(true);

  //Stream
  Stream<bool> get hideText => _hideText.stream;
  Stream<Map<dynamic, dynamic>> get profileResponse => _profileResponse.stream;
  Stream<String> get salutation => _salutation.stream;
  Stream<String> get username => _username.stream;
  Stream<String> get firstname => _firstname.stream;
  Stream<String> get lastname => _lastname.stream;
  Stream<String> get phoneNo => _phoneNo.stream.transform(phoneNoValidator);
  Stream<String> get phoneCode => _phoneCode.stream;
  Stream<String> get country => _country.stream;
  Stream<String> get currency => _currency.stream;
  Stream<String> get occupation => _occupation.stream;
  Stream<String> get religion => _religion.stream;
  Stream<String> get maritalStatus => _maritalStatus.stream;
  Stream<DateTime> get dob => _dob.stream;
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(passwordValidator);
  Stream<ProfileModel> get profile => _profile.stream;
  Stream<bool> get showMyOccupation => _showMyOccupation.stream;
  Stream<bool> get showGeographicalInterest => _geographicalInterest.stream;
  Stream<bool> get isValidProfile => CombineLatestStream.combine3(
      username, password, phoneNo, (a, b, c) => true);

  //sink
  Function(bool) get changeHideText => _hideText.sink.add;
  Function(String) get changeSalutation => _salutation.sink.add;
  Function(String) get changeUsername => _username.sink.add;
  Function(String) get changefirstname => _firstname.sink.add;
  Function(String) get changeLastName => _lastname.sink.add;
  Function(String) get changePhoneNo => _phoneNo.sink.add;
  Function(String) get changePhoneCode => _phoneCode.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeCountry => _country.sink.add;
  Function(String) get changeCurrency => _currency.sink.add;
  Function(String) get changeOccupation => _occupation.sink.add;
  Function(String) get changeReligion => _religion.sink.add;
  Function(String) get changeMaritalStatus => _maritalStatus.sink.add;
  Function(String) get changeConfrimPassword => _confirmPassword.sink.add;
  Function(DateTime) get changeDOB => _dob.sink.add;
  Function(ProfileModel) get changeProfile => _profile.sink.add;
  Function(bool) get changeShowMyOccupation => _showMyOccupation.sink.add;
  Function(bool) get changeGeographicalInterest =>
      _geographicalInterest.sink.add;

  //dispose
  dispose() {
    _profileResponse.close();
    _occupation.close();
    _religion.close();
    _maritalStatus.close();
    _country.close();
    _currency.close();
    _phoneCode.close();
    _hideText.close();
    _salutation.close();
    _username.close();
    _firstname.close();
    _lastname.close();
    _phoneNo.close();
    _dob.close();
    _confirmPassword.close();
    _password.close();
    _showMyOccupation.close();
    _geographicalInterest.close();
    _profile.close();
  }

  //validator
  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])';
    RegExp regExp = new RegExp(pattern);
    if (password.length >= 8 && regExp.hasMatch(password)) {
      sink.add(password.trim());
    } else {
      sink.addError("8 Characters Minimun and a Uppercase Letter");
    }
  });
  final phoneNoValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (phoneNo, sink) async {
    if (phoneNo.length > 9) {
      sink.add(phoneNo.trim());
    } else {
      sink.addError("Invalid Phone No.");
    }
  });

  //Functions
  bool get getHideText => _hideText.value;
  String get pass => _password.value;
  String get getPhoneNo => _phoneNo.value;
  String get confirmpass => _confirmPassword.value;

  getProfile() async {
    var data = await profileService.getProfile();
    changeProfile(data);
  }

  editProfile() async {
    Map<String, dynamic> data = {
      "salutation": _salutation.value,
      "nationality": _country.value,
      "occupation": _occupation.value,
      "currency": _currency.value,
      "religion": _religion.value,
      "maritalStatus": _maritalStatus.value,
      "settings": {
        "showOccupation": _showMyOccupation.value,
        "useLocation": _geographicalInterest.value
      },
    };
    if (_username.value != null && _username.value.isNotEmpty) {
      data["username"] = _username.value;
    }
    if (_lastname.value != null && _lastname.value.isNotEmpty) {
      data["lastname"] = _lastname.value;
    }

    if (_firstname.value != null && _firstname.value.isNotEmpty) {
      data["firstname"] = _firstname.value;
    }
    if (_dob.value != null) {
      data["dob"] = _dob.value.toIso8601String();
    }
    if (_phoneNo.value != null && _phoneNo.value.isNotEmpty) {
      data["countryCode"] = _phoneCode.value;
      data["phoneNumber"] = _phoneNo.value;
    }
    if (_password.value != null &&
        _confirmPassword.value != null &&
        _password.value.isNotEmpty &&
        _confirmPassword.value.isNotEmpty) {
      data["password"] = _password.value;
      data["confirmPassword"] = _confirmPassword.value;
    }

    print(data);
    var res = await profileService.editProfile(data);
    _profileResponse.add(res);
  }

  checkUserName() async {
    var response = await profileService.checkUesrname(_username.value ?? '');
    if (response['code'] != 200) {
      _username.addError("username not available");
    }
  }
}
