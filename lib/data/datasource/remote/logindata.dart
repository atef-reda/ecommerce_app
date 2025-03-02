import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class LoginData {
  Crud crud;
  LoginData({
    required this.crud,
  });
  postdata({required String email,required String password}) async {
    var response = await crud
        .postData(AppLink.login, {
          'email':email,
          'password':password
        });
    return response.fold((left)=>left, (right)=>right);
  }
}