import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData({
    required this.crud,
  });
  postdata({required String email,required String verifycode}) async {
    var response = await crud
        .postData(AppLink.forgetpasswordverifycode, {
          'verifycode':verifycode,
          'email':email,
        });
    return response.fold((left)=>left, (right)=>right);
  }
}