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
}
