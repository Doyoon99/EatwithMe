import 'package:first/components/custom_text_form_field.dart';
import 'package:first/widget/size.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField("학번"),
          SizedBox(height: medium_gap),
          CustomTextFormField("이름"),
          SizedBox(height: large_gap),
          CustomTextFormField("패스워드"),
          SizedBox(height: large_gap),
          CustomTextFormField("학교"),
          SizedBox(height: large_gap),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/login");
              }
            },
            child: Text("등록"),
          ),
        ],
      ),
    );
  }
}
