import 'package:flutter/material.dart';
import 'package:fullapp/screens/login.dart';
import 'package:fullapp/screens/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/shopping-removebg-preview.png'))),
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Ready to start shopping,sign-up',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Text(
                'To get started.',
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUp()));
                    }),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 55),
                        backgroundColor: const Color(0xff9b96d6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('Sign Up')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Already Have An Account? ',
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                        onTap: (() {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
                        }),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold),
                        ))
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
