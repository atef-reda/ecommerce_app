import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData({
    required this.crud,
  });
  postdata({required String email,required String verifycode}) async {
    var response = await crud
        .postData(AppLink.verifycode, {
          'verifycode':verifycode,
          'email':email,
        });
    return response.fold((left)=>left, (right)=>right);
  }
}
