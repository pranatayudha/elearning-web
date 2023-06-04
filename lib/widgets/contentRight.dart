// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:elearning_fe/constants/style.dart';
import 'package:elearning_fe/infrastructure/database/preft_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/iconConstants.dart';

class RightContent extends StatelessWidget {
  final String name;
  final String nip;
  final String? icon;
  final Widget child;
  const RightContent({
    Key? key,
    required this.child,
    required this.name,
    required this.nip,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 60, 80, 13),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      PrefUtil.getValue('fullName', 'Defaul').toString(),
                      style: TextStyle(
                        color: neutral100,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      nip,
                      style: TextStyle(
                        color: neutral70,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: blue70,
                  ),
                  alignment: Alignment.center,
                  width: 48,
                  height: 48,
                  child: Text(
                    icon![0],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(width: 22),
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: blue20,
                  ),
                  child: PopupMenuButton(
                    color: Colors.white,
                    onSelected: ((value) {}),
                    child: Image.asset(
                      IconConstants.chevronDown,
                      scale: 2,
                    ),
                    itemBuilder: (context) {
                      final list = <PopupMenuEntry<int>>[];
                      list.add(
                        PopupMenuItem(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/profile');
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(24, 12, 0, 12),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    IconConstants.profileIcon,
                                    scale: 2,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    "Profil Akun",
                                    style: TextStyle(
                                      color: neutral70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          value: 1,
                        ),
                      );
                      list.add(PopupMenuDivider(
                        height: 10,
                      ));
                      list.add(
                        PopupMenuItem(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.fromLTRB(24, 12, 0, 12),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    IconConstants.logoutIcon,
                                    scale: 2,
                                    color: red60,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    "Keluar",
                                    style: TextStyle(
                                      color: red60,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          value: 1,
                        ),
                      );
                      return list;
                    },
                  ),
                ),
                SizedBox(height: 13),
              ],
            ),
          ),
          child
        ],
      ),
    );
  }
}
