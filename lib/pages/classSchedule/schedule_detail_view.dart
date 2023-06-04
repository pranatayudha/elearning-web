// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:ui';

import 'package:elearning_fe/constants/iconConstants.dart';
import 'package:elearning_fe/infrastructure/database/preft_util.dart';
import 'package:elearning_fe/widgets/contentRight.dart';
import 'package:elearning_fe/widgets/siderbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../constants/style.dart';
import 'schedule_viewmodel.dart';

class ScheduleDetail extends StatelessWidget {
  const ScheduleDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Get.parameters['id']);
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(jadwalId: Get.parameters['id']),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) {
        return vm.loadingSchedule && vm.loadingProfile
            ? Center(
                child: CircularProgressIndicator(),
              )
            : vm.loadingDetailClass
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
                                children: [
                                  // Navigate and Title
                                  Row(
                                    children: [
                                      InkWell(
                                        mouseCursor:
                                            MaterialStateMouseCursor.clickable,
                                        onTap: () => Get.back(),
                                        child: Image.asset(
                                            IconConstants.chevronLeft,
                                            scale: 3),
                                      ),
                                      SizedBox(width: 25),
                                      Text(
                                        'Detail Kelas',
                                        style: TextStyle(
                                          color: neutral100,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 32),
                                  // Information Page
                                  Row(
                                    children: [
                                      // Mata Pelajaran
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 200,
                                          padding: EdgeInsets.fromLTRB(
                                              24, 24, 0, 24),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              color: Colors.white,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                ),
                                                BoxShadow(
                                                  blurRadius: 5,
                                                  offset: Offset(0, 5),
                                                  color: Color.fromRGBO(
                                                      96, 97, 112, 0.1),
                                                )
                                              ]),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 4),
                                                child: Text(
                                                  'Mata Pelajaran',
                                                  style: TextStyle(
                                                    color: neutral80,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 12),
                                                child: Text(
                                                  vm.scheduleDetailModel.data!
                                                      .mapel!,
                                                  style: TextStyle(
                                                    color: green50,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 8),
                                                child: Text(
                                                  vm.scheduleDetailModel.data!
                                                      .guru!,
                                                  style: TextStyle(
                                                    color: neutral100,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                vm.scheduleDetailModel.data!
                                                    .nip!,
                                                style: TextStyle(
                                                  color: neutral80,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      // Jadwal Kelas
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 200,
                                          padding: EdgeInsets.fromLTRB(
                                              24, 24, 0, 36),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              // ignore: prefer_const_literals_to_create_immutables
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                ),
                                                BoxShadow(
                                                  blurRadius: 5,
                                                  offset: Offset(0, 5),
                                                  color: Color.fromRGBO(
                                                      96, 97, 112, 0.1),
                                                )
                                              ]),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 12),
                                                child: Text(
                                                  'Jadwal Kelas',
                                                  style: TextStyle(
                                                    color: neutral100,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              GridView.count(
                                                shrinkWrap: true,
                                                crossAxisCount: 1,
                                                childAspectRatio: 8,
                                                padding: EdgeInsets.zero,
                                                children: List.generate(
                                                    vm
                                                        .scheduleDetailModel
                                                        .data!
                                                        .times!
                                                        .length, (index) {
                                                  return Container(
                                                    width: 146,
                                                    child: Text(
                                                      vm.scheduleDetailModel
                                                          .data!.times![index],
                                                      style: TextStyle(
                                                        color: neutral80,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                    ],
                                  ),
                                  SizedBox(height: 32),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Pastikan Anda hadir pada semua pertemuan di mata pelajaran ini',
                                        style: TextStyle(
                                            color: neutral80,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Divider(color: neutral50, thickness: 1),
                                  SizedBox(height: 24),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 120),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        // ignore: prefer_const_literals_to_create_immutables
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
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
                                      ),
                                      child: Table(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        border: TableBorder(
                                            horizontalInside: BorderSide(
                                                color: Color(0xffF7F7F7))),
                                        columnWidths: {
                                          0: FlexColumnWidth(0.6),
                                          1: FlexColumnWidth(1),
                                          2: FlexColumnWidth(0.8),
                                          3: FlexColumnWidth(1),
                                          4: FlexColumnWidth(1),
                                          5: FlexColumnWidth(1),
                                        },
                                        children: [
                                          _buildSchedule(
                                              'pertemuan',
                                              'dayDate',
                                              'materi',
                                              'rangkuman',
                                              'beritaAcara',
                                              'statusAbsen',
                                              true,
                                              false,
                                              '',
                                              ''),
                                          for (var i = 0;
                                              i <
                                                  vm.scheduleDetailModel.data!
                                                      .pertemuan!.length;
                                              i++)
                                            _buildSchedule(
                                                vm.scheduleDetailModel.data!
                                                    .pertemuan![i].pertemuanKe
                                                    .toString(),
                                                '${vm.scheduleDetailModel.data!.hari},  ${vm.formatDate(vm.scheduleDetailModel.data!.pertemuan![i].dateOfMeet!)}, ${vm.scheduleDetailModel.data!.times![0].split(' - ')[1]} - ${vm.scheduleDetailModel.data!.times![0].split(' - ')[2]}',
                                                vm.scheduleDetailModel.data!
                                                    .pertemuan![i].materi!,
                                                vm.scheduleDetailModel.data!
                                                    .pertemuan![i].rangkuman!,
                                                vm.scheduleDetailModel.data!
                                                    .pertemuan![i].beritaAcara!,
                                                vm.scheduleDetailModel.data!
                                                    .pertemuan![i].isAbsen
                                                    .toString(),
                                                false,
                                                vm.scheduleDetailModel.data!
                                                                .pertemuan!.length -
                                                            1 ==
                                                        i
                                                    ? true
                                                    : false,
                                                vm.scheduleDetailModel.data!
                                                    .pertemuan![i].id!,
                                                i.toString())
                                        ],
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
      },
    );
  }

  TableRow _buildSchedule(
      String pertemuan,
      String dayDate,
      String materi,
      String rangkuman,
      String beritaAcara,
      String statusAbsen,
      bool isTitle,
      bool isLastRow,
      String meeting_id,
      String index) {
    print('absen $statusAbsen');
    return TableRow(
      decoration: BoxDecoration(
        color: isTitle ? Color(0xffF7F7F7) : Color(0xffFDFDFD),
        borderRadius: isLastRow
            ? BorderRadius.only(
                bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
            : isTitle
                ? BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))
                : null,
      ),
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: Text(isTitle ? "Pertemuan" : pertemuan,
              style: isTitle
                  ? TextStyle(
                      fontSize: 14,
                      color: neutral100,
                      fontWeight: FontWeight.w600,
                    )
                  : TextStyle(
                      fontSize: 14,
                      color: neutral80,
                      fontWeight: FontWeight.w400)),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: Text(
            isTitle ? 'Hari, Tanggal' : dayDate,
            style: isTitle
                ? TextStyle(
                    fontSize: 14,
                    color: neutral100,
                    fontWeight: FontWeight.w600,
                  )
                : TextStyle(
                    fontSize: 14,
                    color: neutral80,
                    fontWeight: FontWeight.w400,
                  ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: Text(
            isTitle ? 'Materi' : materi,
            style: isTitle
                ? TextStyle(
                    fontSize: 14,
                    color: neutral100,
                    fontWeight: FontWeight.w600,
                  )
                : TextStyle(
                    fontSize: 14,
                    color: neutral80,
                    fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: Text(
            isTitle ? 'Rangkuman' : rangkuman,
            textAlign: isTitle ? null : TextAlign.justify,
            style: isTitle
                ? TextStyle(
                    fontSize: 14,
                    color: neutral100,
                    fontWeight: FontWeight.w600,
                  )
                : TextStyle(
                    fontSize: 14,
                    color: neutral80,
                    fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: Text(
            isTitle ? 'Berita Acara' : beritaAcara,
            textAlign: isTitle ? null : TextAlign.justify,
            style: isTitle
                ? TextStyle(
                    fontSize: 14,
                    color: neutral100,
                    fontWeight: FontWeight.w600,
                  )
                : TextStyle(
                    fontSize: 14,
                    color: neutral80,
                    fontWeight: FontWeight.w400,
                  ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(24, 16, 20, 16),
          child: isTitle
              ? Text(
                  'Status Absen',
                  style: TextStyle(
                    fontSize: 14,
                    color: neutral100,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : InkWell(
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onTap: () {
                    Get.toNamed(
                        '/meetingDetail?schedule_id=${Get.parameters['id']}&meeting_id=${meeting_id}&index=$index');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: statusAbsen == 'true'
                                ? Color(0xffEEFFEE)
                                : statusAbsen == 'false'
                                    ? Color(0xffFBE7E9)
                                    : Color(0xffF9F9F9),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: Text(
                          statusAbsen == 'true'
                              ? 'Hadir'
                              : statusAbsen == 'false'
                                  ? 'Tidak Hadir'
                                  : 'Belum dimulai',
                          style: TextStyle(
                            color: statusAbsen == 'true'
                                ? Color(0xff51A94F)
                                : statusAbsen == 'false'
                                    ? red60
                                    : Color(0xff768D9B),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Image.asset(IconConstants.chevronRight, scale: 3),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
