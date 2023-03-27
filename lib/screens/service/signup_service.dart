import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fullapp/screens/login.dart';
import 'package:get/get.dart';

signupuser(
  String username,
  String userphone,
  String useremail,
  String userpassword,
)async{
  User? userid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance.collection('users').doc().set({
    'userName':username,
    'userPhone':userphone,
    'userEmail':useremail,
    'createdAt':DateTime.now(),
    // 'userId':userid.uid,
    }).then((value) => {
      FirebaseAuth.instance.signOut(),
      Get.to(()=> LoginPage()),
    });
  } on FirebaseAuthException catch (e) {
    print("error $e");
    
  }
}