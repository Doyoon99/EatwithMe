import 'package:first/screen/home_screen.dart';
import 'package:first/screen/matching_total.dart';
import 'package:first/screen/real_time_list.dart';
import 'package:first/widget/bottom_home.dart';
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              Homescreen(),
              RealTimeList(),
              MatchingTotal(),
            ],
          ),
          bottomNavigationBar: Bottom_home()),
    );
  }
}
