import 'package:flutter/material.dart';

class Bottom_home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person_search,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.add_reaction_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
