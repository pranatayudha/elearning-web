// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:ui';

import 'package:elearning_fe/constants/iconConstants.dart';
import 'package:elearning_fe/constants/imageConstant.dart';
import 'package:elearning_fe/constants/style.dart';
import 'package:elearning_fe/widgets/contentRight.dart';
import 'package:elearning_fe/widgets/siderbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../classSchedule/schedule_viewmodel.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
                    SiderBar(index: 1),
                    RightContent(
                      name: vm.profileModel.data!.fullName ?? '',
                      nip: vm.profileModel.data!.nip ?? '',
                      icon: vm.profileModel.data!.fullName ?? '',
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          // Pareng Page
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                color: neutral100,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 244,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(96, 97, 112, 0.1),
                                          blurRadius: 5,
                                          offset: Offset(0, 0.5),
                                        )
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  padding: EdgeInsets.all(38),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Profile Siswa',
                                        style: TextStyle(
                                          color: neutral100,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: blue70,
                                            ),
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 100,
                                            child: Text(
                                              vm.profileModel.data!
                                                  .fullName![0],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24),
                                            ),
                                          ),
                                          SizedBox(width: 24),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                vm.profileModel.data!.fullName!,
                                                style: TextStyle(
                                                  color: neutral100,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'XII. IPA 1   .   ${vm.profileModel.data!.nip == null ? vm.profileModel.data!.nis : vm.profileModel.data!.nip}',
                                                style: TextStyle(
                                                  color: neutral80,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                '${vm.profileModel.data!.email}   .   ${vm.profileModel.data!.phone}',
                                                style: TextStyle(
                                                  color: neutral80,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 32),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 111,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                            ),
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  96, 97, 112, 0.1),
                                              blurRadius: 5,
                                              offset: Offset(0, 0.5),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Image.asset(
                                            ImageConstants.layerBack,
                                            scale: 4.6,
                                          ),
                                          Image.asset(
                                            ImageConstants.document,
                                            scale: 5,
                                          ),
                                          Positioned(
                                            left: 24,
                                            bottom: 24,
                                            child: Text(
                                              'Panduan Penggunaan E-Learning',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: neutral100,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Container(
                                      height: 111,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1),
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                            ),
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  96, 97, 112, 0.1),
                                              blurRadius: 5,
                                              offset: Offset(0, 0.5),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Image.asset(
                                            ImageConstants.layerBack,
                                            scale: 4.6,
                                          ),
                                          Image.asset(
                                            ImageConstants.documentYellow,
                                            scale: 5,
                                          ),
                                          Positioned(
                                            left: 24,
                                            bottom: 24,
                                            child: Text(
                                              'Panduan Ujian Online',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: neutral100,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
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
