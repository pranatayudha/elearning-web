import 'package:elearning_fe/models/schedule_detail_model.dart';
import 'package:elearning_fe/models/schedule_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';

import '../../constants/keys_preference.dart';
import '../../infrastructure/apis/dashboard_api/schedule_class_api.dart';

import 'dart:developer' as dev;

import '../../infrastructure/apis/master_api.dart';
import '../../infrastructure/database/preft_util.dart';
import '../../models/profile_model.dart';

class ScheduleViewModel extends BaseViewModel {
  final String? jadwalId;

  ScheduleViewModel({this.jadwalId});

  final _scheduleAPI = ScheduleAPI();
  final _masterAPI = MasterAPI();
  // final _sharedPrefs = SharedPrefs();
  ProfileModel? _profileModel;
  ProfileModel get profileModel => _profileModel!;

  bool loadingProfile = true;

  Future getProfile() async {
    final res = await runBusyFuture(_masterAPI.getProfile());

    res.fold((left) {
      _profileModel = left;
      loadingProfile = false;
    }, (right) {
      _profileModel = right;
      loadingProfile = false;
    });
  }

  void initialise() async {
    await getProfile();
    await _prepopulateProfile();
    if (loadingProfile == false) {
      await getScheduleClassList();
    }
    if (jadwalId!.isNotEmpty) {
      getScheduleDetail(jadwalId!);
    }
  }

  Future _prepopulateProfile() async {
    nameProfileController.text = profileModel.data!.fullName!;
    emailProfileController.text = profileModel.data!.email!;
    phoneProfileController.text = profileModel.data!.phone!;
  }

  final nameProfileController = TextEditingController();
  final emailProfileController = TextEditingController();
  final phoneProfileController = TextEditingController();
  // final nameProfileController = TextEditingController();

  Map<String, dynamic> _generateDataUpdateProfile() {
    return {
      'nip_nis': PrefUtil.getValue('nisnip', 'fdsfsd'),
      'file_text': 'fdsfsdfsd',
      'fullName': nameProfileController.text,
      'email': emailProfileController.text,
      'phone': phoneProfileController.text,
    };
  }

  Future updateProfile() async {
    final data = _generateDataUpdateProfile();
    final res = await runBusyFuture(_masterAPI.putProfile(data));

    res.fold((left) {
      print('GAGAL UPLOAD PROFILE');
    }, (right) {
      print('SUKSES UPDATE PROFILE');
    });
  }

  ScheduleListModel? _listModel;
  ScheduleListModel get listModel => _listModel!;

  bool loadingSchedule = true;

  final dayFilterController = TextEditingController();

  Future getScheduleClassList() async {
    final res = await runBusyFuture(
        _scheduleAPI.getScheduleList(dayFilterController.text));

    res.fold(
      (error) {
        _listModel = error;
        loadingSchedule = false;
      },
      (result) {
        _listModel = result;
        loadingSchedule = false;
      },
    );
  }

  ScheduleDetailModel? _scheduleDetailModel;
  ScheduleDetailModel get scheduleDetailModel => _scheduleDetailModel!;

  bool loadingDetailClass = true;

  Future getScheduleDetail(String jadwalId) async {
    final res = await runBusyFuture(_scheduleAPI.getScheduleDetail(jadwalId));

    res.fold((error) {
      _scheduleDetailModel = error;
      loadingDetailClass = false;
    }, (result) {
      _scheduleDetailModel = result;
      loadingDetailClass = false;
    });
  }

  void getValueClassOn(String jadwalId) async {
    await getScheduleDetail(jadwalId);
  }

  Future postAbsen(String id) async {
    final res = await runBusyFuture(_masterAPI.postAbsen(id));

    res.fold((left) {
      print('FOLD $left');
    }, (result) async {
      print('FOLD $result');
      await _prepopulateProfile();
      if (loadingProfile == false) {
        await getScheduleClassList();
      }
      if (jadwalId!.isNotEmpty) {
        getScheduleDetail(jadwalId!);
      }
    });
  }

  String formatDate(String date) {
    print('var $date');
    final inputDate = DateFormat('yyy-MM-dd').parse(date);
    print('input $inputDate');
    final outputFormat = DateFormat('dd/MM/yyyy').format(inputDate);
    print('input $outputFormat');
    return outputFormat;
  }

  String formatDateWithDay(String date) {
    print('var $date');
    final inputDate = DateFormat('yyy-MM-dd').parse(date);
    print('input $inputDate');
    final outputFormat = DateFormat('EEEE').format(inputDate);
    print('input $outputFormat');
    return outputFormat;
  }

  int menuMateriController = 1;

  void menuMateri(int index) {
    menuMateriController = index;
    notifyListeners();
  }

  final linkUpload = TextEditingController();

  void getUploadTask(String id) async {
    print(id);
    notifyListeners();
    await uploadTask(id);
  }

  void deleteTask() {
    linkUpload.clear();
    notifyListeners();
  }

  Future uploadTask(String id) async {
    final res = await runBusyFuture(_masterAPI.uploadFile(id, linkUpload.text));

    res.fold((left) {
      print('GAGAL UPLOAD PROFILE');
    }, (right) {
      Get.back();
    });
  }

  Future logout() async {
    PrefUtil.deleteValue('token');
    PrefUtil.deleteValue('role');
    PrefUtil.deleteValue('fullName');
    PrefUtil.deleteValue('nisnip');
    Get.toNamed('/login');
  }
}
