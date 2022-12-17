import 'package:flutter/material.dart';
import 'package:flutter_auth1/auth/auth.dart';
import 'package:flutter_auth1/pagesAuth/forgot_pwd.dart';
import 'package:flutter_auth1/pagesAuth/phoneAuth.dart';
import 'package:flutter_auth1/pagesAuth/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _pwdCont = TextEditingController();
  bool pwd = true;
  AuthClass authClass = AuthClass();
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
                Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 71, 47, 38),
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () async {
                    await authClass.googleSignIn(context);
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
                        'Continue with Google',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => phoneAuth()));
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
                        'Continue with Mobile',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Or",
                  style: TextStyle(color: Colors.white, fontSize: 22),
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
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _pwdCont,
                    obscureText: pwd,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          pwd == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.brown,
                        ),
                        onPressed: () {
                          setState(() {
                            pwd = !pwd;
                          });
                        },
                      ),
                      labelText: "Password ...",
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
                  height: 27,
                ),
                GestureDetector(
                  onTap: () async {
                    await authClass.emailSignIn(
                        context, _emailCont.text.trim(), _pwdCont.text.trim());
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
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If you don't have account? "),
                    SizedBox(
                      width: 1,
                    ),
                    GestureDetector(
                      child: Text(
                        " SignUp ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) => signup()));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => forgotPW()));
                  },
                  child: Center(
                    child: Text(
                      " Forgot Password ? ",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
