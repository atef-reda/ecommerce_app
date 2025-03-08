import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class SignUpData {
  Crud crud;
  SignUpData({
    required this.crud,
  });
  postdata({required String username,required String email,required String phone ,required String password}) async {
    var response = await crud
        .postData(AppLink.signup, {
          'username':username,
          'email':email,
          'phone':phone,
          'password':password
        });
    return response.fold((left)=>left, (right)=>right);
  }
}
