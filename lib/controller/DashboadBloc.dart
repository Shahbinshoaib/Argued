import 'package:argued/backend/Dashboard_Service.dart';
import 'package:argued/model/HotTopicModel.dart';
import 'package:argued/model/opnionModel.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc {
  //varaible
  DashboardServices dashboardServices = DashboardServices();
  List<OpinionData> opinionList = List<OpinionData>();
  final _hotTopicOfHour = BehaviorSubject<HotTopicModel>();
  final _mostWatched = BehaviorSubject<OpinionModel>();
  final _interestingToYou = BehaviorSubject<List<OpinionData>>();
  final _rating = BehaviorSubject<double>.seeded(55.0);
  final _ratingResponse = PublishSubject<Map<dynamic, dynamic>>();
  final _emojiList = BehaviorSubject<List<bool>>.seeded([false, true, false]);

  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _stopSearching = BehaviorSubject<bool>.seeded(false);
  final pageNo = BehaviorSubject<int>.seeded(1);

  //Stream

  Stream<HotTopicModel> get hotTopicOfHour => _hotTopicOfHour.stream;
  Stream<OpinionModel> get mostWatched => _mostWatched.stream;
  Stream<List<OpinionData>> get interestingToYou => _interestingToYou.stream;
  Stream<List<bool>> get emojiList => _emojiList.stream;
  Stream<Map<dynamic, dynamic>> get ratingResponse => _ratingResponse.stream;
  Stream<double> get rating => _rating.stream;
  Stream<bool> get isLoading => _isLoading.stream;
  Stream<int> get pageNumber => pageNo.stream;

  //sink

  Function(HotTopicModel) get changeHotTopicOfHour => _hotTopicOfHour.sink.add;
  Function(OpinionModel) get changeHotMostWatched => _mostWatched.sink.add;
  Function(List<OpinionData>) get changeInterestingToYou =>
      _interestingToYou.sink.add;
  Function(List<bool>) get changeEmojiList => _emojiList.sink.add;
  Function(Map<dynamic, dynamic>) get changeRatingResponse =>
      _ratingResponse.sink.add;
  Function(double) get changeRating => _rating.sink.add;
  Function(bool) get changeIsLoading => _isLoading.sink.add;
  Function(bool) get changeStopSearching => _stopSearching.sink.add;
  Function(int) get changePageNum => pageNo.sink.add;

  //dispose
  dispose() {
    _emojiList.close();
    _ratingResponse.close();
    _stopSearching.close();
    pageNo.close();
    _isLoading.close();
    _interestingToYou.close();
    _mostWatched.close();
    _rating.close();
    _hotTopicOfHour.close();
  }

  //Functions

  getHotTopicOfHour() async {
    HotTopicModel data = await dashboardServices.hotTopicOfHour();
    changeHotTopicOfHour(data);
  }

  getMostWatchedTopic() async {
    var data = await dashboardServices.mostWatchedTopic();
    print('getting most watch : ${data.data.length}');
    changeHotMostWatched(data);
  }

  getInterestingToYou() async {
    print("==========${pageNo.value}==============");
    OpinionModel data =
        await dashboardServices.interestingToYou(pageNo.value.toString());
    print("opinon List ===> ${opinionList.length}");
    print("new response ${pageNo.value} : ${data.message}");
    if (data.data.isNotEmpty && data.data != []) {
      opinionList.addAll(data.data);
      changeInterestingToYou(opinionList);
    } else {
      changeIsLoading(false);
      changeStopSearching(true);
    }
  }

  postRating(opinionId, stand) async {
    String stand = '';
    for (int i = 0; i < _emojiList.value.length; i++) {
      if (_emojiList.value[0] == true) {
        stand = 'Against';
      } else if (_emojiList.value[1] == true) {
        stand = 'Netural';
      } else {
        stand = "For";
      }
    }
    var rating = {
      "rating": int.parse(_rating.value.toString().split('.')[0]),
      "stand": stand
    };

    var data = await dashboardServices.ratingOpinion(opinionId, rating);
    print("opinionId : $opinionId");
    print(data);
    _ratingResponse.add(data);
  }

  addhost(String hostId) async {
    var data = await dashboardServices.addHost(hostId);
    _ratingResponse.add(data);
  }

  int get getPageNo => pageNo.value;
  bool get shouldStopSearching => _stopSearching.value;
}
