
import 'package:eat_with_me/screen/login.dart';
import 'package:eat_with_me/screen/register.dart';
import 'package:eat_with_me/widget/input_data.dart';
import 'package:eat_with_me/widget/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'pages/home_page.dart';


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
    return ChangeNotifierProvider(
      create: (_) => InputData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: "/login",
        routes: {
          "/login": (context) => Login(),
          "/register": (context) => Register(),
          "/home": (context) => HomePages(),
        },
      ),
    );
  }
}
