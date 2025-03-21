import 'package:get/get.dart';

String? validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'not valid user name';
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'not valid email';
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'not valid phone number';
    }
  }

  if (val.length < min) {
    return 'can\'t be less than $min ';
  }

  if (val.length > max) {
    return 'can\'t be greater than $max ';
  }

  if (val.isEmpty) {
    return 'can\'t be empty ';
  }
  return null;
}
