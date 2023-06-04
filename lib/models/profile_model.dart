class ProfileModel {
  bool? success;
  Data? data;
  String? message;
  int? code;

  ProfileModel({this.success, this.data, this.message, this.code});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? photoPath;
  String? fullName;
  String? phone;
  String? email;
  String? kelasId;
  String? nis;
  String? nip;

  Data(
      {this.photoPath,
      this.fullName,
      this.phone,
      this.email,
      this.kelasId,
      this.nis,
      this.nip});

  Data.fromJson(Map<String, dynamic> json) {
    photoPath = json['photo_path'];
    fullName = json['fullName'];
    phone = json['phone'];
    email = json['email'];
    kelasId = json['kelasId'];
    nis = json['nis'];
    nip = json['nip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo_path'] = this.photoPath;
    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['kelasId'] = this.kelasId;
    data['nis'] = this.nis;
    data['nip'] = this.nip;
    return data;
  }
}
