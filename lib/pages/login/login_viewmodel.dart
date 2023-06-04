import 'dart:html';

import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import '../../constants/keys_preference.dart';
import '../../infrastructure/apis/master_api.dart';
import '../../infrastructure/database/preft_util.dart';

class LoginViewModel extends BaseViewModel {
  final _masterAPI = MasterAPI();
  final _sharedPrefs = PrefUtil();

  bool obscureController = true;
  final roleController = TextEditingController();
  final nisOrnipController = TextEditingController();
  final passwordController = TextEditingController();

  void funcObscure() {
    obscureController = !obscureController;
    notifyListeners();
  }

  void getValue(String value) {
    roleController.text = value;
  }

  void initialise() async {}

  Map<String, dynamic> _generateDataLogin() {
    return {
      'nip_nis': nisOrnipController.text.trim(),
      'password': passwordController.text.trim(),
      'role': roleController.text.toLowerCase().trim(),
    };
  }

  bool isDoneFieldLogin() {
    return true;
  }

  Future postLogin() async {
    final data = _generateDataLogin();
    final res = await runBusyFuture(_masterAPI.postLogin(data));
    res.fold((error) {
      AlertDialog(
        title: Text('Gagal login'),
        content: Text(error.message!),
        actions: [
          InkWell(
            onTap: () => Get.back(),
            mouseCursor: MaterialStateMouseCursor.clickable,
            child: Container(
              child: Text('Coba lagi'),
            ),
          )
        ],
      );
    }, (result) async {
      print('VIEWMODEL LOGIN ${result.data!.role}');
      if (result.code == 200) {
        PrefUtil.setValue('token', result.data!.accessToken!);
        PrefUtil.setValue('role', result.data!.role!);
        PrefUtil.setValue('fullName', result.data!.fullName!);
        PrefUtil.setValue('nisnip', result.data!.nipNis!);
        Get.toNamed('/');
      }
    });
  }
}
