
import 'dart:convert';

import 'package:eat_with_me/screen/recommend_register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ApplicationListview extends StatefulWidget {
  const ApplicationListview({Key? key}) : super(key: key);

  @override
  State<ApplicationListview> createState() => _ApplicationListviewState();
}

class _ApplicationListviewState extends State<ApplicationListview> {
  final url = "http://3.35.250.231:8080/api/matching?promiseId=2";

  var _postJson =[];

  void fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      setState(() {
        _postJson = jsonData;
      });

    }catch(err){
    }
  }
  @override
  void initState(){
    super.initState();
    fetchPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('마이페이지'),
      ),
      body: ListView.builder(
        itemCount: _postJson.length,
        itemBuilder: (context, dynamic index) {
          final post=_postJson[index];
          return Card(
              elevation: 10,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.article_outlined,
                                  color: Colors.grey, size: 16),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text("${post["title"]}"),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.calendar_today,
                                  color: Colors.grey, size: 16),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text("${post["date"]}"),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.access_time_outlined,
                                  color: Colors.grey, size: 16),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text("${post["start"]}"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text("~ ${post["end"]}"),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.add_location_outlined,
                                  color: Colors.grey, size: 16),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text("${post["storeName"]}"),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.account_circle_sharp,
                                  color: Colors.grey, size: 16),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text("${post["min"]}"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text("~ ${post["max"]}"),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: Text('상세 정보 확인'),
                                style: TextButton.styleFrom(
                                  primary: Colors.blueAccent, // Text Color
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('상세정보'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              color: Colors.grey[100],
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 20.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text("제목: ${post["title"]}"),
                                                  Text("세부사항: ${post["detail"]}"),
                                                  Text("식당이름: ${post["storeName"]}"),
                                                  Text("날짜: ${post["date"]}"),
                                                  Text("시간: ${post["start"]}~${post["end"]}"),
                                                  Text("인원: ${post["min"]}~${post["max"]}"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent, // Background color
                                    onPrimary: Colors.white, // Text Color (Foreground color)
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible:
                                      false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('확인창'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              //List Body를 기준으로 Text 설정
                                              children: <Widget>[
                                                Text('취소하시겠습니까?'),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text('확인'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text('취소'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text("취소")),

                            ]),

                      ),

                    ]),
              ));
        },
      ),

      floatingActionButton :
        FloatingActionButton.extended(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecommendRegister()),);
            },
            label: Text('취향 분석 등록'),
          icon: Icon(Icons.add_task),
          backgroundColor: Colors.blue[900],
          elevation: 0,
        ),
    );
  }
}
