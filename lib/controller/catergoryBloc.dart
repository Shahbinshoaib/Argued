import 'package:argued/backend/category_Service.dart';
import 'package:argued/model/catergoryModel.dart';
import 'package:rxdart/rxdart.dart';

class CatergoryBloc {
  //varaible
  CatergoryService catergoryService = CatergoryService();
  final _catergoryResponse = BehaviorSubject<CategoryModel>();
  final _selectAll = BehaviorSubject<bool>.seeded(false);

  //streams
  Stream<bool> get selectAll => _selectAll.stream;
  Stream<CategoryModel> get catergoryResponse => _catergoryResponse.stream;

  //sinks
  Function(CategoryModel) get changeCategoryResponse =>
      _catergoryResponse.sink.add;
  Function(bool) get changeSelectAll => _selectAll.sink.add;
  //dispose
  dispose() {
    _selectAll.close();
    _catergoryResponse.close();
  }

  //func
  getCategory() async {
    var data = await catergoryService.getCategory();
    changeCategoryResponse(data);
  }

  updateProfile(List<String> list) async {
    Map<String, dynamic> data = {'subCategories': list};
    var response = await catergoryService.updateProfile(data);
    return response;
  }
}
