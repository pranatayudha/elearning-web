import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:elearning_fe/constants/base_url.dart';
import 'package:elearning_fe/infrastructure/database/preft_util.dart';
import 'package:elearning_fe/models/schedule_detail_model.dart';
import 'package:elearning_fe/models/schedule_list_model.dart';

class ScheduleAPI {
  final _dio = Dio();

  Options options() {
    return Options(
      contentType: 'application/json',
      followRedirects: false,
      validateStatus: (status) => true,
      headers: {
        'authorization':
            'Bearer ${PrefUtil.getValue('token', 'sdfsdfsfsdfds')}',
        'Accept': '*/*',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': true,
        'Access-Control-Allow-Headers':
            'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
        'Access-Control-Allow-Methods': 'GET, HEAD, POST, OPTIONS'
      },
    );
  }

  Future<Either<ScheduleListModel, ScheduleListModel>> getScheduleList(
      String day) async {
    try {
      final String url = '$base_url/v1/jadwal?day=$day';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return Right(ScheduleListModel.fromJson(res.data));
    } on DioError catch (e) {
      return Left(ScheduleListModel.fromJson(e.response!.data!));
    }
  }

  Future<Either<ScheduleDetailModel, ScheduleDetailModel>> getScheduleDetail(
      String jadwalId) async {
    try {
      final String url = '$base_url/v1/jadwal/$jadwalId';

      final res = await _dio.get(
        url,
        options: options(),
      );

      return Right(ScheduleDetailModel.fromJson(res.data));
    } on DioError catch (e) {
      return Left(ScheduleDetailModel.fromJson(e.response!.data));
    }
  }
}
