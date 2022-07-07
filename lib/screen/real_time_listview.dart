
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'application_listview.dart';

List _dataDummy = [
  {
    "type": "대기중 약속",
    "store_name": "와우신내떡",
    "title": "신내떡 런치 세트 같이 먹으실 분 구합니다!",
    "detail": "신내떡 먹고 싶다(20)",
    "promise_date": "2022.06.30",
    "starttime": "14:00",
    "endtime": "16:00",
    "minpers": "2",
    "maxpers": "3",
  },
  {
    "type": "대기중 약속",
    "store_name": "코피티암 숙대점",
    "title": "코피티암에서 공부할 새내기 구합니다",
    "detail": "신입생(21)",
    "promise_date": "2022.06.29",
    "starttime": "13:00",
    "endtime": "14:00",
    "minpers": "2",
    "maxpers": "4",
  },
  {
    "type": "대기중 약속",
    "store_name": "피자보이시나",
    "title": "피자보이시나 포장 나누실 분 있으신가요?",
    "detail": "청파동 자취생(21)",
    "promise_date": "2022.06.30",
    "starttime": "16:00",
    "endtime": "18:00",
    "minpers": "3",
    "maxpers": "3",
  },
  {
    "type": "대기중 약속",
    "store_name": "포 36거리 숙대점",
    "title": "포돈 먹으러 갈 사람 여기 모여라",
    "detail": "포동이(21)",
    "promise_date": "2022.06.29",
    "starttime": "17:00",
    "endtime": "20:00",
    "minpers": "2",
    "maxpers": "3",
  },
  {
    "type": "신청완료약속",
    "store_name": "와우신내떡",
    "title": ".",
    "detail": ".",
    "promise_date": "2022.06.30",
    "starttime": "16:00",
    "endtime": "18:00",
    "minpers": "2",
    "maxpers": "3",
  }
];

class RealTimeList extends StatefulWidget {
  const RealTimeList({Key? key}) : super(key: key);

  @override
  State<RealTimeList> createState() => _RealTimeListState();
}

class _RealTimeListState extends State<RealTimeList> {
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroupListviewPage()),
                );
              }, icon: Icon(Icons.perm_identity_outlined)),
        ],
      ),
      body: GroupedListView<dynamic, String>(
        elements: _dataDummy,
        groupBy: (element) => element['type'],
        groupSeparatorBuilder: (String groupByValue) => Padding(
          padding: EdgeInsets.all(10),
          child: Row(children: [
            Flexible(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    groupByValue,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ))
          ]),
        ),

        itemBuilder: (context, dynamic element) {
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
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          element['title'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
                                child: Text('${element['detail']}'),
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
                                child: Text('${element['promise_date']}'),
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
                                child: Text('${element['starttime']}'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('~ ${element['endtime']}'),
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
                                child: Text('${element['store_name']}'),
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
                                child: Text('${element['minpers']}'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('~ ${element['maxpers']}'),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
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
        itemComparator: (item1, item2) =>
            item1['title'].compareTo(item2['title']), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.DESC, // optional
      ),
    );
  }
}
