// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  bool? success;
  int? statusCode;
  String? code;
  String? message;
  Data? data;
  LoginModel({
    required this.success,
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    statusCode = json["statusCode"];
    code = json["code"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["success"] = success;
    data["message"] = message;
    data["code"] = code;
    data["statusCode"] = statusCode;
    if (this.data != null) {
      data["data"] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  int? id;
  String? email;
  String? nicename;
  String? firstName;
  String? lastName;
  String? displayName;
  Data({
    required this.token,
    required this.id,
    required this.email,
    required this.nicename,
    required this.firstName,
    required this.lastName,
    required this.displayName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    id = json["id"];
    email = json["email"];
    nicename = json["nicename"];
    firstName = json["firstName"];
    displayName = json["displayName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["token"] = token;
    data["id"] = id;
    data["email"] = email;
    data["nicename"] = nicename;
    data["firstName"] = firstName;
    data["displayName"] = displayName;
    return data;
  }
}
