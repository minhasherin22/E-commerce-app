import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fullapp/screens/login.dart';
import 'package:fullapp/screens/service/signup_service.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  void validation() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('yes');
    } else {
      print('no');
    }
  }


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value == '') {
                        return 'Please Fill User';
                      } else if (value!.length < 6) {
                        return 'UserName is too short';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == '') {
                        return 'Please fill the email';
                      } else if (!regExp.hasMatch(value!)) {
                        return 'Email Is Invalid';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: obserText,
                    validator: (value) {
                      if (value == '') {
                        return 'Please Fill Password';
                      } else if (value!.length < 8) {
                        return 'Password Is Too Short';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obserText = !obserText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(obserText==true?
                            Icons.visibility:Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == '') {
                        return 'Please Fill The Phone Number';
                      } else if (value!.length < 10) {
                        return 'Phone Number should be 10';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  Container(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: (() async{
          var username = usernameController.text.trim();
          var useremail = emailController.text.trim();
           var userphone = phoneController.text.trim();
            var userpassword = passwordController.text.trim();
          validation();
          await _auth.createUserWithEmailAndPassword(email: useremail, password: userpassword).then((value) => {
            log('user created'),
            signupuser(username, userphone, useremail, userpassword)
          });
        }),
        child: Text(
          "Sign up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22))),
      ),
    ),
                Row(
                      children: [
                        Text('I dont have an account,  ',style: TextStyle(fontSize: 18),),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.cyan, fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
