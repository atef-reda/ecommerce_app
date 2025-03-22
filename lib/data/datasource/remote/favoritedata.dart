import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class FavoriteData {
  Crud crud;
  FavoriteData({
    required this.crud,
  });
  favoriteAdd(String userid,String itemid) async {
    var response = await crud
        .postData(AppLink.favoriteadd, {
      'user_id':userid,
      'item_id':itemid,
        });
    return response.fold((left)=>left, (right)=>right);
  }

    favoriteRemove(String userid,String itemid) async {
    var response = await crud
        .postData(AppLink.favoriteremove, {
      'user_id':userid,
      'item_id':itemid,
        });
    return response.fold((left)=>left, (right)=>right);
  }
}
