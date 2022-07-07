import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'application_listview.dart';


/// This is the stateful widget that the main application instantiates.
class RecommendRegister extends StatefulWidget {
  const RecommendRegister({Key? key}) : super(key: key);

  @override
  State<RecommendRegister> createState() => _RecommendRegisterState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RecommendRegisterState extends State<RecommendRegister> {
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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    MaterialPageRoute(builder: (context) => GroupListviewPage()),);
              }, icon: Icon(Icons.perm_identity_outlined)),
        ],
      ),
      body: Column(
    children: <Widget>[
    Padding(
    padding: EdgeInsets.all(14.0),
    child: Text('추천식당',
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
          child: Text('추천식당1',
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
          child: Text('추천식당3',
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
          child: Text('추천식당4',
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
          child: Text('추천식당5',
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
      ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('확인'))
    ],

      ),
    );
    }
}