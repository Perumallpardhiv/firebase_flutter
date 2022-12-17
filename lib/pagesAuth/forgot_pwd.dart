import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotPW extends StatefulWidget {
  const forgotPW({super.key});

  @override
  State<forgotPW> createState() => _forgotPWState();
}

class _forgotPWState extends State<forgotPW> {
  TextEditingController _emailCont = TextEditingController();
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
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 71, 47, 38),
                    ),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Center(
                    child: Text(
                      "Enter Your Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      "We will send you a password reset link",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 60,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailCont,
                      obscureText: false,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 199, 142, 122),
                        labelText: "Email ...",
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: _emailCont.text.trim());
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                    "Password Resent Link Sent! Check your email"),
                              );
                            });
                      } on FirebaseAuthException catch (e) {
                        final snackbar =
                            SnackBar(content: Text(e.message.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 200,
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
                          'Reset Password',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
