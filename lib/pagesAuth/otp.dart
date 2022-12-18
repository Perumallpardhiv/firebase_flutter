import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth1/auth/auth.dart';
import 'package:flutter_auth1/home.dart';
import 'package:flutter_auth1/pagesAuth/phoneAuth.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class otp extends StatefulWidget {
  String verifyId = "";

  otp(this.verifyId);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  AuthClass authClass = AuthClass();
  var code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 112, 95),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: 350,
                  height: 350,
                  child: Lottie.asset(
                    'assets/lottie.json',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'VERIFICATION',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 71, 47, 38),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your OTP code number",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Pinput(
                          length: 6,
                          // defaultPinTheme: defaultPinTheme,
                          // focusedPinTheme: focusedPinTheme,
                          // submittedPinTheme: submittedPinTheme,
                          showCursor: true,
                          onCompleted: (pin) {
                            print(pin);
                          },
                          onChanged: ((value) {
                            code = value;
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      GestureDetector(
                        onTap: () async {
                          try {
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: widget.verifyId,
                                    smsCode: code);
                            UserCredential userCredential =
                                await auth.signInWithCredential(credential);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (builder) => home()),
                                (route) => false);
                          } on FirebaseAuthException catch (e) {
                            final snackBar =
                                SnackBar(content: Text(e.message.toString()));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            elevation: 7,
                            color: Colors.brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                width: 1.5,
                                color: Colors.brown,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Verify',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Didn't you receive any code?",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 96, 66, 56),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
