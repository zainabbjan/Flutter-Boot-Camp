// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterworkshop/custom_widgets/reusable_text_formfield.dart';
import 'package:flutterworkshop/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  signUpWithEmailandPassword() async {
    try {
      final UserCredential authResult =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passWordController.text.trim());
      await _firestore.collection('user').doc(authResult.user!.uid).set({
        'name': nameController.text.toString(),
        'email': emailController.text.toString(),
      });
    } catch (e) {
      print('Exception while authentication $e');
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),

                  ///
                  /// image widgt
                  ///
                  Image.asset(
                    'asset/images/logo.png',
                    scale: 30,
                  ),

                  ///
                  ///Register Text Widget
                  ///
                  Text(
                    'Create an Account',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700]),
                  ),

                  ///TextFomField Widget
                  ///
                  ReusableTextFormField(
                    controller: nameController,
                    validateText: 'Please Enter your name',
                    hint: 'UserName',
                    icon: Icon(Icons.person),
                  ),

                  ReusableTextFormField(
                      controller: emailController,
                      icon: Icon(Icons.email),
                      validateText: 'Enter your email please',
                      hint: 'Email'),
                  ReusableTextFormField(
                      controller: passWordController,
                      icon: Icon(Icons.visibility),
                      validateText: 'Enter your Password',
                      hint: 'Password'),
                  SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await signUpWithEmailandPassword();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Please fill all the fields')));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),

                  ///Stack widgt  just for understanding
                  ///
                  ///
                  // Stack(
                  //   children: [
                  //     Container(
                  //       height: 100,
                  //       width: 100,
                  //       color: Colors.red,
                  //       child: Text('dfk'),
                  //     ),
                  //     Icon(Icons.person),
                  //     Container(
                  //       height: 50,
                  //       width: 50,
                  //       color: Colors.blue,
                  //       child: Text('data'),
                  //     ),
                  //     Positioned(
                  //       top: 20,
                  //       right: 5,
                  //       child: Container(
                  //         height: 50,
                  //         width: 50,
                  //         color: Colors.green,
                  //         child: Text('data'),
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
