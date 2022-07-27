import 'dart:io';
import 'dart:ffi';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../model/input_data.dart';



class FirstStep extends StatefulWidget {
  final TextEditingController storenameController;

  FirstStep(this.storenameController);

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
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

  @override
  Widget build(BuildContext context) {
    final inputData = Provider.of<InputData>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Autocomplete(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            } else {
              return autoCompleteData.where((word) => word
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()));
            }
          },
          optionsViewBuilder:
              (context, Function(String) onSelected, options) {
            return Material(
              elevation: 4,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return ListTile(
                    //title: Text(option.toString()),
                    title: SubstringHighlight(
                      text: option.toString(),
                      term: widget.storenameController.text,
                      textStyleHighlight:
                      TextStyle(fontWeight: FontWeight.w700),
                    ),
                    onTap: () {
                      onSelected(option.toString());
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: options.length,
              ),
            );
          },
          onSelected: (selectedString) {
            print(selectedString);
          },
          fieldViewBuilder: (context, controller, focusNode,
              onEdittingComplete) {
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onEdittingComplete,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                  BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                  BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                  BorderSide(color: Colors.grey[300]!),
                ),
                hintText: "Search Something",
                prefixIcon: Icon(Icons.search),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty){
                  return '식당이름을 입력해주세요';
                }
                return null;
              },
              onSaved: (val){
                inputData.store_name = val!;
              },
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            '식당추천리스트',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            '1순위: 피자보이시나 숙대입구점',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.normal),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            '2순위: 포36거리',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.normal),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            '3순위: 라리에또 숙대점',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.normal),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
