import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth1/main.dart';
import 'package:flutter_auth1/pagesAuth/signIn.dart';

class deleteAuth extends StatefulWidget {
  const deleteAuth({super.key});

  @override
  State<deleteAuth> createState() => _deleteAuthState();
}

class _deleteAuthState extends State<deleteAuth> {
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _pwdCont = TextEditingController();
  bool pwd = true;

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
                  'DELETE ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 71, 47, 38),
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 27,
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
                    var userCredential = EmailAuthProvider.credential(
                        email: _emailCont.text.trim(),
                        password: _pwdCont.text.trim());

                    try {
                      await user!
                          .reauthenticateWithCredential(userCredential)
                          .then((value) {
                        user!.delete();
                      });
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(user!.uid)
                          .delete();
                      final snackBar = SnackBar(
                          content: Text(
                        "Deleted Successfully",
                        textAlign: TextAlign.center,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => signin()),
                          (route) => false);
                    } on FirebaseAuthException catch (e) {
                      final snackBar =
                          SnackBar(content: Text(e.message.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 120,
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
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      )),
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
