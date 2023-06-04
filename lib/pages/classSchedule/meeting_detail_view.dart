// ignore_for_file: prefer_const_constructors

import 'dart:html' as html;
import 'dart:js';
import 'dart:ui';

import 'package:elearning_fe/widgets/contentRight.dart';
import 'package:elearning_fe/widgets/customTextField.dart';
import 'package:elearning_fe/widgets/siderbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../constants/iconConstants.dart';
import '../../constants/imageConstant.dart';
import '../../constants/style.dart';
import '../../infrastructure/database/preft_util.dart';
import 'schedule_viewmodel.dart';

class MeetingDetail extends StatelessWidget {
  const MeetingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () =>
          ScheduleViewModel(jadwalId: Get.parameters['schedule_id']),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) {
        print(Get.parameters['schedule_id']);
        print(Get.parameters['meeting_id']);
        print(Get.parameters['index']);
        return vm.loadingSchedule && vm.loadingProfile && vm.loadingDetailClass
            ? Center(
                child: CircularProgressIndicator(),
              )
            : DefaultTabController(
                length: PrefUtil.getValue('role', 'role') == 'siswa' ? 3 : 4,
                child: Scaffold(
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
                                      'Detail Pertemuan',
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
                                        padding:
                                            EdgeInsets.fromLTRB(24, 24, 0, 24),
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
                                                  EdgeInsets.only(bottom: 8),
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
                                              vm.scheduleDetailModel.data!.nip!,
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
                                        padding:
                                            EdgeInsets.fromLTRB(24, 24, 0, 22),
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
                                            Row(
                                              children: [
                                                _buildListSection(
                                                    'Pertemuan',
                                                    vm
                                                        .scheduleDetailModel
                                                        .data!
                                                        .pertemuan![int.parse(
                                                            Get.parameters[
                                                                'index']!)]
                                                        .pertemuanKe
                                                        .toString()),
                                                SizedBox(width: 130),
                                                _buildListSection(
                                                    'Materi',
                                                    vm
                                                        .scheduleDetailModel
                                                        .data!
                                                        .pertemuan![int.parse(
                                                            Get.parameters[
                                                                'index']!)]
                                                        .materi!),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            _buildListSection(
                                              "Hari & Tanggal",
                                              '${vm.scheduleDetailModel.data!.hari}, ${vm.formatDate(vm.scheduleDetailModel.data!.pertemuan![int.parse(Get.parameters['index']!)].dateOfMeet!.split('T')[0])}',
                                              '${vm.scheduleDetailModel.data!.times![0].split('-')[1].trim()} - ${vm.scheduleDetailModel.data!.times![0].split('-')[2].trim()}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    if (PrefUtil.getValue('role', 'role') ==
                                        'siswa')
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 200,
                                          padding: EdgeInsets.fromLTRB(
                                              24, 24, 24, 24),
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
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  vm.scheduleDetailModel.data!
                                                          .kelasDimulai!
                                                      ? 'Kelas dimulai, harap absen dibawah ini:'
                                                      : 'Kelas belum dimulai',
                                                  style: TextStyle(
                                                      color: neutral80,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              InkWell(
                                                onTap: () {
                                                  vm.postAbsen(vm
                                                      .scheduleDetailModel
                                                      .data!
                                                      .pertemuan![int.parse(
                                                          Get.parameters[
                                                              'index']!)]
                                                      .id!);
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12),
                                                  decoration: BoxDecoration(
                                                    color: vm
                                                            .scheduleDetailModel
                                                            .data!
                                                            .pertemuan![int.parse(
                                                                Get.parameters[
                                                                    'index']!)]
                                                            .isAbsen!
                                                        ? Color(0xff51A94F)
                                                        : blue70,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Text(
                                                    vm
                                                            .scheduleDetailModel
                                                            .data!
                                                            .pertemuan![int.parse(
                                                                Get.parameters[
                                                                    'index']!)]
                                                            .isAbsen!
                                                        ? 'Anda Telah Absen'
                                                        : 'Absen Masuk',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                                SizedBox(height: 24),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: neutral100,
                                      indicatorColor: blue70,
                                      unselectedLabelColor: neutral50,
                                      labelPadding:
                                          EdgeInsets.symmetric(horizontal: 50),
                                      indicatorWeight: 2,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      tabs: [
                                        Tab(
                                          height: 56,
                                          child: Text(
                                            "Materi",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                        Tab(
                                          height: 56,
                                          child: Text(
                                            "Tugas",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                        Tab(
                                          height: 56,
                                          child: Text(
                                            "Diskusi",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                        if (PrefUtil.getValue('role', 'role') ==
                                            'guru')
                                          Tab(
                                            height: 56,
                                            child: Text(
                                              "Absensi",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24),
                                Container(
                                  width: double.maxFinite,
                                  height: 300,
                                  child: TabBarView(
                                    children: [
                                      _buildTabMateri(context, vm),
                                      _buildTableTugas(context, vm),
                                      _buildUpComing(),
                                       if (PrefUtil.getValue('role', 'role') ==
                                            'guru')
                                        _buildUpComing(),
                                    ],
                                  ),
                                ),
                                // _buildTable(context, vm)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Container _buildUpComing() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstants.illustrationPeople,
            scale: 3,
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
          ),
        ],
      ),
    );
  }

  ScrollConfiguration _buildTabMateri(
      BuildContext context, ScheduleViewModel vm) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => vm.menuMateri(1),
                mouseCursor: MaterialStateMouseCursor.clickable,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: BoxDecoration(
                      border: vm.menuMateriController == 1
                          ? null
                          : Border.all(color: Color(0xffE0E0E0)),
                      color:
                          vm.menuMateriController == 1 ? blue70 : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    'Materi Detail',
                    style: TextStyle(
                      color: vm.menuMateriController == 1
                          ? Colors.white
                          : neutral80,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              InkWell(
                mouseCursor: MaterialStateMouseCursor.clickable,
                onTap: () => vm.menuMateri(2),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: BoxDecoration(
                      border: vm.menuMateriController == 2
                          ? null
                          : Border.all(color: Color(0xffE0E0E0)),
                      color:
                          vm.menuMateriController == 2 ? blue70 : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    'Video Pembelajaran',
                    style: TextStyle(
                      color: vm.menuMateriController == 2
                          ? Colors.white
                          : neutral80,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              InkWell(
                mouseCursor: MaterialStateMouseCursor.clickable,
                onTap: () => vm.menuMateri(3),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: BoxDecoration(
                      border: vm.menuMateriController == 3
                          ? null
                          : Border.all(color: Color(0xffE0E0E0)),
                      color:
                          vm.menuMateriController == 3 ? blue70 : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    'Slide Pembelajaran',
                    style: TextStyle(
                      color: vm.menuMateriController == 3
                          ? Colors.white
                          : neutral80,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          // Value dari menu materi
          if (vm.menuMateriController == 1) _buildTable(context, vm),
          if (vm.menuMateriController == 3 || vm.menuMateriController == 2)
            _buildUpComing()
        ],
      ),
    );
  }

  Padding _buildTable(BuildContext context, ScheduleViewModel vm) {
    return Padding(
      padding: EdgeInsets.only(bottom: 120),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          // ignore: prefer_const_literals_to_create_immutables
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
        ),
        child: Table(
          // ignore: prefer_const_literals_to_create_immutables
          border: TableBorder(
              horizontalInside: BorderSide(color: Color(0xffF7F7F7))),
          columnWidths: {
            0: FlexColumnWidth(0.5),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(0.7),
            4: FlexColumnWidth(1),
          },
          children: [
            _buildSchedule(
              'pertemuan',
              'dayDate',
              'materi',
              'rangkuman',
              'beritaAcara',
              true,
              false,
              context,
            ),
            for (var i = 0;
                i < vm.scheduleDetailModel.data!.pertemuan!.length;
                i++)
              _buildSchedule(
                  i.toString(),
                  vm.scheduleDetailModel.data!.pertemuan![i].materi!,
                  vm.scheduleDetailModel.data!.pertemuan![i].rangkuman!,
                  vm.scheduleDetailModel.data!.pertemuan![i].filePathMateri!,
                  '${vm.formatDateWithDay(vm.scheduleDetailModel.data!.pertemuan![i].updatedAt!.split('T')[0])}, ${vm.formatDate(vm.scheduleDetailModel.data!.pertemuan![i].updatedAt!.split('T')[0])}',
                  false,
                  vm.scheduleDetailModel.data!.pertemuan!.length - 1 == i
                      ? true
                      : false,
                  context)
          ],
        ),
      ),
    );
  }

  Padding _buildTableTugas(BuildContext context, ScheduleViewModel vm) {
    return Padding(
      padding: EdgeInsets.only(bottom: 120),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          // ignore: prefer_const_literals_to_create_immutables
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
        ),
        child: Table(
          // ignore: prefer_const_literals_to_create_immutables
          border: TableBorder(
              horizontalInside: BorderSide(color: Color(0xffF7F7F7))),
          columnWidths: {
            0: FlexColumnWidth(0.5),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1.2),
            3: FlexColumnWidth(1.2),
            4: FlexColumnWidth(1),
            5: FlexColumnWidth(1),
            6: FlexColumnWidth(0.7),
          },
          children: [
            _buildScheduleTugas(
                'No',
                'Judul Tugas',
                'Waktu Mulai',
                'Waktu Selesai',
                'Unduh Template',
                'Aksi',
                'Nilai',
                true,
                false,
                context,
                vm),
            for (var i = 0;
                i < vm.scheduleDetailModel.data!.pertemuan!.length;
                i++)
              _buildScheduleTugas(
                  // 1
                  i.toString(),
                  // 2
                  vm.scheduleDetailModel.data!.pertemuan![i].judulTugas!,
                  // 3
                  '${vm.scheduleDetailModel.data!.hari!}, ${vm.formatDate(vm.scheduleDetailModel.data!.pertemuan![i].startTaskTugas!)}, ${vm.scheduleDetailModel.data!.pertemuan![i].startTaskTugas!.split('T')[1].substring(0, 5)}',
                  '${vm.scheduleDetailModel.data!.hari!}, ${vm.formatDate(vm.scheduleDetailModel.data!.pertemuan![i].endTaskTugas!)}, ${vm.scheduleDetailModel.data!.pertemuan![i].endTaskTugas!.split('T')[1].substring(0, 5)}',
                  // 4
                  vm.scheduleDetailModel.data!.pertemuan![i].tamplateTaskTugas!,
                  // 5
                  'fff',
                  // 6,
                  '100',
                  false,
                  vm.scheduleDetailModel.data!.pertemuan!.length - 1 == i
                      ? true
                      : false,
                  context,
                  vm)
          ],
        ),
      ),
    );
  }

  Column _buildListSection(String title, String value, [String value2 = '']) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              color: neutral80,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: neutral100,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (value2.isNotEmpty)
          Text(
            value2,
            style: TextStyle(
              color: neutral100,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }

  TableRow _buildSchedule(
      String pertemuan,
      String dayDate,
      String materi,
      String rangkuman,
      String beritaAcara,
      bool isTitle,
      bool isLastRow,
      BuildContext context) {
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
          child: Text(isTitle ? "No" : '${int.parse(pertemuan) + 1}',
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
            isTitle ? 'Judul Materi' : dayDate,
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
            isTitle ? 'Deskripsi' : materi,
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
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: isTitle
              ? Text(
                  isTitle ? 'File' : rangkuman,
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
                )
              : Column(
                  children: [
                    Image.asset(IconConstants.pdf, scale: 3),
                    SizedBox(height: 4),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          html.window.open(rangkuman, 'Tes');
                        },
                        child: Text(
                          'Lihat',
                          style: TextStyle(
                            color: Color(0xff1BB0DF),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: Text(
            isTitle ? 'Tanggal Update Materi' : beritaAcara,
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
      ],
    );
  }

  TableRow _buildScheduleTugas(
      String nomor,
      String judulTugas,
      String waktuMulai,
      String waktuSelesai,
      String fileTemplate,
      String fileUpload,
      String nilai,
      bool isTitle,
      bool isLastRow,
      BuildContext context,
      ScheduleViewModel vm) {
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
          child: Text(isTitle ? "No" : '${int.parse(nomor) + 1}',
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
            judulTugas,
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
            waktuMulai,
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
            waktuSelesai,
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
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: isTitle
              ? Text(
                  fileTemplate,
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
                )
              : Column(
                  children: [
                    Image.asset(IconConstants.doc, scale: 3),
                    SizedBox(height: 4),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          html.window.open(fileTemplate, 'Tes');
                        },
                        child: Text(
                          'Download Template',
                          style: TextStyle(
                            color: Color(0xff1BB0DF),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: isTitle
              ? Text(
                  fileUpload,
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
                )
              : Column(
                  children: [
                    vm.linkUpload.text.isNotEmpty
                        ? InkWell(
                            onTap: () => vm.deleteTask(),
                            child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Image.asset(IconConstants.doc_delete,
                                      scale: 3),
                                  Image.asset(IconConstants.delete, scale: 3)
                                ]),
                          )
                        : MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                // html.window.open(fileUpload, 'Tes');
                                showDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Material(
                                      type: MaterialType.transparency,
                                      child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: neutral20,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                  offset: Offset(0, 4)),
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  color: Color.fromRGBO(
                                                      96, 97, 112, 0.1),
                                                  offset: Offset(0, 0.5))
                                            ]),
                                        padding: EdgeInsets.all(16),
                                        margin: EdgeInsets.fromLTRB(
                                            200, 200, 200, 200),
                                        child: Column(
                                          children: [
                                            CustomTextField(
                                              label: 'Link Tugas',
                                              hintText:
                                                  'Masukkan Link tugas anda',
                                              textEditingController:
                                                  vm.linkUpload,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                vm.getUploadTask(vm
                                                    .scheduleDetailModel
                                                    .data!
                                                    .pertemuan![
                                                        int.parse(nomor)]
                                                    .id!);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    16, 8, 16, 8),
                                                decoration: BoxDecoration(
                                                    color: blue70,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: Text(
                                                  'Simpan',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Upload Tugas',
                                style: TextStyle(
                                  color: Color(0xff1BB0DF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
          child: Text(
            nilai,
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
      ],
    );
  }
}
