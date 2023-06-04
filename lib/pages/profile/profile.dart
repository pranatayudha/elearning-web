// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';
import 'dart:ui';

import 'package:elearning_fe/constants/style.dart';
import 'package:elearning_fe/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/contentRight.dart';
import '../../widgets/siderbar.dart';
import '../classSchedule/schedule_viewmodel.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) => vm.loadingProfile
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SiderBar(index: 0),
                    RightContent(
                      name: vm.profileModel.data!.fullName ?? '',
                      nip: vm.profileModel.data!.nip ?? '',
                      icon: vm.profileModel.data!.fullName ?? '',
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          //Parent Page
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: neutral100,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Lakukan perubahan password secara berkala demi keamanan akun Anda',
                              style: TextStyle(
                                color: neutral80,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                    BoxShadow(
                                      color: Color.fromRGBO(96, 97, 112, 0.1),
                                      blurRadius: 5,
                                      offset: Offset(0, 0.5),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              padding: EdgeInsets.all(40),
                              margin: EdgeInsets.only(bottom: 65),
                              child: Column(
                                children: [
                                  // Profile Foto section
                                  Row(
                                    children: [
                                      // Profile Foto Circle
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: blue70,
                                        ),
                                        alignment: Alignment.center,
                                        width: 120,
                                        height: 120,
                                        child: Text(
                                          'PR',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24),
                                        ),
                                      ),
                                      SizedBox(width: 24),
                                      // Upload Foto
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            mouseCursor:
                                                MaterialStateMouseCursor
                                                    .clickable,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  14.5, 8, 14.5, 8),
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: blue70),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                'Upload foto baru',
                                                style: TextStyle(
                                                  color: blue70,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            'Pilih foto maks 10 Mb, dengan ektensi file .JPG, .JPEG, .PNG',
                                            style: TextStyle(
                                              color: neutral80,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 32),
                                  // Field Profile Section
                                  CustomTextField(
                                    label: 'Nama Lengkap',
                                    hintText: 'Masukkan Nama Lengkap',
                                    textEditingController:
                                        vm.nameProfileController,
                                    onSave: () {},
                                  ),
                                  CustomTextField(
                                    label: 'Email',
                                    hintText: 'Masukkan alamat email',
                                    textEditingController:
                                        vm.emailProfileController,
                                    onSave: () {},
                                  ),
                                  CustomTextField(
                                    label: 'No. Hp',
                                    hintText: 'Masukkan Nomor Handphone',
                                    textEditingController:
                                        vm.phoneProfileController,
                                    onSave: () {},
                                  ),
                                  SizedBox(height: 22),
                                  // button simpan
                                  InkWell(
                                    onTap: () async {
                                      await vm.updateProfile();
                                      Get.toNamed('/');
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: blue70,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        'Simpan',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
