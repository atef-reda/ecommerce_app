import 'package:ecommerce_app/core/constant/applinks.dart';
import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData({
    required this.crud,
  });
  postdata(String categoriesId) async {
    var response = await crud
        .postData(AppLink.itemsPage, {'categories_id':categoriesId});
    return response.fold((left)=>left, (right)=>right);
  }
}
