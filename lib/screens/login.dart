import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fullapp/screens/forgot.dart';
import 'package:fullapp/screens/homepage.dart';
import 'package:fullapp/screens/signup.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// String p =
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginPageState extends State<LoginPage> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print('yes');
    } else {
      print('no');
    }
  }
TextEditingController loginemailController = TextEditingController();
TextEditingController loginpasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // var _formKey;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: loginemailController,
                      validator: ((value) {
                        if (value == '') {
                          return 'Please Fill the email';
                        } else if (!regExp.hasMatch(value!)) {
                          return 'Email Is Invalid';
                        }
                        return '';
                      }),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    TextFormField(
                      controller: loginpasswordController,
                      obscureText: obserText,
                      validator: (value) {
                        if (value == '') {
                          return 'Please fill password';
                        } else if (value!.length < 8) {
                          return 'Password is too short';
                        }
                        return '';
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                            },
                            child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  Container(
      width: 350,
      height: 50,
      child: ElevatedButton(

        onPressed: (() async{
          var loginemail = loginemailController.text.trim();
          var loginpassword = loginpasswordController.text.trim();
          try {
            final User? firebaseuser = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginemail, password: loginpassword)).user;
            if (firebaseuser!=null) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
            }else{
              print('check email and password');
            }
          }on FirebaseAuthException catch (e) {
            print('error $e');
            
          }

          validation();
        }),
        child: Text(
          "Login",
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
    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 213, 207, 207)),
                        onPressed: (() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => Forgotpage())));
                        }),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.black),
                        )),
                    Row(
                      children: [
                        Text('I dont have an account,   ',style: TextStyle(fontSize: 18),),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            'SignUp',
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
        ),
      ),
    );
  }
}
