// ignore_for_file: prefer_const_constructors

import 'package:elearning_fe/constants/style.dart';
import 'package:elearning_fe/pages/classSchedule/schedule_view.dart';
import 'package:elearning_fe/pages/dashboard/dashboard.dart';
import 'package:elearning_fe/pages/exam/exam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/iconConstants.dart';
import '../constants/imageConstant.dart';

class SiderBar extends StatelessWidget {
  final int index;
  const SiderBar({
    Key? key,
    this.index = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        color: neutral20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset(
              ImageConstants.schoolLogo,
              filterQuality: FilterQuality.high,
              scale: 5.5,
            ),
            const SizedBox(height: 70),
            // Kondisi ketika berada sidebar yang dipilih
            if (index == 1)
              ElevatedButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      IconConstants.menuHome,
                      color: neutral10,
                      scale: 1.8,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                          color: neutral10,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.6,
                          fontSize: 16),
                    ),
                  ],
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: blue70,
                  padding: const EdgeInsets.fromLTRB(16, 14, 0, 14),
                ),
              ),
            // kondisi yang sidebar yang tidak dipilih
            if (index != 1)
              InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconConstants.menuHome,
                        scale: 2,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            color: neutral70,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.toNamed('/');
                },
              ),
            SizedBox(height: 24),
            if (index == 2)
              ElevatedButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      IconConstants.menuCalender,
                      color: neutral10,
                      scale: 1.8,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Jadwal Kelas',
                      style: TextStyle(
                          color: neutral10,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ],
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: blue70,
                  padding: const EdgeInsets.fromLTRB(16, 14, 0, 14),
                ),
              ),
            if (index != 2)
              InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconConstants.menuCalender,
                        color: neutral70,
                        scale: 2,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Jadwal Kelas',
                        style: TextStyle(
                            color: neutral70,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, '/schedule');
                  Get.toNamed('/schedule');
                },
              ),
            SizedBox(height: 24),
            if (index == 3)
              ElevatedButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      IconConstants.menuBook,
                      color: neutral10,
                      scale: 1.8,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Ujian',
                      style: TextStyle(
                          color: neutral10,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.6,
                          fontSize: 16),
                    ),
                  ],
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: blue70,
                  padding: const EdgeInsets.fromLTRB(16, 14, 0, 14),
                ),
              ),
            if (index != 3)
              InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconConstants.menuBook,
                        scale: 2,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Ujian',
                        style: TextStyle(
                          color: neutral70,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, '/exam');
                  Get.toNamed('/exam');
                },
              ),
          ],
        ),
      ),
    );
  }
}
