import 'package:first/pages/home_page.dart';
import 'package:first/pages/login_page.dart';
import 'package:first/pages/register_page.dart';
import 'package:first/screen/group_listview_page.dart';
import 'package:first/screen/home_screen.dart';
import 'package:first/screen/matching_total.dart';
import 'package:first/screen/real_time_list.dart';
import 'package:first/widget/goolgemap.dart';
import 'package:first/widget/nomatchinglist.dart';
import 'package:first/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:first/widget/bottom_home.dart';
import 'package:get/get.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print(FlutterConfig.get('apiKey'));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/home": (context) => HomePages(),
      },
    );
  }
}
