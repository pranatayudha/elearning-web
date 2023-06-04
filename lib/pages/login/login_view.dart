// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:ui';

import 'package:elearning_fe/constants/imageConstant.dart';
import 'package:elearning_fe/constants/style.dart';
import 'package:elearning_fe/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _salutations = ["Guru", "Siswa"];
    var _currencies = ['Rupee', 'Dollar', 'Pound'];
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  ImageConstants.layerLogin,
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  scale: 0.1,
                  alignment: Alignment.bottomLeft,
                ),
                Image.asset(
                  ImageConstants.illustrationLogin,
                  scale: 1.1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Image.asset(
                    ImageConstants.illustrationPeople,
                    scale: 1.4,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.only(right: 128),
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageConstants.schoolLogo,
                          filterQuality: FilterQuality.high,
                          scale: 5.5,
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Masuk ke E-Learning SMAN 20 Jakarta',
                          style: TextStyle(
                            color: neutral100,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 60),
                        CustomTextField(
                          label: 'NIP Guru / NIS Siswa',
                          hintText: 'Masukkan NIP Guru / NIS Siswa',
                          textEditingController: vm.nisOrnipController,
                          onSave: () {},
                        ),
                        CustomTextField(
                          label: 'Password',
                          hintText: 'Masukkan Password',
                          textEditingController: vm.passwordController,
                          obscureText: vm.obscureController,
                          withObscureIcon: true,
                          onTap: () {
                            vm.funcObscure();
                          },
                          onSave: () {},
                        ),
                        // CustomTextField(
                        //   label: 'Peran',
                        //   hintText: 'Masukkan Peran anda (Guru / Siswa)',
                        //   textEditingController: vm.roleController,
                        //   onSave: () {},
                        // ),
                        CustomDropdownField(
                          label: 'Peran',
                          hintText: 'Pilih Peran Anda',
                          items: const ['Guru', 'Siswa'],
                          onChanged: (String? val) {
                            vm.getValue(val!);
                          },
                          value: vm.roleController.text,
                        ),
                        SizedBox(height: 50),
                        InkWell(
                          mouseCursor: MaterialStateMouseCursor.clickable,
                          onTap: vm.isDoneFieldLogin()
                              ? () => vm.postLogin()
                              : null,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: vm.isDoneFieldLogin() ? blue70 : blue20,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
