import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  final bool selected;
  final String step;
  final void Function()? onPressed;

  StepButton({
    required this.selected,
    required this.step,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: selected ? Colors.teal : Colors.white,
        minWidth: 50.0,
        elevation: 10.0,
        onPressed: onPressed,
      child: Text(
        step,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: selected ? Colors.white : Colors.indigo,
        ),
      ),
    );
  }
}
