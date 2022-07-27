
import 'package:flutter/material.dart';

import '../widget/googlemap_page.dart';
import 'application_listview.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            print("click");
          },
          child: PopupMenuButton<String>(
            offset: Offset(0, 30),
            shape: ShapeBorder.lerp(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                1),
            onSelected: (String where) {
              print(where);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "sookmyung", child: Text("숙명여대")),
                PopupMenuItem(value: "ewha", child: Text("이화여대")),
              ];
            },
            child: Row(
              children: [Text("숙명여대"), Icon(Icons.arrow_drop_down)],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ApplicationListview()),
                );
              },
              icon: Icon(Icons.perm_identity_outlined)),
        ],
      ),
      body: TestGoogleMap(),
    );
  }
}
