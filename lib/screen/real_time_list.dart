import 'package:first/screen/completed.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _dataDummy = [
  {
    "type": "대기 중 약속",
    "place": "와우 신내떡 숙명여대점",
    "title": "신내떡 런치 세트 같이 먹으실 분 구합니다!",
    "name": "신내떡 먹고 싶다(20)",
    "date": "2022.05.10",
    "time": "14:00",
    "endtime": "16:00"
  },
  {
    "type": "대기 중 약속",
    "place": "코피티암 숙대점",
    "title": "코피티암에서 공부할 새내기 구합니다",
    "name": "신입생(21)",
    "date": "2022.05.19",
    "time": "13:00",
    "endtime": "14:00"
  },
  {
    "type": "대기 중 약속",
    "place": "피자보이시나",
    "title": "피자보이시나 포장 나누실 분 있으신가요?",
    "name": "청파동 자취생(21)",
    "date": "2022.05.20",
    "time": "16:00",
    "endtime": "18:00"
  },
  {
    "type": "대기 중 약속",
    "place": "포 36거리 숙대점",
    "title": "포돈 먹으러 갈 사람 여기 모여라",
    "name": "피자보이시나(21)",
    "date": "2022.05.21",
    "time": "17:00",
    "endtime": "20:00"
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
              onPressed: () {}, icon: Icon(Icons.perm_identity_outlined)),
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
                              Icon(Icons.account_circle_sharp,
                                  color: Colors.grey, size: 16),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('${element['name']}'),
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
                                child: Text('${element['date']}'),
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
                                child: Text('${element['time']}'),
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
                                child: Text('${element['place']}'),
                              ),
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
