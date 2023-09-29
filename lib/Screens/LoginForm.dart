// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobile/Comm/genTextFormField.dart';
import 'package:mobile/Screens/SignupForm.dart';
import 'package:mobile/Screens/home.dart';
import 'package:mobile/database/dbhelper.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController conUsername = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var db = DBHelper();

  Future initDB() async {
    await db.setDB();
  }

  @override
  void initState() {
    super.initState();
    initDB();
  }

  login() async {
    // var res = await db.getLogin(
    //   usernameInput.text.toString(),
    //   passwordInput.text.toString(),
    // );
    String username = conUsername.text.toString();
    String password = conPassword.text.toString();

    var cek = await db.getLogin(username, password);

    print("Login Response: $cek");

    if (cek.isNotEmpty) {
      // Login successful, navigate to the home page.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Konfirmasi Login'),
              content: Text('Username atau Password Salah!'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      conUsername.text = '';
                      conPassword.text = '';
                      Navigator.of(context).pop();
                    },
                    child: Text('ok'))
              ],
            );
          });
    }
  }

  void _setLogin() {
    if (formkey.currentState!.validate()) {
      login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login with Sign Up'),
      ),
      body: Form(
        key: formkey,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0.0),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: conUsername,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.00)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      fillColor: Colors.grey[350],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kolom Username masih Kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  margin: EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: conPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.00)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      fillColor: Colors.grey[350],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kolom Password Masih Kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: _setLogin,
                    // String tuser = 'user';
                    // String tpass = 'user';
                    // if (formkey.currentState!.validate()) {
                    //   if (conUsername.text == tuser && conPassword == tpass) {
                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const home(),
                    //       ),
                    //     );
                    //   } else {
                    //     showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Konfirmasi Login'),
                    //             content:
                    //                 Text('Username atau Password Salah!'),
                    //             actions: [
                    //               ElevatedButton(
                    //                   onPressed: () {
                    //                     conUsername.text = '';
                    //                     conPassword.text = '';
                    //                     Navigator.of(context).pop();
                    //                   },
                    //                   child: Text('ok'))
                    //             ],
                    //           );
                    //         });
                    //   }
                    // }

                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
                // getTextFromField(
                //     controller: conUsername,
                //     icon: Icons.person,
                //     inputType: TextInputType.name,
                //     hintName: 'Username'
                //     ),
                // SizedBox(height: 5.0),
                // getTextFromField(
                //   controller: conPassword,
                //   icon: Icons.lock,
                //   inputType: TextInputType.visiblePassword,
                //   hintName: 'Password',
                //   isObscureText: true,
                // ),
                // Container(
                //   margin: EdgeInsets.all(5.0),
                //   width: 150.0,
                //   height: 30.0,
                //   child: FloatingActionButton(
                //     backgroundColor: Colors.blue,
                //     child: Text(
                //       'Login',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold, color: Colors.black),
                //     ),
                //     onPressed: () {
                //       if (formkey.currentState!.validate()) {}
                //     },
                //   ),
                //   decoration: BoxDecoration(
                //       color: Colors.blue,
                //       borderRadius: BorderRadius.circular(30.0)),
                // ),
                Center(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Does Not Have Account? '),
                        TextButton(
                          child: Text('Sign Up'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignupForm()));
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
