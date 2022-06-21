import 'package:first/components/custom_form.dart';
import 'package:first/components/logo.dart';
import 'package:first/components/register_form.dart';
import 'package:first/widget/size.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("회원가입"),
            SizedBox(height: large_gap),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
