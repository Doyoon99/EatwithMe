

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'application_listview.dart';


class FindListviewPage extends StatefulWidget {
  const FindListviewPage({Key? key}) : super(key: key);

  @override
  State<FindListviewPage> createState() => _FindListviewPageState();
}

class _FindListviewPageState extends State<FindListviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('식당별 매칭 목록'),
      ),

      body: ListView.builder(
        itemBuilder: (context, dynamic index) {
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
                                child: Text('안녕'),
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
                                child: Text('그래'),
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
                                child: Text('ㅇ러'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('~ ㅇ'),
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
                                child: Text('ㅇㄹㅇㄴ'),
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
                                child: Text('ㅇㄹㄴ'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('~ ㅇㄹㄴㄷㅊ'),
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
                                                  Text('제목: 4'),
                                                  Text('세부 사항: 4'),
                                                  Text('식당 이름: 1'),
                                                  Text('날짜: 2'),
                                                  Text('시간: 3'),
                                                  Text('인원: 4'),
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
                                                Text('신청하시겠습니까?'),
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
                                  child: Text("신청")),

                            ]),

                      ),

                    ]),
              ));
        },
      ),
    );
  }
}
