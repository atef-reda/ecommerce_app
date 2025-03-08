import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData({
    required this.crud,
  });
  postdata({required String email}) async {
    var response = await crud
        .postData(AppLink.forgetpasswordcheckemail, {
          'email':email,
        });
    return response.fold((left)=>left, (right)=>right);
  }
}