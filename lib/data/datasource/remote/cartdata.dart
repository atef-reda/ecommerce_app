import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class CartData {
  Crud crud;
  CartData({
    required this.crud,
  });
  cartAdd(String userid, String itemid) async {
    var response = await crud.postData(AppLink.cartadd, {
      'user_id': userid,
      'item_id': itemid,
    });
    return response.fold((left) => left, (right) => right);
  }

  cartRemove(String userid, String itemid) async {
    var response = await crud.postData(AppLink.cartremove, {
      'user_id': userid,
      'item_id': itemid,
    });
    return response.fold((left) => left, (right) => right);
  }

    cartitemcounts(String userid, String itemid) async {
    var response = await crud.postData(AppLink.cartgetitemcounts, {
      'user_id': userid,
      'item_id': itemid,
    });
    return response.fold((left) => left, (right) => right);
  }
  cartView(String userid) async {
    var response = await crud.postData(AppLink.cartview, {
      'user_id': userid,
    });
    return response.fold((left) => left, (right) => right);
  }
}
