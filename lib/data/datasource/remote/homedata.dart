import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class HomeData {
  Crud crud;
  HomeData({
    required this.crud,
  });
  postdata() async {
    var response = await crud
        .postData(AppLink.homePage, {});
    return response.fold((left)=>left, (right)=>right);
  }

  searchData(String? search,String table) async {
    var response = await crud
        .postData(AppLink.search, {
          "search":search,
          "table":table,
        });
    return response.fold((left)=>left, (right)=>right);
  }
}
