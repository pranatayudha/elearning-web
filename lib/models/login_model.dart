class LoginModel {
  bool? success;
  Data? data;
  String? message;
  int? code;

  LoginModel({this.success, this.data, this.message, this.code});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? nipNis;
  String? role;
  String? fullName;
  String? accessToken;
  String? accessTokenExpiresIn;
  String? createdAt;

  Data(
      {this.nipNis,
      this.role,
      this.fullName,
      this.accessToken,
      this.accessTokenExpiresIn,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    nipNis = json['nip_nis'];
    role = json['role'];
    fullName = json['fullName'];
    accessToken = json['accessToken'];
    accessTokenExpiresIn = json['accessTokenExpiresIn'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nip_nis'] = this.nipNis;
    data['role'] = this.role;
    data['fullName'] = this.fullName;
    data['accessToken'] = this.accessToken;
    data['accessTokenExpiresIn'] = this.accessTokenExpiresIn;
    data['createdAt'] = this.createdAt;
    return data;
  }
}