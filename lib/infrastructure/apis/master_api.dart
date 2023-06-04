import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:elearning_fe/constants/base_url.dart';
import 'package:elearning_fe/infrastructure/database/preft_util.dart';
import 'package:elearning_fe/models/login_model.dart';
import 'package:elearning_fe/models/profile_model.dart';

class MasterAPI {
  final _dio = Dio();

  Options options() {
    return Options(
      contentType: 'application/json',
      followRedirects: false,
      validateStatus: (status) => true,
      headers: {
        'authorization': 'Bearer ${PrefUtil.getValue('token', 'fdsfsfsdfs')}',
        'Accept': '*/*',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': true,
        'Access-Control-Allow-Headers':
            'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
        'Access-Control-Allow-Methods': 'GET, HEAD, POST, OPTIONS'
      },
    );
  }

  Future<Either<ProfileModel, ProfileModel>> getProfile() async {
    try {
      const url = '$base_url/v1/home';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return Right(ProfileModel.fromJson(res.data));
    } on DioError catch (e) {
      return Left(ProfileModel.fromJson(e.response!.data!));
    }
  }

  Future<Either<String, String>> putProfile(
      Map<String, dynamic> payload) async {
    try {
      print('data $payload');
      const String url = '$base_url/v1/upload/photo';

      final res = await _dio.put(
        url,
        data: payload,
        options: options(),
      );

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<LoginModel, LoginModel>> postLogin(
      Map<String, dynamic> payload) async {
    try {
      print("data $payload");

      const String url = '$base_url/v1/users/login';

      var auth = 'Basic ' +
          base64Encode(utf8
              .encode('sman20jakarta:bo7l52s3-12d9-11n1-obi5-71cc4738pred'));

      final res = await _dio.post(
        url,
        data: payload,
        options: Options(headers: <String, String>{'authorization': auth}),
      );

      print(res);

      return Right(LoginModel.fromJson(res.data));
    } on DioError catch (e) {
      return Left(LoginModel.fromJson(e.response!.data));
    }
  }

  Future<Either<String, String>> uploadFile(String id, String text) async {
    try {
      const String url = '$base_url/v1/upload/tugas';

      final res = await _dio.put(
        url,
        data: {"id_pertemuan": id, "file_text": text},
        options: options(),
      );

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, String>> postAbsen(String id) async {
    try {
      final String url = '$base_url/v1/absen';

      final res = await _dio.post(
        url,
        data: {"id_pertemuan": id},
        options: options(),
      );

      if (res.data['success'] == false) {
        return Left(res.data['message']);
      }

      return Right(res.data['message']);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
