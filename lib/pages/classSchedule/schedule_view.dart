// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'dart:html';
import 'dart:ui';

import 'package:elearning_fe/constants/style.dart';
import 'package:elearning_fe/pages/classSchedule/schedule_detail_view.dart';
import 'package:elearning_fe/pages/classSchedule/schedule_viewmodel.dart';
import 'package:elearning_fe/widgets/siderbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../constants/iconConstants.dart';
import '../../constants/imageConstant.dart';
import '../../widgets/contentRight.dart';

class ScheduleClass extends StatelessWidget {
  const ScheduleClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
        viewModelBuilder: () => ScheduleViewModel(),
        onModelReady: (vm) => vm.initialise(),
        builder: (context, vm, child) {
          return vm.loadingProfile
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : vm.loadingSchedule
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Scaffold(
                      body: SafeArea(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SiderBar(index: 2),
                            RightContent(
                              name: vm.profileModel.data!.fullName ?? '',
                              nip: vm.profileModel.data!.nip ?? '',
                              icon: vm.profileModel.data!.fullName ?? '',
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 80),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jadwal Kelas',
                                      style: TextStyle(
                                        color: neutral100,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    // Section Title Year Learning  and Search
                                    Row(
                                      children: [
                                        // Subtitle Tahun Pelajar
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tahun Pelajaran 2021/2022',
                                              style: TextStyle(
                                                  color: neutral100,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Masuk pada Mata pelajaran dengan jadwal yang telah ditentukan',
                                              style: TextStyle(
                                                  color: neutral80,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 74),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Divider(
                                      thickness: 1,
                                      color: Color(0xffC2C2C2),
                                    ),
                                    SizedBox(height: 30),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 76),
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        crossAxisCount: 3,
                                        childAspectRatio: 0.80,
                                        mainAxisSpacing: 24,
                                        crossAxisSpacing: 24,
                                        padding: EdgeInsets.zero,
                                        children: List.generate(
                                          vm.listModel.data!.length,
                                          (index) {
                                            final data =
                                                vm.listModel.data![index];
                                            return Card(
                                              color: Colors.white,
                                              child: Container(
                                                width: 330,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 4,
                                                        offset: Offset(0, 4),
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.1)),
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        offset: Offset(0, 0.5),
                                                        color: Color.fromRGBO(
                                                            96, 97, 112, 0.1))
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        color:
                                                            Color(0xff51A94F),
                                                      ),
                                                      padding:
                                                          EdgeInsets.all(24),
                                                      child: Text(
                                                        data.mapel!,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(24),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  data.guru!,
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        neutral100,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            8,
                                                                            4,
                                                                            8,
                                                                            4),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(data
                                                                          .kelasDimulai!
                                                                      ? 0xffEEFFEE
                                                                      : 0xffF9F9F9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            4),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  data.kelasDimulai!
                                                                      ? 'Kelas Dimulai'
                                                                      : 'Belum dimulai',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(data
                                                                            .kelasDimulai!
                                                                        ? 0xff51A94F
                                                                        : 0xff768D9B),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 8),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              data.nip!,
                                                              style: TextStyle(
                                                                color:
                                                                    neutral80,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 24),
                                                          Divider(
                                                            thickness: 1,
                                                            color: Color(
                                                                0xffC2C2C2),
                                                          ),
                                                          SizedBox(height: 24),
                                                          // Jadwal section
                                                          Text(
                                                            'Jadwal',
                                                            style: TextStyle(
                                                              color: neutral100,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            '${data.hari} - ${data.startedAt!.split(':')[0]}:${data.startedAt!.split(':')[1]} - ${data.endedAt!.split(':')[0]}:${data.endedAt!.split(':')[1]}',
                                                            style: TextStyle(
                                                              color: neutral80,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          SizedBox(height: 16),
                                                          // Section Button
                                                          InkWell(
                                                            mouseCursor:
                                                                MaterialStateMouseCursor
                                                                    .clickable,
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  '/detailClass?id=${data.id}');
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          12,
                                                                          0,
                                                                          12),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: blue70,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          8),
                                                                ),
                                                              ),
                                                              child: Text(
                                                                'Masuk Kelas',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
        });
  }
}
