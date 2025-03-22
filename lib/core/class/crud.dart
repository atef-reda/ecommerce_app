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
        print('--------------------  http.post -----------------');
        var response = await http.post(Uri.parse(linkurl), body: data);
        print('-------------------- ${response.statusCode} -----------------');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return Left(StatusRequest.serverfailure);
        }
      } else {
        return Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return Left(StatusRequest.serverexecption);
    }
  }
}
