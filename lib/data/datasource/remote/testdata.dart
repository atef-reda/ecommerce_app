import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';

class TestData {
  Crud crud;
  TestData({
    required this.crud,
  });
  getData() async {
    var response = await crud
        .postData(AppLink.test, {});
    return response.fold((left)=>left, (right)=>right);
  }
}
