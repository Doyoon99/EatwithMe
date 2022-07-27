import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application_listview.dart';


/// This is the stateful widget that the main application instantiates.
class RecommendRegister extends StatefulWidget {
  const RecommendRegister({Key? key}) : super(key: key);

  @override
  State<RecommendRegister> createState() => _RecommendRegisterState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RecommendRegisterState extends State<RecommendRegister> {
  String randomStore1 = '식당 검색 버튼 클릭';
  String randomStore2 = '식당 검색 버튼 클릭';
  String randomStore3 = '식당 검색 버튼 클릭';
  String randomStore4 = '식당 검색 버튼 클릭';
  String randomStore5 = '식당 검색 버튼 클릭';

  late List<String> autoCompleteData;
  bool isLoading = false;
  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });
    final String stringData =
    await rootBundle.loadString("lib/model/data.json");
    final List<dynamic> json = jsonDecode(stringData);
    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {//set the initial value of text field
    super.initState();
    fetchAutoCompleteData();
  }

//처음에는 사과가 선택되어 있도록 Apple로 초기화 -> groupValue에 들어갈 값!
  String radioButtonItem1 = '1';
  String radioButtonItem2 = '1';
  String radioButtonItem3 = '1';
  String radioButtonItem4 = '1';
  String radioButtonItem5 = '1';
  // Group Value for Radio Button.
  int id1 = 1;
  int id2 = 1;
  int id3 = 1;
  int id4 = 1;
  int id5 = 1;

  var random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('취향 분석 등록'),
      ),
      body: Column(
    children: <Widget>[
    Padding(
    padding: EdgeInsets.all(14.0),
    child: Text('1. $randomStore1',
    style: TextStyle(fontSize: 21))
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Radio(
    value: 1,
    groupValue: id1,
    onChanged: (val) {
    setState(() {
    radioButtonItem1 = '1';
    id1 = 1;
    });
    },
    ),
    Text(
    '1',
    style: new TextStyle(fontSize: 17.0),
    ),

    Radio(
    value: 2,
    groupValue: id1,
    onChanged: (val) {
    setState(() {
    radioButtonItem1 = '2';
    id1 = 2;
    });
    },
    ),
    Text(
    '2',
    style: new TextStyle(
    fontSize: 17.0,
    ),
    ),
      Radio(
        value: 3,
        groupValue: id1,
        onChanged: (val) {
          setState(() {
            radioButtonItem1 = '3';
            id1 = 3;
          });
        },
      ),
      Text(
        '3',
        style: new TextStyle(
          fontSize: 17.0,
        ),
      ),
      Radio(
        value: 4,
        groupValue: id1,
        onChanged: (val) {
          setState(() {
            radioButtonItem1 = '4';
            id1 = 4;
          });
        },
      ),
      Text(
        '4',
        style: new TextStyle(
          fontSize: 17.0,
        ),
      ),

    Radio(
    value: 5,
    groupValue: id1,
    onChanged: (val) {
    setState(() {
    radioButtonItem1 = '5';
    id1 = 5;
    });
    },
    ),
    Text(
    '5',
    style: new TextStyle(fontSize: 17.0),
    ),
    ],
    ),
      Padding(
          padding: EdgeInsets.all(14.0),
          child: Text('2. $randomStore2',
              style: TextStyle(fontSize: 21))
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: id2,
            onChanged: (val) {
              setState(() {
                radioButtonItem2 = '1';
                id2 = 1;
              });
            },
          ),
          Text(
            '1',
            style: new TextStyle(fontSize: 17.0),
          ),

          Radio(
            value: 2,
            groupValue: id2,
            onChanged: (val) {
              setState(() {
                radioButtonItem2 = '2';
                id2 = 2;
              });
            },
          ),
          Text(
            '2',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Radio(
            value: 3,
            groupValue: id2,
            onChanged: (val) {
              setState(() {
                radioButtonItem2 = '3';
                id2 = 3;
              });
            },
          ),
          Text(
            '3',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Radio(
            value: 4,
            groupValue: id2,
            onChanged: (val) {
              setState(() {
                radioButtonItem2 = '4';
                id2 = 4;
              });
            },
          ),
          Text(
            '4',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),

          Radio(
            value: 5,
            groupValue: id2,
            onChanged: (val) {
              setState(() {
                radioButtonItem2 = '5';
                id2 = 5;
              });
            },
          ),
          Text(
            '5',
            style: new TextStyle(fontSize: 17.0),
          ),
        ],
      ),
      Padding(
          padding: EdgeInsets.all(14.0),
          child: Text('3. $randomStore3',
              style: TextStyle(fontSize: 21))
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: id3,
            onChanged: (val) {
              setState(() {
                radioButtonItem3 = '1';
                id3 = 1;
              });
            },
          ),
          Text(
            '1',
            style: new TextStyle(fontSize: 17.0),
          ),

          Radio(
            value: 2,
            groupValue: id3,
            onChanged: (val) {
              setState(() {
                radioButtonItem3 = '2';
                id3 = 2;
              });
            },
          ),
          Text(
            '2',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Radio(
            value: 3,
            groupValue: id3,
            onChanged: (val) {
              setState(() {
                radioButtonItem3 = '3';
                id3 = 3;
              });
            },
          ),
          Text(
            '3',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Radio(
            value: 4,
            groupValue: id3,
            onChanged: (val) {
              setState(() {
                radioButtonItem3 = '4';
                id3 = 4;
              });
            },
          ),
          Text(
            '4',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),

          Radio(
            value: 5,
            groupValue: id3,
            onChanged: (val) {
              setState(() {
                radioButtonItem3 = '5';
                id3 = 5;
              });
            },
          ),
          Text(
            '5',
            style: new TextStyle(fontSize: 17.0),
          ),
        ],
      ),
      Padding(
          padding: EdgeInsets.all(14.0),
          child: Text('4. $randomStore4',
              style: TextStyle(fontSize: 21))
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: id4,
            onChanged: (val) {
              setState(() {
                radioButtonItem4 = '1';
                id4 = 1;
              });
            },
          ),
          Text(
            '1',
            style: new TextStyle(fontSize: 17.0),
          ),

          Radio(
            value: 2,
            groupValue: id4,
            onChanged: (val) {
              setState(() {
                radioButtonItem4 = '2';
                id4 = 2;
              });
            },
          ),
          Text(
            '2',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Radio(
            value: 3,
            groupValue: id4,
            onChanged: (val) {
              setState(() {
                radioButtonItem4 = '3';
                id4 = 3;
              });
            },
          ),
          Text(
            '3',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Radio(
            value: 4,
            groupValue: id4,
            onChanged: (val) {
              setState(() {
                radioButtonItem4 = '4';
                id4 = 4;
              });
            },
          ),
          Text(
            '4',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),

          Radio(
            value: 5,
            groupValue: id4,
            onChanged: (val) {
              setState(() {
                radioButtonItem4 = '5';
                id4 = 5;
              });
            },
          ),
          Text(
            '5',
            style: new TextStyle(fontSize: 17.0),
          ),
        ],
      ),
      Padding(
          padding: EdgeInsets.all(14.0),
          child: Text('5. $randomStore5',
              style: TextStyle(fontSize: 21))
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: id5,
            onChanged: (val) {
              setState(() {
                radioButtonItem5 = '1';
                id5 = 1;
              });
            },
          ),
          Text(
            '1',
            style: new TextStyle(fontSize: 17.0),
          ),

          Radio(
            value: 2,
            groupValue: id5,
            onChanged: (val) {
              setState(() {
                radioButtonItem5 = '2';
                id5 = 2;
              });
            },
          ),
          Text(
            '2',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Radio(
            value: 3,
            groupValue: id5,
            onChanged: (val) {
              setState(() {
                radioButtonItem5 = '3';
                id5 = 3;
              });
            },
          ),
          Text(
            '3',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          Radio(
            value: 4,
            groupValue: id5,
            onChanged: (val) {
              setState(() {
                radioButtonItem5 = '4';
                id5 = 4;
              });
            },
          ),
          Text(
            '4',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),

          Radio(
            value: 5,
            groupValue: id5,
            onChanged: (val) {
              setState(() {
                radioButtonItem5 = '5';
                id5 = 5;
              });
            },
          ),
          Text(
            '5',
            style: new TextStyle(fontSize: 17.0),
          ),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    ElevatedButton(onPressed: (){setState(() {
    randomStore1 = autoCompleteData[random.nextInt(autoCompleteData.length)];
    randomStore2 = autoCompleteData[random.nextInt(autoCompleteData.length)];
    randomStore3 = autoCompleteData[random.nextInt(autoCompleteData.length)];
    randomStore4 = autoCompleteData[random.nextInt(autoCompleteData.length)];
    randomStore5 = autoCompleteData[random.nextInt(autoCompleteData.length)];
    });
    }, child: Text('식당 검색')),
      Padding(
          padding: EdgeInsets.all(14.0),
        ),
    ElevatedButton(onPressed: (){Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ApplicationListview()),);}, child: Text('확인')
    ),
    ]

    )

    ],

      ),
    );
    }
}