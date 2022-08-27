import 'package:argued/backend/watchList_Service.dart';
import 'package:argued/model/WatchListModel.dart';
import 'package:rxdart/rxdart.dart';

class WatchListBloc {
  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
  //varaibles
  final watchListService = WatchListService();
  final _watchList = BehaviorSubject<WatchListModel>();
  final _userOpinion = PublishSubject<Map<dynamic, dynamic>>();
  final _searchQuery = BehaviorSubject<String>();

  //streams
  Stream<WatchListModel> get watchList => _watchList.stream;
  Stream<Map<dynamic, dynamic>> get userOpinon => _userOpinion.stream;
  Stream<String> get searchQuery => _searchQuery.stream;

  //sink
  Function(WatchListModel) get changeWatchList => _watchList.sink.add;
  Function(String) get changeSearchQuery => _searchQuery.sink.add;

  //dispose
  dispose() {
    _searchQuery.close();
    _watchList.close();
  }

  //func
  getWatchList() async {
    var data = await watchListService.getWatchList();
    if (data['data'] != null || data['data'] != []) {
      var o = WatchListModel.fromJson(data);
      changeWatchList(o);
    } else {
      _watchList.addError('Disable');
    }
  }

  getProfileOpinion(String userId) async {
    var data = await watchListService.getUserOpinion(userId);
    if (data['data'] != null || data['data'] != []) {
      // printWrapped(data.toString());
      _userOpinion.add(data);
    } else {
      _userOpinion.addError('Disable');
    }
  }
}
