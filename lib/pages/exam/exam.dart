// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:ui';

import 'package:elearning_fe/constants/imageConstant.dart';
import 'package:elearning_fe/constants/style.dart';
import 'package:elearning_fe/widgets/siderbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/contentRight.dart';
import '../classSchedule/schedule_viewmodel.dart';

class Exam extends StatelessWidget {
  const Exam({Key? key}) : super(key: key);

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
                      SiderBar(index: 3),
                      RightContent(
                        name: vm.profileModel.data!.fullName ?? '',
                        icon: vm.profileModel.data!.fullName ?? '',
                        nip: vm.profileModel.data!.nip ?? '',
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConstants.illustrationPeople,
                                scale: 1.5,
                              ),
                              SizedBox(height: 24),
                              Text(
                                'Fitur Belum Tersedia!',
                                style: TextStyle(
                                  color: neutral80,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                'Fitur ujian akan tersedia di versi berikutnya.',
                                style: TextStyle(
                                  color: neutral80,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}
