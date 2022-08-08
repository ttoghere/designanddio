import 'dart:convert';
import 'dart:io';

import 'package:designanddio/config.dart';
import 'package:designanddio/models/customer.dart';
import 'package:dio/dio.dart';

class APIService {
  Future<bool> createCustomer(CustomerModel customerModel) async {
    var authToken = base64.encode(
      utf8.encode(
        "${Config.key}:${Config.sKey}",
      ),
    );
    bool ret = false;

    try {
      var response = await Dio().post(
        Config.url + Config.cUrl,
        data: customerModel.toJson(),
        options: Options(headers: {
          HttpHeaders.authorizationHeader: "Basic $authToken",
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 404) {
        ret = false;
      } 
    }
    return ret;
  }
}
