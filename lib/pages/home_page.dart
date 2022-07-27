
import 'package:eat_with_me/screen/recommend_register.dart';
import 'package:eat_with_me/screen/time_listview.dart';
import 'package:eat_with_me/screen/total_make_matching.dart';
import 'package:flutter/material.dart';

import '../widget/googlemap_page.dart';
import '../screen/home_screen.dart';

import '../widget/bottom_home.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              Container(),
              TimeList(),
              TotalMakeMatching(),
            ],
          ),
          bottomNavigationBar: Bottom_home()),
    );
  }
}
