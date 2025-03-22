import 'package:ecommerce_app/core/constant/applinks.dart';
import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData({
    required this.crud,
  });
  postdata(String categoriesId,String userId) async {
    var response = await crud
        .postData(AppLink.itemsPage, {'categories_id':categoriesId , 'user_id':userId});
    return response.fold((left)=>left, (right)=>right);
  }
}
