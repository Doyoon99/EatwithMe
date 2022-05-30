import 'dart:io';

import 'package:first/main.dart';
import 'package:first/screen/home_screen.dart';
import 'package:first/widget/bottom_home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:convert';
import 'dart:ffi';
import 'package:first/screen/group_listview_page.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:get/get.dart';

class MatchingTotal extends StatefulWidget {
  const MatchingTotal({Key? key}) : super(key: key);

  @override
  State<MatchingTotal> createState() => _MatchingTotalState();
}

class _MatchingTotalState extends State<MatchingTotal> {
  final List<String> _valueList = ['2', '3', '4'];
  var _selectedValue = '2';

  final List<String> _valueListMax = ['2', '3', '4'];
  var _selectedValueMax = '2';
  bool isLoading = false;

  late List<String> autoCompleteData;

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

  TextEditingController controller = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController endtimeinput = TextEditingController();
  TextEditingController inputDetail = TextEditingController();
  TextEditingController inputTitle = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    endtimeinput.text = ""; //set the initial value of text field
    super.initState();
    fetchAutoCompleteData();
  }

  int _activeStepIndex = 0;

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Step1'),
          content: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
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
                                    term: controller.text,
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
                          this.controller = controller;

                          return TextField(
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
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Step2'),
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "날짜" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: timeinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.timer), //icon of text field
                      labelText: "시작 시간" //label text of field
                      ),

                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      print(pickedTime.format(context)); //output 10:51 PM
                      DateTime parsedTime = DateFormat.jm()
                          .parse(pickedTime.format(context).toString());
                      //converting to DateTime so that we can further format on different pattern.
                      print(parsedTime); //output 1970-01-01 22:53:00.000
                      String formattedTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      print(formattedTime); //output 14:59:00
                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        timeinput.text =
                            formattedTime; //set the value of text field.
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller:
                      endtimeinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.timer), //icon of text field
                      labelText: "끝나는 시간" //label text of field
                      ),

                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      print(pickedTime.format(context)); //output 10:51 PM
                      DateTime parsedTime = DateFormat.jm()
                          .parse(pickedTime.format(context).toString());
                      //converting to DateTime so that we can further format on different pattern.
                      print(parsedTime); //output 1970-01-01 22:53:00.000
                      String formattedTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      print(formattedTime); //output 14:59:00
                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        endtimeinput.text =
                            formattedTime; //set the value of text field.
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_box_rounded), labelText: '최소인원'),
                  value: _selectedValue,
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
                      _selectedValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_box_rounded), labelText: '최대인원'),
                  value: _selectedValueMax,
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
                      _selectedValueMax = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Step3'),
            content: Container(
              child: Column(children: [
                TextField(
                  controller: inputTitle,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.border_color_outlined),
                    labelText: '제목',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: inputDetail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.article_outlined),
                    labelText: '세부사항',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ]),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 3,
            title: const Text('Confirm'),
            content: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('식당: ${controller.text}'),
                Text('약속날짜: ${dateinput.text}'),
                Text('약속 시간: ${timeinput.text} ~ ${endtimeinput.text}'),
                Text('인원: ${_selectedValue} ~ ${_selectedValueMax}'),
              ],
            )))
      ];

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
        body: Stepper(
          type: StepperType.horizontal,
          currentStep: _activeStepIndex,
          steps: stepList(),
          onStepContinue: () {
            if (_activeStepIndex < (stepList().length - 1)) {
              _activeStepIndex += 1;
            } else {
              _activeStepIndex -= 3;
            }
            setState(() {});
          },
          onStepCancel: () {
            if (_activeStepIndex == 0) {
              return;
            }
            _activeStepIndex -= 1;
            setState(() {});
          },
        ));
  }
}
