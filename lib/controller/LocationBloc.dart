import 'package:argued/backend/Location_service.dart';
import 'package:argued/model/countryModel.dart';
import 'package:argued/model/statesWithCItiesModel.dart';
import 'package:rxdart/rxdart.dart';

class LocationBloc {
  //varaible
  final countryServices = LocationService();
  final _listCountries = BehaviorSubject<CountryModel>();
  final _listStatesWithCities = BehaviorSubject<StatesModel>();
  final _defaultlistStates = BehaviorSubject<StatesModel>();
  final _listCities = BehaviorSubject<List<City>>();
  final _defaultlistCities = BehaviorSubject<List<City>>();
  final _listCitiesId = BehaviorSubject<List<String>>();
  final _listCitiesName = BehaviorSubject<List<String>>();
  final _country = BehaviorSubject<String>();
  final _state = BehaviorSubject<String>();
  final _cities = BehaviorSubject<String>();
  final _defaultcountry = BehaviorSubject<String>();
  final _defaultstate = BehaviorSubject<String>();
  final _defaultcities = BehaviorSubject<String>();
  final _defaultcountryId = BehaviorSubject<String>();
  final _defaultstateId = BehaviorSubject<String>();
  final _defaultcitiesId = BehaviorSubject<String>();

  //streams
  Stream<CountryModel> get listOfcountries => _listCountries.stream;
  Stream<List<City>> get listOfcities => _listCities.stream;
  Stream<List<City>> get defaultlistOfcities => _defaultlistCities.stream;
  Stream<List<String>> get listOfcitiesId => _listCitiesId.stream;
  Stream<List<String>> get listOfcitiesName => _listCitiesName.stream;
  Stream<StatesModel> get listOfStatesWithCities =>
      _listStatesWithCities.stream;
  Stream<StatesModel> get defaultlistOfStates => _defaultlistStates.stream;
  Stream<String> get country => _country.stream;
  Stream<String> get states => _state.stream;
  Stream<String> get cities => _cities.stream;
  Stream<String> get defaultcountry => _defaultcountry.stream;
  Stream<String> get defaultstates => _defaultstate.stream;
  Stream<String> get defaultcities => _defaultcities.stream;

  //sink
  Function(CountryModel) get changeListOfCountries => _listCountries.sink.add;
  Function(List<City>) get changeListOfCities => _listCities.sink.add;
  Function(List<City>) get changedefaultListOfCities =>
      _defaultlistCities.sink.add;
  Function(List<String>) get changeListOfCitiesId => _listCitiesId.sink.add;
  Function(List<String>) get changeListOfCitiesName => _listCitiesName.sink.add;
  Function(StatesModel) get changeListOfStates =>
      _listStatesWithCities.sink.add;
  Function(StatesModel) get changeDefaultListOfStates =>
      _defaultlistStates.sink.add;
  Function(String) get changeCountry => _country.sink.add;
  Function(String) get changeStates => _state.sink.add;
  Function(String) get changeCities => _cities.sink.add;
  Function(String) get changedefaultCountry => _defaultcountry.sink.add;
  Function(String) get changedefaultStates => _defaultstate.sink.add;
  Function(String) get changedefaultCities => _defaultcities.sink.add;
  Function(String) get changedefaultCountryId => _defaultcountryId.sink.add;
  Function(String) get changedefaultStatesId => _defaultstateId.sink.add;
  Function(String) get changedefaultCitiesId => _defaultcitiesId.sink.add;

  //dispose
  dispose() {
    _defaultlistCities.close();
    _defaultlistStates.close();
    _listCitiesName.close();
    _listCitiesId.close();
    _listCities.close();
    _listStatesWithCities.close();
    _cities.close();
    _country.close();
    _state.close();
    _defaultcities.close();
    _defaultcountry.close();
    _defaultstate.close();
    _defaultcitiesId.close();
    _defaultcountryId.close();
    _defaultstateId.close();
    _listCountries.close();
  }

  //FUNC
  getCountry() async {
    var countries = await countryServices.getCountries();
    changeListOfCountries(countries);
  }

  getStatesWithCities() async {
    changeStates('Disable');
    _listCities.addError([]);
    _listCountries.value.data.forEach((c) async {
      if (c.name == _country.value) {
        var statesWithCities = await countryServices.getStatesWithCities(c.id);
        changeListOfStates(statesWithCities);
        changeStates(_listStatesWithCities.value.data.first.name);
        getCities();
      }
    });
  }

  getDefaultStatesWithCities() async {
    changedefaultStates('Disable');
    _listCountries.value.data.forEach((c) async {
      if (c.name == _defaultcountry.value) {
        var statesWithCities = await countryServices.getStatesWithCities(c.id);
        _defaultcountryId.add(c.id);
        // print(c.id);
        changeDefaultListOfStates(statesWithCities);
        changedefaultStates(_defaultlistStates.value.data.first.name);
        getDefaultCities();
      }
    });
  }

  getDefaultCities() {
    changedefaultCities('Disable');
    _defaultlistStates.value.data.forEach((c) async {
      if (c.name == _defaultstate.value) {
        _defaultstateId.add(c.id);
        changedefaultListOfCities(c.cities);
        changedefaultCities(c.cities.first.name);
      }
    });
  }

  getCities() {
    _listCities.addError([]);
    _listCitiesName.addError([]);
    _listStatesWithCities.value.data.forEach((c) async {
      if (c.name == _state.value) {
        changeListOfCities(c.cities);
      }
    });
  }

  updateProfile() async {
    String countryId;
    String stateId;
    if (_country.value == 'Global') {
      _listCountries.value.data.forEach((c) async {
        if (c.name == _country.value) {
          countryId = c.id;
        }
      });
      Map<String, dynamic> data = {
        "countriesFollowing": [countryId],
        "statesFollowing": [],
        "citiesFollowing": [],
        "fromMobile": true
      };
      var response = await countryServices.updateProfile(data);
      return response;
    }
    if (_country.value.isNotEmpty && _country.value != "Global") {
      _listCountries.value.data.forEach((c) async {
        if (c.name == _country.value) {
          countryId = c.id;
        }
      });
      _listStatesWithCities.value.data.forEach((s) {
        if (s.name == _state.value) {
          stateId = s.id;
        }
      });
      Map<String, dynamic> data = {
        "countriesFollowing": [countryId],
        "statesFollowing": [stateId],
        "citiesFollowing": _listCitiesId.value,
        "fromMobile": true
      };
      var response = await countryServices.updateProfile(data);
      return response;
    }
  }

  // getConstant() async {
  //   await countryServices.getConstant();
  // }

  get getCountryId => _defaultcountryId.value;
  get getCityId => _defaultcitiesId.value;
  get getStateId => _defaultstateId.value;
}
