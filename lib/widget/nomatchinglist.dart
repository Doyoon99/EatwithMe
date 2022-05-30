import 'package:first/main.dart';
import 'package:first/screen/matching_total.dart';
import 'package:flutter/material.dart';

class NoMatchingList extends StatelessWidget {
  const NoMatchingList({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 200, 30, 10),
              child: Text(
                "현재 식당에 밥친구가 없습니다.",
                style: TextStyle(
                  height: 1.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "밥친구 만들러 가볼까요",
              style: TextStyle(
                height: 1.0,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MatchingTotal()),
                  );
                },
                child: Text('확인'),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text('취소'),
              )
            ])
          ],
        ));
  }
}
