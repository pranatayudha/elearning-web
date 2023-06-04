// ignore_for_file: dead_code

import 'package:elearning_fe/pages/classSchedule/meeting_detail_view.dart';
import 'package:elearning_fe/pages/classSchedule/schedule_detail_view.dart';
import 'package:elearning_fe/pages/classSchedule/schedule_view.dart';
import 'package:elearning_fe/pages/dashboard/dashboard.dart';
import 'package:elearning_fe/pages/exam/exam.dart';
import 'package:elearning_fe/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'infrastructure/database/preft_util.dart';
import 'pages/login/login_view.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  PrefUtil.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.blueAccent),
        canvasColor: Colors.blueGrey,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/schedule', page: () => ScheduleClass()),
        GetPage(name: '/exam', page: () => Exam()),
        // '/profile': (context) => const Profile(),
        GetPage(name: '/profile', page: () => Profile()),
        GetPage(name: '/detailClass', page: () => ScheduleDetail()),
        GetPage(name: '/meetingDetail', page: () => MeetingDetail()),
        GetPage(name: '/login', page: () => Login())
        // '/schedule/detailClass': (context) => const ScheduleDetail(),
        // '/login': (context) => const Login(),
      ],
      home: Dashboard(),
    );
  }
}

// Route<dynamic> generateRoute(RouteSettings settings) {
//   var uri = Uri.parse(settings.name!);
//   print(uri.path);
//   switch (uri.path) {
//     case '/schedule':
//       return MaterialPageRoute(builder: (_) => ScheduleClass());
//       break;
//     case 'profile':
//       return MaterialPageRoute(builder: (_) => Profile());
//     case 'exam':
//       return MaterialPageRoute(builder: (_) => Exam());
//     case 'detailClass':
//       return MaterialPageRoute(
//           builder: (_) => ScheduleDetail(id: uri.queryParameters["kelas"]));
//       break;
//     default:
//       return MaterialPageRoute(builder: (_) => Dashboard());
//   }
// }
