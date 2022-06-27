import 'package:first/screen/completed.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _dataDummy = [
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

class GroupListviewPage extends StatefulWidget {
  const GroupListviewPage({Key? key}) : super(key: key);

  @override
  State<GroupListviewPage> createState() => _GroupListviewPageState();
}

class _GroupListviewPageState extends State<GroupListviewPage> {
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
                ),
              ],
            )),
            TextButton(
              child: Text('내 취향 분석하러 가기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
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
