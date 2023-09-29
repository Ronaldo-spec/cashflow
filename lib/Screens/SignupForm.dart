// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mobile/Comm/genTextFormField.dart';
import 'package:mobile/Screens/LoginForm.dart';

class SignupForm extends StatefulWidget {
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController conUsername = TextEditingController();
  TextEditingController conPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with Sign Up'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.0),
                Image.asset(
                  "assets/images/logo.png",
                  height: 230.0,
                  width: 230.0,
                ),
                SizedBox(height: 0.0),
                Text(
                  'My CashBook',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30.0),
                ),
                getTextFromField(
                    controller: conUsername,
                    icon: Icons.person,
                    inputType: TextInputType.name,
                    hintName: 'Username'),
                getTextFromField(
                  controller: conPassword,
                  icon: Icons.lock,
                  inputType: TextInputType.visiblePassword,
                  hintName: 'Password',
                  isObscureText: true,
                ),
                getTextFromField(
                  controller: conPassword,
                  icon: Icons.lock,
                  inputType: TextInputType.visiblePassword,
                  hintName: 'Confirm Password',
                  isObscureText: true,
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 30.0),
                //   margin: EdgeInsets.only(top: 10.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30.00)),
                //         borderSide: BorderSide(color: Colors.blue),
                //       ),
                //       prefixIcon: Icon(Icons.person),
                //       hintText: 'Username',
                //       fillColor: Colors.grey[350],
                //       filled: true,
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 30.0),
                //   margin: EdgeInsets.only(top: 5.0),
                //   child: TextFormField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30.00)),
                //         borderSide: BorderSide(color: Colors.blue),
                //       ),
                //       prefixIcon: Icon(Icons.lock),
                //       hintText: 'Password',
                //       fillColor: Colors.grey[350],
                //       filled: true,
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 30.0),
                //   margin: EdgeInsets.only(top: 5.0),
                //   child: TextFormField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30.00)),
                //         borderSide: BorderSide(color: Colors.blue),
                //       ),
                //       prefixIcon: Icon(Icons.lock),
                //       hintText: 'Confirm Password',
                //       fillColor: Colors.grey[350],
                //       filled: true,
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: 150.0,
                  height: 30.0,
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                Center(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Does You Have Account? '),
                        TextButton(
                          child: Text('Sign In'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                                (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
