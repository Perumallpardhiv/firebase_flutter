import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth1/auth/auth.dart';
import 'package:flutter_auth1/settings/information.dart';
import 'package:flutter_auth1/pagesAuth/signIn.dart';
import 'package:flutter_auth1/profilePage/profileEdit.dart';
import 'package:flutter_auth1/profilePage/profileView.dart';
import 'package:flutter_auth1/profilePage/textBtn.dart';
import 'package:flutter_auth1/settings/setting.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  AuthClass authClass = AuthClass();
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 112, 95),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .snapshots(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text("Loading ..."));
              }
              var details = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(user!.uid),
                  // Text(user!.isAnonymous == true ? "True" : "False"),
                  // Text(user!.metadata.creationTime!.toLocal().day.toString()),
                  // Text(user!.metadata.creationTime!.toLocal().hour.toString()),
                  // Text(user!.metadata.creationTime!.minute.toString()),
                  // Text(user!.displayName ?? "Null"),
                  // Text(user!.email ?? "Null"),
                  // Text(user!.phoneNumber ?? "Null"),
                  SizedBox(
                    height: 27,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 37),
                        child: Text(
                          'PROFILE',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 71, 47, 38),
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )),
                      Padding(
                        padding: EdgeInsets.only(right: 7),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.brown,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10)),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: '${details!['imageUrl']}' == ""
                          ? Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/fir-authentication-ab7c1.appspot.com/o/users%2Fprofile.jpg?alt=media&token=5daf7dda-6965-4b9e-a124-107994c11970',
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              '${details['imageUrl']}',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: Text(
                    user!.uid,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Center(child: Text(details['email'])),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => profileEdit()));
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
                            'Edit Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.brown,
                    endIndent: 40,
                    indent: 40,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ProfileMenu(
                    text: "My Account",
                    icon: Icons.person,
                    press: () {
                      print(MediaQuery.of(context).size.height);
                      print(MediaQuery.of(context).size.width);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => profileView()),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "Settings",
                    icon: Icons.settings,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => settings()),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "Information",
                    icon: Icons.perm_device_info_rounded,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => information()),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "LogOut",
                    icon: Icons.logout,
                    press: () async {
                      await authClass.logOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => signin()),
                          (route) => false);
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
