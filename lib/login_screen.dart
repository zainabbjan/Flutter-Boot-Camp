// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterworkshop/custom_widgets/reusable_text_formfield.dart';
import 'package:flutterworkshop/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                  validateText: 'Please Enter your name',
                  hint: 'UserName',
                  icon: Icon(Icons.person),
                ),

                ReusableTextFormField(
                    icon: Icon(Icons.email),
                    validateText: 'Enter your email please',
                    hint: 'Email'),
                ReusableTextFormField(
                    icon: Icon(Icons.visibility),
                    validateText: 'Enter your Password',
                    hint: 'Password'),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
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
    );
  }
}
