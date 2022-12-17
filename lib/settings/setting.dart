import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth1/settings/deleteAuth.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController _oldPwdCont = TextEditingController();
  TextEditingController _newPwdCont = TextEditingController();
  TextEditingController _emailCont = TextEditingController();
  bool old_pwd = true;
  bool new_pwd = true;
  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  UniqueKey keyTile = UniqueKey();
  UniqueKey keyTile2 = UniqueKey();
  UniqueKey keyTile3 = UniqueKey();

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void expandTile2() {
    setState(() {
      isExpanded2 = true;
      keyTile2 = UniqueKey();
    });
  }

  void expandTile3() {
    setState(() {
      isExpanded2 = true;
      keyTile2 = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile2() {
    setState(() {
      isExpanded2 = false;
      keyTile2 = UniqueKey();
    });
  }

  void shrinkTile3() {
    setState(() {
      isExpanded2 = false;
      keyTile2 = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 112, 95),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color.fromARGB(255, 118, 74, 58),
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 20, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SETTINGS",
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1.5,
                        color: Color.fromARGB(255, 71, 47, 38),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Color.fromARGB(255, 46, 32, 27),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Account",
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 54, 45),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Divider(
                      height: 15,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 3,
                      color: Color.fromARGB(255, 158, 112, 95),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ExpansionTile(
                            initiallyExpanded: isExpanded,
                            key: keyTile,
                            title: Text(
                              "Change Password",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 8, 7, 7),
                              ),
                            ),
                            childrenPadding: EdgeInsets.all(12),
                            children: [
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 60,
                                child: TextFormField(
                                  autofocus: false,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _oldPwdCont,
                                  obscureText: old_pwd,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        old_pwd == true
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.brown,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          old_pwd = !old_pwd;
                                        });
                                      },
                                    ),
                                    labelText: "Old Password ...",
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
                                child: TextFormField(
                                  autofocus: false,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _newPwdCont,
                                  obscureText: new_pwd,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        new_pwd == true
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.brown,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          new_pwd = !new_pwd;
                                        });
                                      },
                                    ),
                                    labelText: "New Password ...",
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
                                  if (_oldPwdCont.text.trim() != "" &&
                                      _newPwdCont.text.trim() != "") {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          child: AlertDialog(
                                            content: Text(
                                                'Are you sure to change the password ?'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    shrinkTile();
                                                  },
                                                  child: Text("Cancel")),
                                              TextButton(
                                                  onPressed: () async {
                                                    var userCred =
                                                        EmailAuthProvider
                                                            .credential(
                                                                email:
                                                                    user!.email ??
                                                                        "Null",
                                                                password:
                                                                    _oldPwdCont
                                                                        .text
                                                                        .trim());
                                                    try {
                                                      await user!
                                                          .reauthenticateWithCredential(
                                                              userCred)
                                                          .then((value) {
                                                        user!.updatePassword(
                                                            _newPwdCont.text
                                                                .trim());
                                                      });
                                                      shrinkTile();
                                                      _oldPwdCont.text = "";
                                                      _newPwdCont.text = "";
                                                      final snackBar = SnackBar(
                                                          content: Text(
                                                        "Updated Successfully",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    } on FirebaseAuthException catch (e) {
                                                      shrinkTile();
                                                      final snackBar = SnackBar(
                                                          content: Text(e
                                                              .message
                                                              .toString()));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Update")),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    final snackBar = SnackBar(
                                        content:
                                            Text("Password can't be null"));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 90,
                                        child: Card(
                                          elevation: 2,
                                          color: Colors.brown,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: BorderSide(
                                              width: 1.5,
                                              color: Colors.brown,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Save',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 3,
                      color: Color.fromARGB(255, 158, 112, 95),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ExpansionTile(
                          key: keyTile2,
                          initiallyExpanded: isExpanded2,
                          title: Text(
                            "Change Email Address",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 8, 7, 7),
                            ),
                          ),
                          childrenPadding: EdgeInsets.all(12),
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 60,
                              child: TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailCont,
                                decoration: InputDecoration(
                                  labelText: "New Email Address ...",
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
                              onTap: () {
                                if (_emailCont.text.trim() != "") {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          child: AlertDialog(
                                            content: Text(
                                                'Are you sure to change your email address?'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    shrinkTile2();
                                                  },
                                                  child: Text("Cancel")),
                                              TextButton(
                                                  onPressed: () async {
                                                    try {
                                                      await user!.updateEmail(
                                                          _emailCont.text
                                                              .trim());
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(user!.uid)
                                                          .update({
                                                        'email': _emailCont.text
                                                            .trim(),
                                                      });
                                                      shrinkTile2();
                                                      _emailCont.text = "";
                                                      final snackBar = SnackBar(
                                                          content: Text(
                                                        "Updated Successfully",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    } on FirebaseAuthException catch (e) {
                                                      shrinkTile2();
                                                      final snackBar = SnackBar(
                                                          content: Text(e
                                                              .message
                                                              .toString()));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Update")),
                                            ],
                                          ),
                                        );
                                      });
                                } else {
                                  final snackBar = SnackBar(
                                      content: Text("Email can't be null"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 160,
                                      child: Card(
                                        elevation: 2,
                                        color: Colors.brown,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: BorderSide(
                                            width: 1.5,
                                            color: Colors.brown,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Change Email',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
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
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 3,
                      color: Color.fromARGB(255, 158, 112, 95),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ExpansionTile(
                          key: keyTile3,
                          initiallyExpanded: isExpanded3,
                          title: Text(
                            "Language",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 8, 7, 7),
                            ),
                          ),
                          childrenPadding: EdgeInsets.all(12),
                          children: [],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 3,
                      color: Color.fromARGB(255, 158, 112, 95),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          backgroundColor: Color.fromARGB(255, 158, 112, 95),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => deleteAuth()));
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Delete Account",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 240, 92, 82),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.delete_outline,
                              size: 22,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
