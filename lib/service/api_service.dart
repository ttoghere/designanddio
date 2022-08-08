import 'dart:convert';
import 'dart:io';

import 'package:designanddio/config.dart';
import 'package:designanddio/models/customer.dart';
import 'package:designanddio/models/login_model.dart';
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
        print("Successful");
        ret = true;
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 404) {
        print("Error: $error");
        ret = false;
      } else {
        print("Error: $error");
        ret = false;
      }
    }
    return ret;
  }

  Future<LoginModel> loginCustomer(String username, String password) async {
    late LoginModel model;
    try {
      var response = await Dio().post(
        Config.tokenUrl,
        data: {
          "username": username,
          "password": password,
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );
      if (response.statusCode == 200) {
        model = LoginModel.fromJson(response.data);
      }
    } catch (error) {
      print(error.toString());
    }
    return model;
  }
}
