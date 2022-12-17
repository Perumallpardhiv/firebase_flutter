import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth1/auth/auth.dart';
import 'package:flutter_auth1/pagesAuth/otp.dart';

class phoneAuth extends StatefulWidget {
  const phoneAuth({super.key});

  @override
  State<phoneAuth> createState() => _phoneAuthState();
}

class _phoneAuthState extends State<phoneAuth> {
  TextEditingController phoneCont = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                ),
                Text(
                  'REGISTRATION',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 71, 47, 38),
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Text(
                  "Add your phone number",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "we'll send you a verification code",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: EdgeInsets.all(28),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: phoneCont,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 199, 142, 122),
                            labelText: "Phone Number ...",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1.5,
                                color: Colors.brown,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1.5,
                                color: Colors.brown,
                              ),
                            ),
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '(+91)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        GestureDetector(
                          onTap: () async {
                            try {
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber:
                                    '${countryCode.text + phoneCont.text.trim()}',
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed:
                                    (FirebaseAuthException e) {},
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              otp(verificationId)));
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
                            } on FirebaseAuthException catch (e) {
                              final snackbar =
                                  SnackBar(content: Text(e.message.toString()));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
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
                                'Send OTP',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
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
