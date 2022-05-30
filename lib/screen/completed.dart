import 'package:first/main.dart';
import 'package:first/screen/home_screen.dart';
import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
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
                onPressed: () {}, icon: Icon(Icons.perm_identity_outlined)),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: 400,
              height: 430,
              padding: EdgeInsets.all(30),

              // 마진 속성
              margin: EdgeInsets.all(30),

              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                "식당 피자보이시나",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text('완료'),
            ),
          ],
        ));
  }
}
