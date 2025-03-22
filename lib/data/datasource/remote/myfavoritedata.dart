import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData({
    required this.crud,
  });
  postdata(String userId) async {
    var response = await crud
        .postData(AppLink.favoriteview, {
          'user_id':userId
        });
    return response.fold((left)=>left, (right)=>right);
  }
  deleteItem(String favoriteId) async {
    var response = await crud
        .postData(AppLink.deleteitemfromfav, {
          'favorite_id':favoriteId
        });
    return response.fold((left)=>left, (right)=>right);
  }
}