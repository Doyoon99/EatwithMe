import 'dart:io';
import 'dart:ffi';


import 'package:eat_with_me/model/input_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:substring_highlight/substring_highlight.dart';

class ThirdStep extends StatelessWidget {
  final Function()? submit;
  TextEditingController detail = TextEditingController();
  TextEditingController title = TextEditingController();
  ThirdStep({this.submit});

  @override
  Widget build(BuildContext context) {
    final inputData = Provider.of<InputData>(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: title,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.border_color_outlined),
              labelText: '제목',
            ),
            validator: (val){
              if (val == null || val.isEmpty){
                return '제목을 입력해주세요';
              }
              return null;
            },
            onSaved: (val){
              inputData.title =val!;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: detail,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.article_outlined),
              labelText: '세부사항',
            ),
            validator: (val){
              if (val == null || val.isEmpty){
                return '세부사항을 입력해주세요';
              }
              return null;
            },
            onSaved: (val){
              inputData.detail =val!;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          MaterialButton(
              padding: EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 12.0,
              ),
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text(
                '매칭만들기',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: submit)
        ]
    );
  }
}
