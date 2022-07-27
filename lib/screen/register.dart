import 'dart:convert';
import 'package:eat_with_me/model/register_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class Register extends StatefulWidget {
  Register({Key ? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  RegisterUser registeruser = RegisterUser("", "","","");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 740,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff0D47A1),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 5))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Register",
                            style: GoogleFonts.pacifico(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Student ID",
                            style: GoogleFonts.roboto(
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: registeruser.user_id),
                          onChanged: (val) {
                            registeruser.user_id = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Student ID is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 5,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Name",
                            style: GoogleFonts.roboto(
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: registeruser.user_name),
                          onChanged: (val) {
                            registeruser.user_name = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'name is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 5,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: GoogleFonts.roboto(
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller:
                          TextEditingController(text: registeruser.user_pw),
                          onChanged: (val) {
                            registeruser.user_pw = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 5,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "School",
                            style: GoogleFonts.roboto(
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        DropdownButton(
                          dropdownColor: Colors.indigo,
                          isExpanded: true,
                            elevation: 12 , itemHeight: kMinInteractiveDimension +10,
                                underline: Container(
                                  height: 2.0,
                                  color: Colors.grey[400],
                                ),
                        items: ['숙명여자대학교']
                            .map<DropdownMenuItem<String>>(
                                (value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding:EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.white,fontSize: 18.0),
                                    ),
                                  ),
                                ),
                        )
                         .toList(),
                         value: '숙명여자대학교',
                         onChanged: (value) => setState(() {
                         }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "register",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Already have Account",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 90,
                  width: 90,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),// foreground
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            )),
      ),
    );
  }
}