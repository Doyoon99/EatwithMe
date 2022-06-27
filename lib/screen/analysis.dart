import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Test Radio Button';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: RadioButtonWidget(),
        ),
      ),
    );
  }
}

enum Fruit { Apple, Grapes, Pear, Lemon }

/// This is the stateful widget that the main application instantiates.
class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonWidgetState extends State<RadioButtonWidget> {
//처음에는 사과가 선택되어 있도록 Apple로 초기화 -> groupValue에 들어갈 값!
  Fruit? _fruit = Fruit.Apple;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          //ListTile - title에는 내용,
          //leading or trailing에 체크박스나 더보기와 같은 아이콘을 넣는다.
          title: const Text('Apple'),
          leading: Radio<Fruit>(
            value: Fruit.Apple,
            groupValue: _fruit,
            onChanged: (Fruit? value) {
              setState(() {
                _fruit = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Grapes'),
          leading: Radio<Fruit>(
            value: Fruit.Grapes,
            groupValue: _fruit,
            onChanged: (Fruit? value) {
              setState(() {
                _fruit = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Pear'),
          leading: Radio<Fruit>(
            value: Fruit.Pear,
            groupValue: _fruit,
            onChanged: (Fruit? value) {
              setState(() {
                _fruit = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Lemon'),
          leading: Radio<Fruit>(
            value: Fruit.Lemon,
            groupValue: _fruit,
            onChanged: (Fruit? value) {
              setState(() {
                _fruit = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
