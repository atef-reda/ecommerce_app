import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData({
    required this.crud,
  });
  postdata({required String email,required String password}) async {
    var response = await crud
        .postData(AppLink.forgetpasswordresetpassword, {
          'email':email,
          'password':password
        });
    return response.fold((left)=>left, (right)=>right);
  }
}