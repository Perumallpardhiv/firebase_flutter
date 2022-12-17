import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth1/auth/auth.dart';
import 'package:flutter_auth1/pagesAuth/forgot_pwd.dart';
import 'package:flutter_auth1/home.dart';
import 'package:flutter_auth1/pagesAuth/signIn.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  AuthClass authClass = AuthClass();
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _pwdCont = TextEditingController();
  TextEditingController _conformPwdCont = TextEditingController();
  TextEditingController _userNameCont = TextEditingController();
  TextEditingController _phoneNumCont = TextEditingController();
  TextEditingController _descCont = TextEditingController();
  var date = DateTime.now().toString();
  late var dateParse = DateTime.parse(date);
  late var formattedData =
      "${dateParse.day}-${dateParse.month}-${dateParse.year}";

  bool pwd = true;
  bool conf_pwd = true;

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
                  'SIGN UP',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 71, 47, 38),
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  child: TextFormField(
                    //! autofillHints: [AutofillHints.name],
                    controller: _userNameCont,
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 199, 142, 122),
                      labelText: "User Name ...",
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
                    controller: _phoneNumCont,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
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
                    controller: _descCont,
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 199, 142, 122),
                      labelText: "Add Something about your self ...",
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
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _conformPwdCont,
                    obscureText: conf_pwd,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          conf_pwd == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.brown,
                        ),
                        onPressed: () {
                          setState(() {
                            conf_pwd = !conf_pwd;
                          });
                        },
                      ),
                      labelText: "Conform Password ...",
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
                    if (_pwdCont.text.trim() == _conformPwdCont.text.trim()) {
                      await authClass.emailSignUp(context,
                          _emailCont.text.trim(), _pwdCont.text.trim());

                      // add user details for profile page
                      var user = await FirebaseAuth.instance.currentUser;

                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(user!.uid)
                          .set(
                        {
                          'uid': user.uid,
                          'user name': _userNameCont.text.trim(),
                          'phone number': int.parse(_phoneNumCont.text.trim()),
                          'email': _emailCont.text.trim(),
                          'description': _descCont.text.trim(),
                          'imageUrl': '',
                          'joinedAt': formattedData,
                          'createdAt': Timestamp.now(),
                          'github': 'https://github.com/',
                          'linkDin': 'https://www.linkedin.com/',
                        },
                      );
                    } else {
                      final snackbar = SnackBar(
                          content: Text(
                              "Your password and confirmation password do not match."));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
                        'Sign Up',
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
                    Text("If you already have account? "),
                    SizedBox(
                      width: 1,
                    ),
                    GestureDetector(
                      child: Text(
                        " Login ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
