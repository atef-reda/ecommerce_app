import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      bool internet = await checkInternet();
      if (internet) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return Left(StatusRequest.serverfaliur);
        }
      } else {
        return Left(StatusRequest.internetfaliur);
      }
    } catch (_) {
      return Left(StatusRequest.serverfaliur);
    }
  }
}
