import 'dart:convert';
import 'dart:ui';

import 'package:e_commerce_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  getLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var link = '${baseUrl}sign-in';

    var map = Map<String, dynamic>();
    map['email'] = emailController.text.toString();
    map['password'] = passwordController.text.toString();

    var response = await http.post(Uri.parse(link), body: map);

    // print('${response.body}');

    var data = jsonDecode(response.body);
    //print('${data['access_token']}');

    if (data['access_token'] != null) {
      sharedPreferences.setString('token', data['access_token']);
      print('${sharedPreferences.getString('token')}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 250),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 15, 0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Welcome",
                      style: GoogleFonts.pacifico(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 99, 150, 145)),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  TextFormField(
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Email field required';
                      }
                      if (!value.contains('@gmail.com')) {
                        return 'Invalid email';
                      }
                    }),
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      filled: true,
                      hintText: 'Enter your email',
                      labelText: 'Enter your email',
                      // hintStyle: TextStyle(),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.teal)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.orange)),

                      //end
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Password is empty';
                      }
                      if (value.length < 4) {
                        return 'Password is too short';
                      }
                      if (value.length > 10) {
                        return 'Password is too long';
                      }
                    }),
                    keyboardType: TextInputType.text,
                    obscureText: isObsicure,
                    obscuringCharacter: '*',
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsicure = !isObsicure;
                          });
                        },
                        icon: Icon(isObsicure == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      filled: true,
                      hintText: 'Enter your password',
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.teal)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.orange)),

                      //end
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          getLogin();
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => Page2()));
                        } else {
                          print('Something is wrong. Try again');
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromARGB(255, 135, 150, 148)),
                        child: Center(
                            child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: Text(
                    'Forget Password?',
                    style: TextStyle(fontSize: 20),
                  )),
                  SizedBox(
                    height: 95,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an Account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20, color: Colors.teal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isObsicure = true;
}
