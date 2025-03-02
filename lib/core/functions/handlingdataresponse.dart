import 'package:ecommerce_app/core/class/statusrequest.dart';

handlingDataResponse(var response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
