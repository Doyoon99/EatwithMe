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
import 'package:get/get.dart';


class SecondStep extends StatefulWidget {
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;

  SecondStep(this.dateController, this.startTimeController, this.endTimeController);



  @override
  State<SecondStep> createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  final List<String> _valueList = ['2', '3', '4'];


  final List<String> _valueListMax = ['2', '3', '4'];




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputData = Provider.of<InputData>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
              final startdate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
              );
              if (startdate != null) {
                inputData.promise_date = DateFormat('yyyy-MM-dd').format(startdate);
                widget.dateController.text=inputData.promise_date;
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: widget.dateController,//editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "날짜" //label text of field
                ),
                validator: (val){
                  if (val == null || val.isEmpty){
                    return '날짜를 선택해주세요';
                  }
                  return null;
                },


              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
              TimeOfDay? startT = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );
              if ( startT != null) {
                DateTime parsedTime = DateFormat.jm()
                    .parse(startT.format(context).toString());
                inputData.starttime =  DateFormat('HH:mm').format(parsedTime);
                widget.startTimeController.text=inputData.starttime;
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: widget.startTimeController,
                decoration: InputDecoration(
                    icon: Icon(Icons.timer), //icon of text field
                    labelText: "시작 시간" //label text of field
                ),
                validator: (val){
                  if (val == null || val.isEmpty){
                    return '시작 시간을 지정해주세요';
                  }
                  return null;
                },

              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
              TimeOfDay? endT = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );
              if ( endT != null) {
                DateTime parsedTime = DateFormat.jm()
                    .parse(endT.format(context).toString());
                inputData.endtime =  DateFormat('HH:mm').format(parsedTime);
                widget.endTimeController.text=inputData.endtime;
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: widget.endTimeController, //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.timer), //icon of text field
                    labelText: "끝나는 시간" //label text of field
                ),
                validator: (val){
                  if (val == null || val.isEmpty){
                    return '끝나는 시간을 선택해주세요';
                  }
                  return null;
                },

              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                icon: Icon(Icons.account_box_rounded), labelText: '최소인원'),
            value: inputData.minpers,
            items: _valueList.map(
                  (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                inputData.minpers = value!;
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                icon: Icon(Icons.account_box_rounded), labelText: '최대인원'),
            value: inputData.maxpers,
            items: _valueListMax.map(
                  (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                inputData.maxpers = value!;
              });
            },
          ),
        ]
    );
  }
}
